class LocalSetting
  attr_accessor :local, :name, :user, :status
  attr_reader   :base_dir, :full_path, :backup_path
  
  def initialize(local, name, user = false)
    
    @local        = local       # Path from root or from User directory
    @name         = name        # Name of the file
    @user         = user        # In User directory?
    @status       = nil         # Requires update or backup?
    
    @base_dir     = @user ? "/Users/Jack_Barry/" : "/"
    @full_path    = @base_dir + @local + @name
    @backup_path  = "/Users/Jack_Barry/Documents/ConfigNewton/config_files/" + @name
  end
  
  def choose_action
    repo = Repo.new("/Users/Jack_Barry/Documents/ConfigNewton/")
    
    if !File.file?(@full_path) && !File.file?(@backup_path)
      @status = :not_present
    elsif File.file?(@full_path) && !File.file?(@backup_path)
      @status = :no_backup
    elsif !File.file?(@full_path) && File.file?(@backup_path)
      @status = :no_local
    elsif !FileUtils.identical?(@full_path, @backup_path)
      last_update = File.mtime(@full_path)
      last_backup = repo.log('personal', "config_files/#{@name}", max_count: 1)[0].date
      
      if last_backup < last_update
        puts "Would you like to make a backup for #{@name}? (y) or (n)"
        print "> "
        backup = gets.chomp.downcase
        if backup == "y"
          FileUtils.cp(@full_path, @backup_path)
          @status = :backed_up
        else
          @status = :not_backed_up
        end
      elsif last_backup > last_update
        puts "Would you like to update #{@name} on your machine? (y) or (n)"
        print "> "
        update = gets.chomp.downcase
        if update == "y"
          FileUtils.cp(@backup_path, @full_path)
          @status = :updated
        else
          @status = :not_updated
        end
      end
    end
  end
end
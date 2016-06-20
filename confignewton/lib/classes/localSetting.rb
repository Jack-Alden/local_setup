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
    repo = Repo.new("/Users/Jack_Barry/Documents/ConfigNewton/config_files/")
    
    if !FileUtils.identical?(@full_path, @backup_path)
      last_update = File.mtime(@full_path)
      last_backup = repo.log('personal', @backup_path, max_count: 1)[0].date
      
      if last_backup < last_update
        FileUtils.cp(@full_path, @backup_path)
        @status = "backed up"
      elsif last_backup > last_update
        FileUtils.cp(@backup_path, @full_path)
        @status = "updated"
      end
    end
  end
end
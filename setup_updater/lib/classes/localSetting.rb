class LocalSetting
  attr_accessor :local, :name, :user
  attr_reader   :base_dir, :full_path, :backup_path
  
  def initialize(local, name, user = false)
    
    @local        = local       # Path from root or from User directory
    @name         = name        # Name of the file
    @user         = user        # In User directory?
    
    @base_dir     = @user ? "/Users/Jack_Barry/" : "/"
    @full_path    = @base_dir + @local + @name
    @backup_path  = "/Users/Jack_Barry/Documents/confignewton/config_files" + @name
  end
  
  def choose_action
    unless FileUtils.identical?(@full_path, @backup_path)
      
    end
  end
end
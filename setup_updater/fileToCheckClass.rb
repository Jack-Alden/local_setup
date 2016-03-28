require          'fileutils'
require_relative 'colorizeClass.rb'

class FileToCheck
  
  attr_accessor :modifier, :file_name
  attr_reader   :root_dir, :edit_path, :backup_add_path, :backup_path
  
  def initialize(user_path = false, modifier = "", file_name)
    @modifier   = modifier
    @file_name       = file_name
  # this parameter will get updated when I figure out how to find root path on all machines
    @root_dir        = "/"
    user_path == true ? @user_path = "Users/Jack_Alden/" : @user_path = ""
    @edit_path       = @root_dir + @user_path + @modifier + @file_name
  # backup_add_path points to where local_setup is kept
    @backup_add_path = "/Users/Jack_Alden/Documents/local_setup/"
    @backup_path     = @backup_add_path + @file_name
  end
  
  def need_to_add?
    !File.file?(@backup_path)
  end
  
  def updated?
    !FileUtils.identical?(@backup_path, @edit_path)
  end
end
require          'fileutils'
require_relative 'colorize.rb'

class FileToCheck
  
  attr_accessor :root_modifier, :file_name
  attr_reader   :root_dir, :edit_path, :backup_add_path, :backup_path
  
  def initialize(root_modifier = "", file_name)
    @root_modifier   = root_modifier
    @file_name       = file_name
  # this parameter will get updated when I figure out how to find root path on all machines
    @root_dir        = "/Users/Jack_Alden/"
    @edit_path       = @root_dir + @root_modifier + @file_name
  # update_path points to where local_setup is kept
    @backup_add_path = @root_dir + "Documents/local_setup/"
    @backup_path     = @backup_add_path + @file_name
  end
  
  def need_to_add?
    !File.file?(@backup_path)
  end
  
  def updated?
    !FileUtils.identical?(@backup_path, @edit_path)
  end
end
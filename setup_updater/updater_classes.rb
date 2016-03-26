require          'fileutils'
require_relative 'colorize.rb'

class FileToCheck
  
  attr_accessor :file_name
  attr_reader   :root_dir, :edit_path, :backup_path
  
  def initialize(file_name)
    @file_name   = file_name
  # this parameter will get updated when I figure out how to find root path on all machines
    @root_dir    = "/Users/Jack_Alden/"
    @edit_path   = @root_dir + @file_name
  # update_path points to where local_setup is kept
    @backup_path = @root_dir + "Documents/local_setup/" + @file_name
  end
  
  def updated?
    FileUtils.identical?(@backup_path, @edit_path)
  end
end
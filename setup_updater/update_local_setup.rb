require_relative 'configs_list.rb'

configs_list = [
  ".bash_profile",
  ".gitconfig",
  ["Library/Application Support/KomodoEdit/9.3/schemes/", "Alden_Code.ksf"]
]

updates    = []
added      = []
no_changes = []

configs_list.each do |f|
  f = FileToCheck.new(*f)
  
  if f.need_to_add?
    FileUtils.cp(f.edit_path, f.backup_add_path)      # 1
    added.push(f.file_name)
  elsif f.updated?
    FileUtils.cp(f.edit_path, f.backup_path)      # 1
    updates.push(f.file_name)
  else
    no_changes.push(f.file_name)
  end
end

if updates.empty? && added.empty?
  puts "Nothing to update!".green
else
  unless added.empty?
    puts "Added the following files to your backup directory".green
    added.each { |item| puts ("    " + item).yellow }               # 2
  end
  unless updates.empty?
    puts "Updated the following files in your backup directory".green
    updates.each { |item| puts ("    " + item).yellow }             # 2
  end
  unless no_changes.empty?
    puts "No changes made to the following files".green
    no_changes.each { |item| puts ("    " + item).yellow }          # 2
  end
end

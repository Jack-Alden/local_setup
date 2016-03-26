require_relative 'configs_list.rb'

configs_list = [
  ".bash_profile",
  ".gitconfig"
]

updates    = []
no_changes = []

configs_list.each do |f|
  f = FileToCheck.new(f)
  
  unless f.updated?
    FileUtils.cp(f.edit_path, f.backup_path)
    updates.push(f.file_name)
  else
    no_changes.push(f.file_name)
  end
end

puts updates

if updates.empty?
  puts "Nothing to update!".green
else
  puts "Updated the following files in your backup directory".green
  updates.each { |item| puts ("    " + item).yellow }
  unless no_changes.empty?
    puts "No changes made to the following files".green
    no_changes.each { |item| puts ("    " + item).yellow }
  end
end

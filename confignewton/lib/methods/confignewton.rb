require_relative '../modules/configList'

class ListOfConfigs
  include ConfigList
end

def confignewton
  configs     = ListOfConfigs.new
  backed_up   = []
  updated     = []
  no_changes  = []
  no_backup   = []
  no_local    = []
  not_present = []
  
  configs.config_list.each do |f|
    f = LocalSetting.new(*f)
    f.choose_action
    if f.status == "backed up"
      backed_up.push(f.name)
    elsif f.status == "updated"
      updated.push(f.name)
    elsif f.status == "no backup"
      no_backup.push(f.name)
    elsif f.status == "no local"
      no_local.push(f.name)
    elsif f.status == "nonexistent"
      not_present.push(f.name)
    elsif f.status == nil
      no_changes.push(f.name)
    end
  end
  
  print_out(backed_up, updated, no_backup, no_local, not_present, no_changes)
end
  
def print_out(bu, ud, nb, nl, np, nc)
  if bu.empty? && ud.empty? && np.empty?
    puts "All clear boss!".green
  else
    unless bu.empty?
      puts "Backed up the following files from your machine".green
      bu.each { |item| puts ("    " + item.to_s).yellow }
    end
    unless ud.empty?
      puts "Updated the following files from your backup repo".green
      ud.each { |item| puts ("    " + item.to_s).yellow }
    end
    unless nc.empty?
      puts "No changes made to the following files".green
      nc.each { |item| puts ("    " + item.to_s).yellow }
    end
    unless nb.empty?
      puts "These files do not have a backup yet".red
      nb.each { |item| puts ("    " + item.to_s).yellow }
    end
    unless nl.empty?
      puts "These backups do not currently have a corresponding local file".red
      nl.each { |item| puts ("    " + item.to_s).yellow }
    end
    unless np.empty?
      puts "These files could not be found in either directory".red
      np.each { |item| puts ("    " + item.to_s).yellow }
    end
  end
end
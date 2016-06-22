require_relative '../modules/configList'

class ListOfConfigs
  include ConfigList
end

def confignewton
  configs       = ListOfConfigs.new
  backed_up     = []
  not_backed_up = []
  updated       = []
  not_updated   = []
  no_changes    = []
  no_backup     = []
  no_local      = []
  not_present   = []
  
  configs.config_list.each do |f|
    f = LocalSetting.new(*f)
    f.choose_action
    if f.status == "backed up"
      backed_up.push(f.name)
    elsif f.status == "not backed up"
      not_backed_up.push(f.name)
    elsif f.status == "updated"
      updated.push(f.name)
    elsif f.status == "not updated"
      not_updated.push(f.name)
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
  
  print_out( backed_up,
             not_backed_up,
             updated,
             not_updated,
             no_backup,
             no_local,
             not_present,
             no_changes
            ) { |a| a.each { |item| puts ("    " + item.to_s).yellow } }
end
  
def print_out(bu, nbu, ud, nud, nb, nl, np, nc)
  if bu.empty? && nbu.empty? && ud.empty? && nud.empty? && np.empty?
    puts "All clear boss!".green
  else
    unless bu.empty?
      puts "Backed up the following files from your machine".green
      yield(bu)
    end
    unless nbu.empty?
      puts "The following files were not backed up from your machine".red
      yield(nbu)
    end
    unless ud.empty?
      puts "Updated the following files from your backup repo".green
      yield(ud)
    end
    unless nud.empty?
      puts "The following files were not updated from your backup repo".red
      yield(nud)
    end
    unless nb.empty?
      puts "These files do not have a backup yet".red
      yield(nb)
    end
    unless nl.empty?
      puts "These backups do not currently have a corresponding local file".red
      yield(nl)
    end
    unless np.empty?
      puts "These files could not be found in either directory".red
      yield(np)
    end
    unless nc.empty?
      puts "No changes made to the following files".green
      yield(nc)
    end
  end
end
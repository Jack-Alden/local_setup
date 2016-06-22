require_relative '../modules/configList'

class ListOfConfigs
  include ConfigList
end

def confignewton
  configs       = ListOfConfigs.new
  tracking      = {
                    backed_up:      [],
                    not_backed_up:  [],
                    updated:        [],
                    not_updated:    [],
                    no_backup:      [],
                    no_local:       [],
                    not_present:    [],
                    no_changes:     []
                  }
  
  configs.config_list.each do |f|
    f = LocalSetting.new(*f)
    f.choose_action
    if f.status == nil
      tracking[:no_changes].push(f.name)
    else
      tracking[f.status].push(f.name)
    end
  end
  
  print_out( tracking[:backed_up],
             tracking[:not_backed_up],
             tracking[:updated],
             tracking[:not_updated],
             tracking[:no_backup],
             tracking[:no_local],
             tracking[:not_present],
             tracking[:no_changes]
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
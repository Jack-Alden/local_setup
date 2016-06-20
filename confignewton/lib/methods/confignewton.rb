class ListOfConfigs
  include ConfigList
end

def confignewton
  configs     = ListOfConfigs.new
  backed_up   = []
  updated     = []
  no_changes  = []
  
  configs.config_list.each do |f|
    f = LocalSetting.new(*f)
    f.choose_action
    if f.status == "backed up"
      backed_up.push(f.name)
    elsif f.status == "updated"
      updated.push(f.name)
    elsif f.status == nil
      no_changes.push(f.name)
    end
  end
  
  if backed_up.empty? && updated.empty?
    puts "All clear boss!".green
  else
    unless backed_up.empty?
      puts "Backed up the following files from your machine".green
      yield
    end
    unless updated.empty?
      puts "Updated the following files from your backup repo".green
      yield
    end
    unless no_changes.empty?
      puts "No changes made to the following files".green
      yield
    end
  end
end
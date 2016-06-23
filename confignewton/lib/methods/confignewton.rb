require_relative '../modules/configList'

class ListOfConfigs
  include ConfigList
end

def confignewton
  configs         = ListOfConfigs.new
  tracking_params = [ :backed_up,
                      :not_backed_up,
                      :updated,
                      :not_updated,
                      :no_backup,
                      :no_local,
                      :not_present,
                      :no_changes
                    ]
  phrases         = [
                      "Backed up the following files on your machine".green,
                      "The following files were not backed up on your machine".red,
                      "Updated the following files from your backup repo".green,
                      "The following files were not updated from your backup repo".red,
                      "These files do not have a backup yet".red,
                      "These backups do not have a corresponding local file".red,
                      "These files could not be found in either directory".red,
                      "No changes made to the following files".green
                    ]
  tracking = {}
  tracking_params.zip(phrases).each { |param, phrase| tracking[param] = [phrase, []] }
  
  configs.config_list.each do |f|
    f = LocalSetting.new(*f)
    f.choose_action
    if f.status == nil
      tracking[:no_changes][1].push(f.name)
    else
      tracking[f.status][1].push(f.name)
    end
  end
  
  print_out(tracking)
end
  
def print_out(t_dict)
  all_clear       = [ :backed_up,
                      :not_backed_up,
                      :updated,
                      :not_updated,
                      :not_present
                    ]
  all_clear_bool  = true
  
  for i in all_clear do
    all_clear_bool = false if t_dict[i][1].empty?
  end
  
  if all_clear_bool == true
    puts "All clear boss!".green
  else
    t_dict.each do |key, value|
      unless value[1].empty?
        puts value[0]
        value[1].each { |item| puts ("    " + item.to_s).yellow }
      end
    end
  end
end
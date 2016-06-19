class ListOfConfigs
  include ConfigList
end

def confignewton
  configs = ListOfConfigs.new
  
  configs.config_list.each do |f|
    f = LocalSetting.new(*f)
    f.choose_action
  end
end
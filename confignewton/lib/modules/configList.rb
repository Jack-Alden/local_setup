module ConfigList
  attr_reader :config_list
  def initialize
    @config_list =  [
      # [ "path from root or User directory", "filename", User directory? ]
    ]
  end
end
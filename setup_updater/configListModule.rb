module ConfigList
  attr_reader :config_list
  def initialize
    @config_list = [
      ["", ".bash_profile", true],
      ["", ".gitconfig", true],
      ["Library/Application Support/KomodoEdit/9.3/schemes/", "Alden_Code.ksf", true],
      ["Library/Preferences/", "com.googlecode.iterm2.plist", true],
      ["Library/Preferences/", "com.activestate.KomodoEdit.plist", true],
      ["private/etc/apache2/","httpd.conf", false],
      ["private/etc/", "hosts", false]
    ]
  end
end
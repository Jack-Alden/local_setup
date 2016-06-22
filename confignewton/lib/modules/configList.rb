module ConfigList
  attr_reader :config_list
  def initialize
    @config_list = [
      # [ "path from root or User directory", "filename", User directory? ]
      ["", ".bash_profile", true],
      ["", ".gitconfig", true],
      ["Library/Application Support/KomodoEdit/10.0/schemes/", "Alden_Code.ksf", true],
      ["Library/Preferences/", "com.googlecode.iterm2.plist", true],
      ["Library/Preferences/", "com.activestate.KomodoEdit.plist", true],
      ["private/etc/apache2/","httpd.conf", false],
      ["private/etc/", "hosts", false]
      
      # Basic Tests
      # ["", "missingBothTestUser", true],
      # ["", "missingBothTestRoot", false],
      # ["Library/Preferences/", "missingBothTestUserWithMod", true],
      # ["private/etc/", "missingBothTestRootWithMod", false],
      # ["", "missingBackupTestUser", true],
      # ["", "missingBackupTestRoot", false],
      # ["Library/Preferences/", "missingBackupTestUserWithMod", true],
      # ["private/etc/", "missingBackupTestRootWithMod", false],
      # ["", "missingLocalTestUser", true],
      # ["", "missingLocalTestRoot", false],
      # ["Library/Preferences/", "missingLocalTestUserWithMod", true],
      # ["private/etc/", "missingLocalTestRootWithMod", false]
    ]
  end
end
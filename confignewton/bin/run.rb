require 'fileutils'
require 'grit'
include Grit

current = File.expand_path('../../', __FILE__)
Dir["#{current}/lib/**/*.rb"].each { |f| require f }

confignewton
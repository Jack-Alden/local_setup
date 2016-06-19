current = File.expand_path('../../', __FILE__)
Dir["#{current}/**/*.rb"].each { |f| require f }

require 'grit'
include Grit

confignewton
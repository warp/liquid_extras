require 'liquid'

%w{filters tags}.each do |dir|
  Dir[File.join(File.dirname(__FILE__), 'liquid_extras', dir, '*.rb')].each { |lib| require lib }
end

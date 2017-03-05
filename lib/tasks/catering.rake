require 'rubygems'
require 'csv'
require 'build_caterings'

namespace :catering do
  task :import => [:environment] do
    BuildCaterings.new
    puts 'done :)'
  end
end
# coding: utf-8
require 'rake/clean'
C_TEMPLATE="template.c"
ERB_TEMPLATE="desc_template.erb"
RAKE_FILE="childRake.rb"

DIRS=%w{a b c d}

DIRS.each do |dir|
  directory dir

  file dir do
    cp C_TEMPLATE,"#{dir}/#{dir}.c"
    cp RAKE_FILE,"#{dir}/Rakefile"
    cp ERB_TEMPLATE,"#{dir}/desc_#{dir}.erb"
  end
end

task :default => DIRS

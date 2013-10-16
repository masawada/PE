require 'rake/clean'
C_TEMPLATE="template.c"
RAKE_FILE=".childRake"
TEST_TYPE = "rb"

DIRS=%w{a b c d}

DIRS.each do |dir|
  directory dir

  file dir do
    cp C_TEMPLATE,"#{dir}/#{dir}.c"
    cp RAKE_FILE,"#{dir}/Rakefile"
    sh "touch #{dir}/#{dir}.#{TEST_TYPE}"
  end
end

task :default => DIRS

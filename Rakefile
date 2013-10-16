require 'rake/clean'
SRC=FileList["*.c"]
BIN=SRC.ext("")
TESTER=FileList["*.rb"]

CLEAN.include(BIN)

rule /^(#{BIN.join("|")})$/oi => "#$1.c" do |t|
  sh "clang -o #{t.name} #{t.source}"
end

task :default => BIN do 
  Rake::Task[:test].invoke
end

task :test => TESTER do
  BIN.each do |bin|
    Dir.glob("#{bin}*.in").each do |input|
      puts "diff <(./#{bin} < #{input}) <(ruby #{bin}.rb < #{input})"
      system("zsh","-c","diff <(./#{bin} < #{input}) <(ruby #{bin}.rb < #{input})")
    end
  end
end

require 'rake/clean'
SRC=FileList["*.c"]
BIN=SRC.ext("")
TEST_TYPE="rb" # テストに使う言語
TESTER=SRC.ext(TEST_TYPE)
SHELL="zsh" # bashかzshで

CLEAN.include(BIN)

CC="gcc"   # 提出版以外はclang推奨
CFLAGS=""  # お好み
LIBS=""    # 共有ライブラリ ex. -lm

rule /^(#{BIN.join("|")})$/oi => "#$1.c" do |t|
  sh "#{CC} #{CFLAGS} #{t.source} #{LIBS} -o #{t.name} "
end

task :default => [BIN,:test]

task :test => TESTER do
  BIN.each do |bin|
    Dir.glob("#{bin}*.in").each do |input|
      puts "diff <(./#{bin} < #{input}) <(ruby #{bin}.rb < #{input})"
      system(SHELL,"-c","diff <(./#{bin} < #{input}) <(ruby #{bin}.rb < #{input})")
    end
  end
end

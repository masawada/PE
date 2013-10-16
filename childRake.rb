# coding: utf-8
require 'rake/clean'
SRC=FileList["*.c"]
BIN=SRC.ext("")
TEST_TYPE="rb" # テストに使う言語
TESTER=SRC.ext(TEST_TYPE)
SHELL="zsh" # bashかzshで
SUBMIT_PREFIX="desc"

CLEAN.include(BIN)

CC="gcc"   # 提出版以外はclang推奨
CFLAGS=""  # お好み
LIBS=""    # 共有ライブラリ ex. -lm

rule /^(#{BIN.join("|")})$/oi => "#$1.c" do |t|
  sh "#{CC} #{CFLAGS} #{t.source} #{LIBS} -o #{t.name} "
end

task :default => [BIN,:test,:desc]

desc "テスト"
task :test => TESTER do
  BIN.each do |bin|
    Dir.glob("#{bin}*.in").each do |input|
      puts "diff <(./#{bin} < #{input}) <(ruby #{bin}.rb < #{input})"
      system(SHELL,"-c","diff <(./#{bin} < #{input}) <(ruby #{bin}.rb < #{input})")
    end
  end
end

desc "提出ファイル作成"
task :desc => BIN do
  BIN.each do |bin|
    ENV["PE_PREFIX"] = bin
    sh "erb desc_#{bin}.erb > desc_#{bin}.txt"
  end
end

MAIL_ADDRESS="hoge@jed.uec.ac.jp"
desc "提出"
#task :submit => :desc

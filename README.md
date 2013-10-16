Programming Exercise
===
Rubyがない環境に人権はありません  
エディタはVimのものを使用しましょう  
説明文はtxtじゃなくてerbに書くといいんじゃないかな  
じゃんじゃんforkして使いやすいものにしましょう。

### 使い方
cloneしてRakefileがある場所でrakeしてください。  
全部解く気ない人はrake aとかでもいいです。  

こんな感じにワークスペースができます。

```
.
├── README.md
├── Rakefile
├── a
│   ├── Rakefile
│   ├── a.c
│   └── desc_a.erb
├── b
│   ├── Rakefile
│   ├── b.c
│   └── desc_b.erb
├── c
│   ├── Rakefile
│   ├── c.c
│   └── desc_c.erb
├── childRake.rb
├── d
│   ├── Rakefile
│   ├── d.c
│   └── desc_d.erb
├── desc_template.erb
└── template.c
```

それぞれA,B,C,D問題に対応しています。
以降の作業はワークスペース内で行ってください。


#### テスト
作成したプログラムのテストのようなことを行うことができます。  

1. まずワークスペース内のRakefileを編集してTEST\_TYPEを自分のメイン言語に設定します。  
2. 次に選択した言語を利用して問題を解きます。ファイル名は実行ファイル名.rbとかにします。
3. テストケースを作ります。名前は実行ファイル名\*.inとかにします
4. ```rake test```でテストを開始します。なお、bashかzshが入ってないとダメな模様

#### 説明
```rake desc```で提出用のファイルを自動作成できます。  
desc_hoge.erbを元にdesc_hoge.txtが作られます。ソースコードや入出力例などが自動で挿入されます。  
desc_hoge.txtの方に原稿を書くとおもしろいことになるので非推奨。

#### 提出
```rake submit```で担当教員にメールを投げます。近日追加

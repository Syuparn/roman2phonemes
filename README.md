# roman2phonemes
ローマ字文字列を音素(子音、母音)ごとにスペース区切り

# 使い方
ヘボン式ローマ字を母音、子音ごとにスペースで区切ります。

```:input.txt
konnichiwa sekai
```

```:output.txt
k o n n i ch i w a s e k a i 
```

# 必要なソフトウェア
追加でインストールするものは特にありません。
（Windows版はPowerShellの`-replace`コマンド、Linuxはsedを使用）

# 実行方法
## Linux版
ターミナルから以下のように実行してください。

```bash
$ cat input.txt | bash ./roman2phoneme.sh > output.txt
```

## Windows版
コマンドプロンプトから以下のように実行してください。

```
powershell -NoProfile -ExecutionPolicy Unrestricted -File ./roman2phoneme.ps1 input.txt output.txt
```

# 区切り方の違い
（例はLinux版、Windows版も同様）

## `./roman2phoneme.sh`

促音「っ」を`Q`で表し、モーラ内の他の子音と区切ります。

```bash
$ echo "shikkari zasshi matchi rakkyo namba dempa" | bash ./roman2phoneme.sh
sh i Q k a r i z a Q sh i m a Q ch i r a Q ky o n a m b a d e m p a 
```

## `./roman2phoneme_ignoreQ.sh`

促音「っ」はモーラ内の他の子音とひとかたまりで扱われます。最もナイーブな変換です。

```bash
$ echo "shikkari zasshi matchi rakkyo namba dempa" | bash ./roman2phoneme_ignoreQ.sh 
sh i kk a r i z a ssh i m a tch i r a kky o n a N b a d e N p a 
```

## `./roman2phoneme_withN.sh`

促音「っ」を`Q`で表し、他の子音と区切ります。

さらに、撥音「ん」を`N`で表し、ナ行子音、マ行子音と区別します。

```bash
$ echo "shikkari zasshi matchi rakkyo namba dempa" | bash ./roman2phoneme_withN.sh 
sh i Q k a r i z a Q sh i m a Q ch i r a Q ky o n a N b a d e N p a 
```

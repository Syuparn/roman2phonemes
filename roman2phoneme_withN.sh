#!/bin/bash

# 撥音「ん」を"N"に置き換え前後にスペースを入れる
# NOTE: 母音のスペース区切りより先に変換しないとマ行が誤って「N+母音」になってしまう
sed -r "s/([nm])([^yaiueo])/ N \2 /g" |
# 母音の前後にスペースを入れる
sed -r "s/([aiueo])/ \1 /g" |
# 促音「っ」を"Q"に置き換え前後にスペースを入れる(チャ行以外)
sed -r "s/([^ \f\n\r\taiueo])(\1)/ Q \2/g" |
# 促音「っ」を"Q"に置き換えの前後にスペースを入れる(チャ行)
sed -r "s/tch/Q ch/" |
# 空白が連続する場合一つだけにする(見た目をきれいに)
sed -r "s/[ \f\n\r\t]+/ /g"
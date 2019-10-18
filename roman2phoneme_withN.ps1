Param($InputFile,$OutputFile)

# ファイルからテキスト読み込む
$(Get-Content $InputFile) `
    -replace "([nm])([^yaiueo])", " N `$2 " `
    -replace "([aiueo])", " `$1 " `
    -replace "([^ \f\n\r\taiueo])(\1)", " Q `$2" `
    -replace "tch", "Q ch" `
    -replace "[ \f\n\r\t]+", " " |
    <# 置換結果を(utf-8形式で)ファイルに保存 #>
    Set-Content -Encoding UTF8 $OutputFile

<#
置換は上から順に
 撥音「ん」を"N"に置き換え前後にスペースを入れる
 (NOTE: 母音のスペース区切りより先に変換しないとマ行が誤って「N+母音」になってしまう)
 母音の前後にスペースを入れる
 促音「っ」を"Q"に置き換え前後にスペースを入れる(チャ行以外)
 促音「っ」を"Q"に置き換えの前後にスペースを入れる(チャ行)
 空白が連続する場合一つだけにする(見た目をきれいに)
#>
# NOTE: 行の途中にコメントが書けなかったためここにコメント
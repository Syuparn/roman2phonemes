Param($InputFile,$OutputFile)

# ファイルからテキスト読み込む
$(Get-Content $InputFile) `
    -replace "([aiueo])", " `$1 " `
    -replace "([nm])([^y])", " `$1 `$2 " `
    -replace "[ \f\n\r\t]+", " " |
    <# 置換結果を(utf-8形式で)ファイルに保存 #>
    Set-Content -Encoding UTF8 $OutputFile

<#
置換は上から順に
 母音の前後にスペースを入れる
 撥音「ん」の前後にスペースを入れる
 空白が連続する場合一つだけにする(見た目をきれいに)
#>
# NOTE: 行の途中にコメントが書けなかったためここにコメント
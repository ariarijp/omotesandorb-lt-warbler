# coding: utf-8
require 'csv'

# 引数に渡された郵便番号CSVから、表参道エリアの住所を行のみ抽出して、UTF-8でout.csvに書き出す
File.open('out.csv', 'w') do |out|
  File.foreach(ARGV[0]).each do |line|
    # 郵便番号CSVはSJISなのでUTF-8に変換
    line.encode!('UTF-8', 'Windows-31J')

    csv_arr = CSV.parse_line(line)

    # http://ja.wikipedia.org/wiki/%E8%A1%A8%E5%8F%82%E9%81%93_%28%E5%8E%9F%E5%AE%BF%29
    if /神宮前|[北南]青山/ =~ csv_arr[8]
      out.write(line)
    end
  end
end

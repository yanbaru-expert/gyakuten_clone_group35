require 'csv'

namespace :import_csv do
  desc "textsテーブルにCSVデータをインポートするタスク"
  task texts: :environment do
    path = "db/csv_data/text_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "インポートの処理を開始"
    begin
      Text.transaction do
        Text.create!(list)
      end
        puts "テキスト教材のインポート完了"
    rescue => e
      puts "#{e.class}: #{e.message}"
      puts "------------------------"
      puts e.backtrace
      puts "------------------------"
      puts "テキスト教材のインポートに失敗"
    end
  end
end
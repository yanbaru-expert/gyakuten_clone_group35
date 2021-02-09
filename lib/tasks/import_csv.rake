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

namespace :import_csv do
  desc "CSVデータをインポートするタスク"

  # タスク名 => movies
  task movies: :environment do
    # インポートする動画教材データファイルのパスを取得
    path = "db/csv_data/movie_data.csv"
    # インポートする動画教材データを格納するための配列
    list = []
    # CSVファイルからインポートする動画教材データを取得し配列に格納
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "動画教材のインポート処理を開始"
    # インポートができなかった場合の例外処理
    begin
      Movie.create!(list)
      puts "動画教材のインポート完了!!".green
    rescue => e
      # 例外が発生した場合の処理
      # 動画教材データのインポートができなかった場合の例外処理
      puts "#{e.class}: #{e.message}".red
      puts "-------------------------"
      puts e.backtrace # 例外が発生した位置情報
      puts "-------------------------"
      puts "動画教材のインポートに失敗".red
    end
  end
end

namespace :import_csv do
  desc "questionsテーブルにCSVデータをインポートするタスク"
  task questions: :environment do
    path = "db/csv_data/question_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "質問集のインポート処理を開始"
    begin
      Question.transaction do
        Question.create!(list)
      end
        puts "質問集のインポート完了".green
    rescue => e
      puts "#{e.class}: #{e.message}".red
      puts "------------------------"
      puts e.backtrace
      puts "------------------------"
      puts "質問集のインポートに失敗".red
    end
  end
end

namespace :import_csv do
  desc "linesテーブルにCSVデータをインポートするタスク"
  task lines: :environment do
    path = "db/csv_data/lines_data.csv"
    list = []
    CSV.foreach(path, headers: true) do |row|
      list << row.to_h
    end
    puts "lineのインポート処理を開始"
    begin
      Line.transaction do
        Line.create!(list)
      end
        puts "lineのインポート完了".green
    rescue => e
      puts "#{e.class}: #{e.message}".red
      puts "------------------------"
      puts e.backtrace
      puts "------------------------"
      puts "lineのインポートに失敗".red
    end
  end
end

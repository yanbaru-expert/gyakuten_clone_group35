require "csv"

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

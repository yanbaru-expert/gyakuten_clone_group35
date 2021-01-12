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

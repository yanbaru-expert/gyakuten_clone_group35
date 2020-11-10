EMAIL = 'test@example.com'
PASSWORD = 'password'
# テストユーザーが存在しないときだけ作成
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
  puts 'ユーザーの初期データインポートに成功しました。'
end

AdminUser.find_or_create_by!(email: 'admin@example.com') do |adminuser|
  adminuser.password = "password"
  adminuser.password_confirmation = "password"
end
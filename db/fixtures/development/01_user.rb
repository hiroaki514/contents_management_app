User.seed do |s|
  s.id    = 1
  s.email = 'hiroaki5141616@me.com'
  s.password = 'password123'
  s.name = '瀬戸博章'
  s.name_kana = 'セトヒロアキ'
  s.phone_number = '08011112222'
end

User.seed do |s|
  s.id    = 2
  s.email = 'hoge@example.com'
  s.password = 'Hoge1234!'
  s.name = '田中太郎'
  s.name_kana = 'タナカタロウ'
  s.phone_number = '09011112222'
end

User.seed do |s|
  s.id    = 3
  s.email = 'hogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.name = '田中二郎'
  s.name_kana = 'タナカジロウ'
  s.phone_number = '08011112222'
end

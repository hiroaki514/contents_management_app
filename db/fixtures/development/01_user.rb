# frozen_string_literal: true

User.seed do |s|
  s.id = 1
  s.name = '瀬戸博章'
  s.email = 'hiroaki5141616@me.com'
  s.password = 'password123'
  s.role = 0
end

User.seed do |s|
  s.id = 2
  s.name = '穂夏太郎'
  s.email = 'hoge@example.com'
  s.password = 'Hoge1234!'
  s.role = 1
end

User.seed do |s|
  s.id = 3
  s.name = '穂夏次郎'
  s.email = 'hogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.role = 2
end

User.seed do |s|
  s.id = 4
  s.name = '穂夏三郎'
  s.email = 'hogehogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.role = 2
end

User.seed do |s|
  s.id = 5
  s.name = '穂夏四郎'
  s.email = 'hogehogehogehoge@example.com'
  s.password = 'HogeHoge1234!'
  s.role = 2
end

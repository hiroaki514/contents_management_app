# frozen_string_literal: true

User.seed do |s|
  s.id    = 1
  s.email = 'hiroaki5141616@me.com'
  s.password = 'password123'
end

User.seed do |s|
  s.id    = 2
  s.email = 'hoge@example.com'
  s.password = 'Hoge1234!'
end

User.seed do |s|
  s.id    = 3
  s.email = 'hogehoge@example.com'
  s.password = 'HogeHoge1234!'
end

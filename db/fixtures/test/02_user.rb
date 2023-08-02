# frozen_string_literal: true

User.seed do |s|
  s.id = 1
  s.name = '瀬戸博章'
  s.email = 'hiroaki5141616@me.com'
  s.password = 'password123'
  s.role = 0
  s.organization_id = 1
end

User.seed do |s|
  s.id = 2
  s.name = '穂夏太郎'
  s.email = 'hoge@example.com'
  s.password = 'password123'
  s.role = 1
  s.organization_id = 1
end

User.seed do |s|
  s.id = 3
  s.name = '穂夏次郎'
  s.email = 'hoge2@example.com'
  s.password = 'password123'
  s.role = 2
  s.organization_id = 1
end

User.seed do |s|
  s.id = 4
  s.name = '穂夏三郎'
  s.email = 'hoge3@example.com'
  s.password = 'password123'
  s.role = 2
  s.organization_id = 1
end

User.seed do |s|
  s.id = 5
  s.name = '穂夏四郎'
  s.email = 'hoge4@example.com'
  s.password = 'password123'
  s.role = 2
  s.organization_id = 1
end

# 以下、id=6からid=30までのユーザを追加
(6..30).each do |id|
  User.seed do |s|
    s.id = id
    s.name = "ユーザ#{id}"
    s.email = "hoge#{id}@example.com"
    s.password = 'password123'
    s.role = 2
    s.organization_id = 1
  end
end

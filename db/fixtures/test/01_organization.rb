# frozen_string_literal: true

Organization.seed do |s|
  s.id = 1
  s.name = '組織1'
end

(2..15).each do |id|
  User.seed do |s|
    s.id = id
    s.name = "組織#{id}"
  end
end

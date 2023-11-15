# frozen_string_literal: true

(1..15).each do |id|
  Organization.seed do |s|
    s.id = id
    s.name = "組織#{id}"
  end
end

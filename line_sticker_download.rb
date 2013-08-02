#!/usr/bin/env ruby

require 'httparty'

url = "http://dl.stickershop.line.naver.jp/products/0/0/"
download_url="iphone/stickers@2x.zip"

response = HTTParty.get("http://dl.stickershop.line.naver.jp/products/0/0/2/942/iphone/stickers@2x.zip")
unless response.code == 404
  puts "Saving test zip (totoro stickers!!)"
  open("totoro_test.zip", "w") do |file|
    file.write(response.body)
  end
end

1500.times do |i|
  1500.times do |f|
    name = "#{i}-#{f}"
    full = "#{ url }#{i}/#{f}/#{ download_url }"
    puts "Trying #{full}..."
    response = HTTParty.get(full)
    if response.code == 404
    else
      puts "  Found! Saving #{name}"
      open("#{name}.zip", "w") do |file|
        file.write(response.body)
      end
    end
  end
end

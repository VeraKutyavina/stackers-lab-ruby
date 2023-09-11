require 'HTTParty'
require 'nokogiri'
require 'uri'

category = gets.chomp

encoded_text = URI.encode_www_form_component(category)
url = "https://anekdot.ru/tags/#{encoded_text}"

html = HTTParty.get(url)
doc = Nokogiri::HTML(html)

if doc.css('.text').length.positive?
  puts doc.css('.text')[0].text
else
  puts 'нет тут шуточек'
end

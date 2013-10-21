# post_message.rb

require "net/http"
require_relative "environment"

puts ""
print "Who do you want to message? "
to = gets.chomp

print "Who are you? "
from = gets.chomp

print "Your message: "
content = gets.chomp

puts ""
print "Sending message..."

uri = URI("http://localhost:9292/")

res = Net::HTTP.post_form(uri, {"to"=>to, "from"=>from, "content"=>content})


if res.body == "success"
  puts "done!"
else
  puts "Oops, something went wrong :("
end

puts ""

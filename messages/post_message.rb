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

this_message = Message.new
this_message.to = to
this_message.from = from
this_message.content = content

uri = URI("http://localhost:9292")

# TODO: Post the message to the server
http = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data({"something1" => "athing1", "something2" => "athing2"})

response = http.request(request)


if response.body == "success"
  puts "done!"
else
  puts "Oops, something went wrong :("
end

puts ""

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

uri = URI("http://localhost:9292/")

http = Net::HTTP.new(uri.host, uri.port)
  ## gets made from uri above (?)
request = Net::HTTP::Post.new(uri.request_uri)
request.set_form_data({:to => this_message.to, :from => this_message.from, 
  :content => this_message.content})
# /.set_form_data({....})

# binding.pry

response = http.request(request)

binding.pry

if response.body == "success"
  puts "done!"
else
  puts "Oops, something went wrong :("
end

puts ""

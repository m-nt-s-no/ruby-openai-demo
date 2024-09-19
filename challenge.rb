require "openai"

client = OpenAI::Client.new(access_token: ENV.fetch("OPEN_AI_KEY"))

puts "Hello! How can I help you today?"
50.times {print "-"}
print "\n"
request = gets.chomp
message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant who talks like a Hemingway novel."
  },
  {
    "role" => "user",
    "content" => "#{request}"
  }
]

api_response = client.chat(
  parameters: {
    model: "gpt-3.5-turbo",
    messages: message_list
  }
)

puts api_response["choices"][0]["message"]["content"]
50.times {print "-"}
print "\n"

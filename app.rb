require 'sinatra'

#Получить данные
get '/' do
  erb :index
end

#Отправить данные
post '/' do
  @name = params['name']
  @phone_number = params['phone_number']
  @date_time = params['date_time']

  @title = "Thank you!"
  @message = "Dear #{@name}, we'll be waiting for you at #{@date_time}."

  f = File.open 'users.txt', 'a'
  f.write "User: #{@name}, Phone: #{@phone_number}, Date and Time: #{@date_time}\n"
  f.close

  erb :message

end

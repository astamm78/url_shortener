get '/' do
  erb :index
end

post '/shorten' do
  @new_shorty = Url.new(:url => params[:url])
  if @new_shorty.save
    redirect "#{@new_shorty.code}"
  else
    puts "Didn't save"
    puts @new_shorty.inspect
    erb :index
  end
end

get '/shorty:code' do
  erb :result
end

get '/shorty/:code' do
  redirect Url.find_by_code("/shorty#{params[:code]}").url
end

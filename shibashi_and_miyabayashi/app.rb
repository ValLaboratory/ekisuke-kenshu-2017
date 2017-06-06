require "sinatra/base"
require "sinatra/reloader"
require_relative "./configure"


class SampleApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end


  get "/" do
    erb :kadai1
    # koenzi = Ekisuke::Station.find("高円寺")
    # "#{koenzi[0].name}"
  end

  get "/result1" do
    @stations = Ekisuke::Station.find(params[:station_name])
    erb :result1
  end
end

require_relative "./configure"

name = gets.chomp
station_name = Ekisuke::Station.find(name)
puts station_name[0].code

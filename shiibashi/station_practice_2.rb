require_relative "./configure"

#問２
def station(get_name)
  stations = Ekisuke::Station.find(get_name)
  # puts defined? stations[0].name
  if defined? stations[0].name
    stations.each do |station|
      puts "駅名 : #{station.name}"
      puts "駅コード : #{station.code}"
      puts "読み : #{station.yomi}"
      puts "------------------"
    end
  else
    puts "該当する駅はありません"
  end
end


get_station_name = gets.chomp
station(get_station_name)

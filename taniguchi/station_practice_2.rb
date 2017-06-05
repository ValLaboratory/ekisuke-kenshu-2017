require_relative "./configure"

# 駅オブジェクトを取得して駅名表示
stations = Ekisuke::Station.find("高円寺")

#p stations[0].name

# puts stations[0].code
# puts stations[0].yomi

# stations.each do |station|
#   puts "駅名 : #{station.name}"
#   puts "駅コード : #{station.code}"
#   puts "読み : #{station.yomi}"
#   puts "------------------"
# end
  name = gets.chomp
# station_name = Ekisuke::Station.find(name)
# puts station_name[0].code

def get_station(name)
  station_name = Ekisuke::Station.find(name)
  #definedって何？
  if defined? station_name[0].name
    station_name.each do |station|
    puts "駅名 : #{station.name}"
    puts "駅コード : #{station.code}"
    puts "読み : #{station.yomi}"
    puts "------------------"
    end
  else
    puts "該当する駅がありません"
  end
end
get_station(name)
#puts get_station(name)

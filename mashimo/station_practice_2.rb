require_relative "./configure"
# 駅オブジェクトを取得して駅名表示
get_string = gets.chomp
stations_test = Ekisuke::Station.find(get_string)

p get_string

#stations_test == nil ? "該当する駅はありません" : stations_test.name
#p defined? stations_test[0].name

if (defined? stations_test[0].name).nil?
  puts "該当する駅はありません"
else
  stations_test.each do |station|
    puts "駅名 : #{station.name}"
  end
end

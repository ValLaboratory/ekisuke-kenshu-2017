require_relative "./configure"

#問１
stations = Ekisuke::Station.find("川口")
stations.each do |station|
  puts "駅名 : #{station.name}"
  puts "駅コード : #{station.code}"
  puts "読み : #{station.yomi}"
  puts "------------------"
end

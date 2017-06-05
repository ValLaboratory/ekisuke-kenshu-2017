require_relative "./../configure"

ekiname = gets.chomp #駅名の入力
stations = Ekisuke::Station.find("#{ekiname}") #駅情報を取得

# stationsの中身が返ってきてるかどうか判定
if stations.empty? != true
  #駅情報があれば該当する駅名全部表示 
  stations.each do |station|
    puts "駅名 : #{station.name}"
    puts "------------"
  end

else
  #ない時のメッセージを表示
  puts "該当する駅はありません"

end

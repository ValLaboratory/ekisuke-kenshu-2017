require_relative "./configure"
# 駅オブジェクトを取得して駅名表示
#問題1
get_string = gets.chomp
stations_test = Ekisuke::Station.find(get_string)

p get_string

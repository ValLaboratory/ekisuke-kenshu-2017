require_relative './../configure'

#高円寺 -> 池袋
courses = Ekisuke::Course.search("22671:22513")

if courses.nil? || courses.empty?
  puts "経路が見つかりませんでした"
else
 #駅
 stations = courses[0].stations
 #路線
 lines = courses[0].lines
 #駅探索経路を１つ表示
 lines.each_with_index do |line,line_index|
  #経路探索結果を表示
  puts stations[line_index].name
  puts "| #{line.departure_state.datetime.strftime("%H:%M")}"
  puts "| #{line.name}"
  puts "| #{line.arrival_state.datetime.strftime("%H:%M")}"
  end
  puts stations[-1].name
end

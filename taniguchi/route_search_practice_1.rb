require_relative "./../configure"

courses = Ekisuke::Course.search("22671:22513") # 高円寺->池袋

#経路表示
if courses.nil? || courses.empty?
  puts "経路が見つかりませんでした"
else
  # 1経路目
  course = courses[0]
  #puts "合計所要時間：#{course.time}分"


  # 駅
  stations = course.stations
  # 路線
   lines = course.lines

  lines.each_with_index do |line,line_index|
    # 駅名
    puts stations[line_index].name
    #出発時刻
    puts "|#{line.departure_state.datetime.strftime("%H:%M")}"
    # 路線名
    puts "|#{line.name}"
    #到着時刻
    puts "|#{line.arrival_state.datetime.strftime("%H:%M")}"
  end
  # 経路の最後の駅を出力
  puts stations[-1].name
end

require_relative "./../configure"


courses = Ekisuke::Course.search("22671:22513") # 高円寺->池袋

#経路表示
if courses.nil? || courses.empty?
  puts "経路が見つかりませんでした"
else
  # 1経路目
  course = courses[0]
  puts "合計所要時間：#{course.time}分"
  puts "=========="

  # 駅
  stations = course.stations
  # 路線
  lines = course.lines

  lines.each_with_index do |line,line_index|
    # 駅名
    puts stations[line_index].name

    # 路線情報
    puts "| 出発時刻：#{line.departure_state.datetime.strftime("%H:%M")}"
    puts "| 路線名称：#{line.name}"
    puts "| 到着時刻：#{line.arrival_state.datetime.strftime("%H:%M")}"
  end
  # 経路の最後の駅を出力
  puts stations[-1].name
end

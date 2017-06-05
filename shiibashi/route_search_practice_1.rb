require_relative "./../configure"

courses = Ekisuke::Course.search("22671:22513") # 高円寺->池袋


#経路表示
if courses.nil? || courses.empty?
  puts "経路が見つかりませんでした"
else
  # 1経路目
  course = courses[0]

  # 駅
  stations = course.stations
  # 路線
  lines = course.lines

  lines.each_with_index do |line,line_index|
    # 駅名
    puts stations[line_index].name
    #出発時間
    puts course.departure_time.strftime("|%H:%M")
    # 路線名
    puts "|#{line.name}"
    puts course.arrival_time.strftime("|%H:%M")
  end
  # 経路の最後の駅を出力
  puts stations[-1].name
end

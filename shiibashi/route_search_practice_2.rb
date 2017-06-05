require_relative "./../configure"

#探索結果表示
def show_route(time,params)
  courses = Ekisuke::Course.search("22671:22513",20170605, time, params) # 高円寺->池袋
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
end

#_________________________実行内容_________________________

puts "探索種別は何にしますか？"
puts "(1:発時刻、2:着時刻、3:始発、4終電)"
number = gets.chomp
if number=="1" || number=="2"
  puts "時刻を指定してください(HHMM)"
  time = gets.chomp
# else
#   time = "0000"
end


case number
when "1"
  params = {:searchType =>"departure"}
when "2"
  params = {:searchType =>"arrival"}
when "3"
  params = {:searchType =>"firstTrain"}
when "4"
  params = {:searchType =>"lastTrain"}
end



show_route(time,params)

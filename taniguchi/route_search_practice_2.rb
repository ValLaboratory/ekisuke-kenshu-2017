require_relative "./../configure"

 # 高円寺->池袋

#経路表示
def route(time,params)

  courses = Ekisuke::Course.search("22671:22513",20170605,time,params)
  if courses.nil? || courses.empty?
    puts "経路が見つかりませんでした"
  else
    # 1経路目
    course = courses[0]
    #puts "合計所要時間：#{course.time
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
end
puts "半角数字で入力してください。"
  puts "1：発時刻、２：着時刻、３：始発、４：終電"
number = gets.chomp
time = ""
if(number == "1")
  puts "時刻を入力してください。"
  params = {searchType:"departure"}
  time = gets.chomp
  route(time,params)
elsif (number == "2")
  params = {searchType:"arrival"}
  time = gets.chomp
  route(time,params)
elsif (number =="3")
  params = {searchType:"firstTrain"}
  time = "0000"
  route(time,params)
elsif (number == "4")
  params = {searchType:"lastTrain"}
  time = "0000"
  route(time,params)
end

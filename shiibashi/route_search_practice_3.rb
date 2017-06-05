require_relative "./configure"

def show_route(start_code,end_code)
  courses = Ekisuke::Course.search("#{start_code}:#{end_code}") # 高円寺->池袋
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

def station(get_name)
  stations = Ekisuke::Station.find(get_name)
  # puts defined? stations[0].name
  unless stations.empty?
    stations.each_with_index do |station,index|
      puts "[#{index}]"
      puts "駅名 : #{station.name}"
      puts "駅コード : #{station.code}"
      puts "読み : #{station.yomi}"
      puts "------------------"
      # return station.code
    end
  else
    puts "該当する駅はありません"
  end
  puts "駅の番号を入力してください"
  choice_station_num = gets.to_i
  return stations[choice_station_num].code
end


#_______________実行内容___________________________
#出発駅
puts "出発駅を入力してください"
get_start_station_name = gets.chomp
start_code = station(get_start_station_name)

#到着駅
puts "到着駅を入力してください"
get_end_station_name = gets.chomp
end_code = station(get_end_station_name)

show_route(start_code,end_code)

require_relative "./configure"

# class Input
#   def initialize(search_num,time_num)
#     @search_num = search_num
#     @time_num   = time_num
#   end
#
#   #シンボル
#   attr_reader :search_num, :time_num
# end

# 駅の探索種
def route_search()
  search_num = 0
  while true
    print"探索種を入力してください。\n(1:発車時刻、2:着時刻、3:始発、4:終電)\n探索種:"
    search_num = gets.chomp.to_i
    search_num > 0 && search_num < 5 ? break : 0
  end
  return search_num.to_s
end


# 駅の探索日時
def route_time(search_num)
  search_time = ""
  if search_num.to_i < 3
    while true
      print"探索日時を入力してください。\n(入力例:HHMM)\n探索日時:"
      search_time = gets.chomp
      search_time.length == 4 ? break : 0
    end
    return search_time
  else
    return "0000"
  end
end


# 探索
def route(search_num,time_num)
  if search_num.to_i == 1    #発車時刻
    courses = Ekisuke::Course.search("22671:22513","20170605",time_num,{searchType:"departure"}) # 高円寺->池袋
  elsif search_num.to_i == 2 #着時刻
    courses = Ekisuke::Course.search("22671:22513","20170605",time_num,{searchType:"arrival"}) # 高円寺->池袋
  elsif search_num.to_i == 3 #始発
    courses = Ekisuke::Course.search("22671:22513","20170605",time_num,{searchType:"firstTrain"}) # 高円寺->池袋
  elsif search_num.to_i == 4 #終電
    courses = Ekisuke::Course.search("22671:22513","20170605",time_num,{searchType:"lastTrain"}) # 高円寺->池袋
  else
    puts "route:error"
  end

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
end


# 実行
search_num  = route_search()
search_time = route_time(search_num)
route(search_num,search_time)
# me = Input.new(search_num,search_time)

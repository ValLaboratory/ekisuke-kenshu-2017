require_relative './../configure'

DEPARTURE = "departure" #発車時刻
ARRIVAL = "arrival" #到着時刻
FISTTRAIN = "firstTrain" #始発
LASTTRAIN = "lastTrain" #終電
TODAY = "20170506" #今日の日付

#入力メソッド
def input
  #選択肢のメッセージを表示
  puts "探索経路を選んでください"
  puts "1 出発時刻"
  puts "2 到着時刻"
  puts "3 始発"
  puts "4 終電"

  #経路探索番号を入力
  num = gets.chomp
  #変換
  search_method = change(num.to_i)

  puts "時刻を指定してください: 入力例1600(16時)"
  #指定時間を入力
  time = gets.chomp

  #経路探索を行う
  search(search_method,time)
end

#入力した番号から経路探索を指定するメソッド
def change(num)

  case num
  when 1
    return DEPARTURE
  when 2
    return ARRIVAL
  when 3
    return FISTTRAIN
  when 4
    return LASTTRAIN
  else
    puts "指定された番号を入力してください"
    # 強制終了
    exit(0)
  end
end



# 経路探索メソッド
def search(search_method,time)

  # puts time
  #高円寺 -> 池袋
  courses = Ekisuke::Course.search("22671:22513",TODAY,time,{searchType:search_method})

  if courses.nil? || courses.empty?
    puts "経路が見つかりませんでした"
  else
   #駅
   stations = courses[0].stations
   #路線
   lines = courses[0].lines
   #駅探索経路を１つ表示
   lines.each_with_index do |line,line_index|
    ##経路探索結果を表示
    puts stations[line_index].name
    puts "| #{line.departure_state.datetime.strftime("%H:%M")}"
    puts "| #{line.name}"
    puts "| #{line.arrival_state.datetime.strftime("%H:%M")}"
    end
    puts stations[-1].name
  end

end

# 経路探索の入力
puts input

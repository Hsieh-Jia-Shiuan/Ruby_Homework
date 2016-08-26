#Class
class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def finger_guess
  end
end

class Human < Player
  def finger_guess
    input = gets.chomp.upcase
  end
end

class Computer < Player
  def finger_guess(array)
    input = array.sample
  end
end

class RPSGame  
  FINGER_GESTURE_ARR = ["P", "S", "R"]
  CONTINUE_ARR = ["Y", "N"]

  def rule(player, ai)
	resule = nil
    if player == ai
      resule ||= 0
    elsif (player == 0 && ai == 2) ||
   	      (player == 1 && ai == 0) ||
   	      (player == 2 && ai == 1)
   	  resule ||= 1
    elsif (player == 0 && ai == 1) ||
   	      (player == 1 && ai == 2) ||
   	      (player == 2 && ai == 0)
   	  resule ||= 2   	
    else
      resule ||= -1
    end
  end
 
  def input_to_int(input)
    case input
      when "P" then 0
 	  when "S" then 1
      when "R" then 2
      else -1
    end
  end

  #function Resule
  def final(idx)
  	case idx
      when 0 then "平手！" 
      when 1 then "你贏了！"
      when 2 then "你輸了！"
      else "我壞掉了"
    end    
  end

  def ind(idx)
  	if idx == 0
  	  @tie_const += 1
  	elsif idx ==1
  	  @win_const += 1
  	else idx ==2 	
  	  @lose_const += 1	
  	end
  end

  def initialize
  	intro
    @computer_player = Computer.new("AI")
    @human_player = Human.new(get_player_name)
    @win_const = 0
    @lose_const = 0
    @tie_const = 0
    @round = 0
  end  

  def intro
    #印出開場畫面，告訴玩家遊戲規則
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "+++++      歡迎來到  剪刀 石頭 布  遊戲        +++++"
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++"
  end 

  def get_player_name
    puts "請輸入你的名字 : "
    player_name = gets.chomp
  end

  def game_rule
  	puts "請輸入 剪刀(S) 石頭(R) 布(P) 之英文代號"
  end  

  def get_player_gestures
    @human_player_finger_guess = @human_player.finger_guess
    while !FINGER_GESTURE_ARR.include?(@human_player_finger_guess)
      puts "我再說一次！！！ 請輸入 剪刀(S) 石頭(R) 布(P) 之英文代號"
      @human_player_finger_guess = @human_player.finger_guess
    end    
  end

  def get_computer_gestures
    @computer_player_finger_guess = @computer_player.finger_guess(FINGER_GESTURE_ARR)
  end

  def continue?
  	puts "是否要繼續猜拳？ y/n"
    @continue = gets.chomp.upcase
    while !CONTINUE_ARR.include?(@continue)
      puts "我再說一次！！！ 是否要繼續猜拳？ y/n"
      @continue = gets.chomp.upcase
    end
  end

  def game_result
  	puts "#{@human_player.name}出的拳 #{@human_player_finger_guess}  電腦出的拳 #{@computer_player_finger_guess}  所以..."
    puts "#{final(@result)}"
    puts "#{@human_player.name}總共玩了 : #{@round} 回合，目前成績"
    puts "輸 : #{@lose_const} 贏 : #{@win_const} 平手 : #{@tie_const}"
  end

  def play
  	begin
  	  @round += 1
      game_rule
      get_player_gestures
      get_computer_gestures
      @result = rule(input_to_int(@human_player_finger_guess), input_to_int(@computer_player_finger_guess))
      final(@result)
      ind(@result)
      game_result
      continue?
  	end while @continue == "Y"
  end
end

RPSGame.new.play

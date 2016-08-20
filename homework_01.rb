#define
arr = ["P", "S", "R"]
continueArr = ["Y", "N"]

#function rule
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

#function String To Int
def inputToInt(input)
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

#Main
begin
    puts "請輸入 剪刀(S) 石頭(R) 布(P) 之英文代號"
    player_input = gets.chomp.upcase

    while !arr.include?(player_input)
    	puts "我再說一次！！！ 請輸入 剪刀(S) 石頭(R) 布(P) 之英文代號"
    	player_input = gets.chomp
    end
    
    ai_input = arr.sample

    final_idx = rule(inputToInt(player_input), inputToInt(ai_input))

    final(final_idx)

    puts "你出的拳#{player_input}  電腦出的拳#{ai_input} 所以..."

    puts "#{final(final_idx)}"

    puts "是否要繼續猜拳？ y/n"
    continue = gets.chomp.upcase
    
    while !continueArr.include?(continue)
    	puts "我再說一次！！！ 是否要繼續猜拳？ y/n"
    	continue = gets.chomp
    end
end while continue == "Y"

puts "感謝你的遊玩! 88"
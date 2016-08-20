operatorArr = ["+", "-", "*", "/"]

def calculate(operator_input, first_Digi_input, secound_Digi_input)
   case operator_input
      when "+" then first_Digi_input + secound_Digi_input
	  when "-" then first_Digi_input - secound_Digi_input
	  when "*" then first_Digi_input * secound_Digi_input
	  when "/" then first_Digi_input / secound_Digi_input
   end
end

puts "開啟計算機"
puts "請輸入數字"
first_Digital = gets.chomp.to_f
puts "請輸入運算子"
operator = gets.chomp

while !operatorArr.include?(operator)
	puts "不要玩我！！請輸入運算子"
	operator = gets.chomp
end

puts "請輸入數字"
secound_Digital = gets.chomp.to_f

puts "#{first_Digital} #{operator} #{secound_Digital} = "
puts "#{calculate(operator, first_Digital, secound_Digital)}"

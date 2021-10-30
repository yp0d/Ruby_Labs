PATH_BALANCE="I:\\RUBY_Proj\\Test\\Lab3\\balance.txt"
def deposit(balance)
  puts "Your balance #{balance}"
  puts "Enter digital"
  balance=balance.to_i
  sum=gets.to_i
  if sum<0
    while sum<0
      puts "The entered number cannot be negative. Enter the number again."
      sum=gets.to_i
    end
    end
    balance=balance+sum
    File.write(PATH_BALANCE,"#{balance}",mode:"w")
  balance
end
def withdraw(balance)
  balance=balance.to_i
  show_balance(balance)
  puts "Enter how much do withdraw"
  draw=gets.to_i
  if draw<0 or draw>balance
    while draw<0 or draw>balance
    puts "It is impossible to withdraw this amount.Your balance #{balance}\nEnter the amount you want to withdraw"
    draw=gets.to_i
    end
  end
  balance=balance-draw
  File.write(PATH_BALANCE,balance,mode:"w")
  balance
end
def show_balance(balance)
  puts "Your balance #{balance}"
end
def atm()
if File.exist?(PATH_BALANCE)
  balance=File.read(PATH_BALANCE)
else
  balance=100
end

puts "Your balance #{balance}"
loop do
  #puts "What you want to do?\n\"B\" Check balance\n\"D\" Deposit money\n\"W\" Withdraw money\n\"Q\" Quit"
  action=gets
  case action
  when "q\n"
    puts "Programm ended"
    break
  when "b\n"
    show_balance(balance)
  when "w\n"
    balance=withdraw(balance)
  when "d\n"
    balance=deposit(balance)
  end
end
end

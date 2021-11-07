class CashMachine
  @@PATH_BALANCE="I:\\RUBY_Proj\\Test\\Lab4\\Balance.txt"
  def initialize
    if File.exist?(@@PATH_BALANCE)
      @balance=File.read(@@PATH_BALANCE).to_f
    else
      @balance=100.0
    end
  end
  def init
  loop do
    show_balance
    puts "What you want to do?\n\"B\" Check balance\n\"D\" Deposit money\n\"W\" Withdraw money\n\"Q\" Quit"
    action=gets.chomp.downcase
    case action
    when "q"
      puts "Programm ended"
      break
    when "b"
      show_balance
    when "w"
      balance=withdraw
    when "d"
      balance=deposit
    end

  end
  end
  def show_balance
    puts "Your balance #{@balance}"
  end
  def deposit
    show_balance()
    puts "Enter digital"
    sum=gets.to_f
    if sum<0
      while sum<0
        puts "The entered number cannot be negative. Enter the number again."
        sum=gets.to_f
      end
    end
    @balance=@balance.to_i+sum
    File.write(@@PATH_BALANCE,@balance,mode:"w")
  end
  def withdraw
    show_balance()
    puts "Enter how much do withdraw "
    draw=gets.to_f
    if draw<0 or draw>@balance
      while draw<0 or draw>@balance
        puts "It is impossible to withdraw this amount.Your balance #{@balance}\nEnter the amount you want to withdraw"
        draw=gets.to_f
      end
    end
    @balance=@balance-draw
    File.write(@@PATH_BALANCE,@balance,mode:"w")
  end
end

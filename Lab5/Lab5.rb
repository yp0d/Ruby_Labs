require "socket"
require 'rack'

class CashMachine

  def initialize
    @CONST_MONEY = 100
    @BALANCE_LIST_PATH = "J:\\RUBY_Proj\\Test\\Lab5\\balance.txt"
    if File.exist?(@BALANCE_LIST_PATH)
      @money=File.read(@BALANCE_LIST_PATH).to_i
    else @money=@CONST_MONEY
    end
  end

  def deposit(amount)
    amount=amount.to_i
    if amount<100
      return -1
    elsif amount>=100 && amount<10000
      if amount%100==0
        @money=@money+amount
        write
        return 0
      else
        return -2
      end
    elsif amount>=10000
      return -3
    end
  end

  def withdraw(amount)
    amount=amount.to_i
    if amount<100
      return -1
    elsif amount>=100 && amount<10000
      if amount%100==0
        if amount<=@money
          @money=@money-amount
          write
          return 0
        else
          return -2
        end
      else
        return-3
      end
    elsif amount>=10000
      return -4
    end
  end

  def balance
    @money
  end

  def write
    File.write(@BALANCE_LIST_PATH, @money, mode: "w")
  end
end

server = TCPServer.new('localhost', 3000)

def array_to_hash(array)
  result = {}
  array.each do |item|
    key = item.split("=")[0]
    value = item.split("=")[1]
    result[key] = value
  end
  result
end

class App
  def call(env)
    req = Rack::Request.new(env)
    params = env["QUERY_PARAMS"]
    cashMachine = CashMachine.new
    case req.path
    when "/"
      [200, { "Content-Type" => "text/html" }, ["ATM launched\r\n"]]
    when "/deposit"
      if params.nil? || params["value"].nil?
        [400, { "Content-Type" => "text/html" }, ["You are not entered value for deposit, please try again\r\n"]]
      else
        if cashMachine.deposit(params["value"]) == -1
          [400, { "Content-Type" => "text/html" }, ["You entered the amount less than the minimum, please try again\r\n"]]
        elsif cashMachine.deposit(params["value"]) == -2
          [400, { "Content-Type" => "text/html" }, ["You entered the wrong bill, please try again\r\n"]]
        elsif cashMachine.deposit(params["value"]) == -3
          [400, { "Content-Type" => "text/html" }, ["You entered the amount that exceeds the maximum deposit at a time, please try again\r\n"]]
        else
          [200, { "Content-Type" => "text/html" }, ["You are deposited #{params["value"]}\nYour Balance is #{cashMachine.balance}\r\n"]]
        end
      end
    when "/withdraw"
      if params.nil? || params["value"].nil?
        [400, { "Content-Type" => "text/html" }, ["You are not entered value for withdraw, please try again\r\n"]]
      else
        if cashMachine.withdraw(params["value"]) == -1
          [400, { "Content-Type" => "text/html" }, ["You entered the amount less than the minimum, please try again\r\n"]]
        elsif cashMachine.withdraw(params["value"]) == -2
          [400, { "Content-Type" => "text/html" }, ["You entered the amount that exceeds your current balance, please try again\r\n"]]
        elsif cashMachine.withdraw(params["value"]) == -3
          [400, { "Content-Type" => "text/html" }, ["You entered the wrong bill, please try again\r\n"]]
        elsif cashMachine.withdraw(params["value"]) == -4
          [400, { "Content-Type" => "text/html" }, ["You entered the amount that exceeds the maximum withdraw at a time, please try again\r\n"]]
        else
          [200, { "Content-Type" => "text/html" }, ["You are withdrawed #{params["value"]}\r\nYour Balance is #{cashMachine.balance}\r\n"]]
        end
      end
    when "/balance"
      [200, { "Content-Type" => "text/html" }, ["Your balance is #{cashMachine.balance}", "\r\n"]]
    else
      [404, { "Content-Type" => "text/html" }, ["Not Found this page\r\n"]]
    end
  end
end

app = App.new

while (connection = server.accept)
  request = connection.gets
  method, full_path, http_ver = request.split(' ')
  path, params = full_path.split('?')
  status, headers, body = app.call({
                                     'REQUEST_METHOD' => method,
                                     'PATH_INFO' => path,
                                     'QUERY_PARAMS' => params != nil ? array_to_hash(params.split('&')) : nil
                                   })
  connection.print "#{http_ver} #{status} \r\n"
  headers.each do |key, value|
    connection.print "#{key}: #{value}\r\n"
  end
  connection.print "\r\n"
  body.each do |part|
    connection.print part
  end
  connection.close
end
def foobar2
  puts "Enter the word:"
  word=gets.chomp.to_s
p word[-2..-1]=="cs" ?  2**word.size : word.reverse
end

def pocemons
  puts "Enter the number of Pocemons"

  count=gets.to_i
  arr=[]
  count.times do
    puts "Enter the name of Pokemon"

    name=gets.chomp.to_s
    puts "Enter the colour of Pokemon"

    colour=gets.chomp.to_s
    arr<<{name=>colour}
  end
  p arr
end

foobar2
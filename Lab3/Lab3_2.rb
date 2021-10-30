def stud_arr
studarr=[]
path_stud="students.txt"
path_result="results.txt"
File.write(path_stud, "Kos Lev 19\nKir Bill 20\nAida Sevost 21\nAl Sadr 20\nLiza Lyk 16\nDasha Bann 17\nIlya Gol 18\nNik Kit 23\nArt Shi 22\nAnd Shest 25\n")
File.foreach(path_stud){|line| studarr<<(line.chomp)}
loop do
  if studarr.size==0
    puts "All data about people has been transferred to a file\n"
    break
  end
  age=gets.to_i
  if age==-1
    puts "You entered -1 so the program turns off\n"
    break
  end
  for s in studarr
    File.write(path_result,"#{s}\n",mode:"a") if s.include?("#{age}")
    studarr.delete(s) if s.include?("#{age}")
  end

end
File.foreach(path_result){|line| puts line}
end

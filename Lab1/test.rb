def greeting()
  print("Введите ваше имя\n")
  n1=gets.chomp.to_s
  print("Введите вашу фамилию\n")
  n2=gets.chomp.to_s
  print("Введите ваш возраст\n")
  age=gets.to_i
  if age<18
    p "Привет #{n1} #{n2}.Тебе меньше 18 лет, но начать учиться программировать никогда не рано"
  else
    p "Привет #{n1} #{n2}.Самое время заняться делом!"
  end
end


CONST_C=20
def foobar
  a=gets.to_i
  b=gets.to_i
  if (a==CONST_C) || (b==CONST_C)
    20
  else
    a+b
  end
end
greeting
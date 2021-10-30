ACTOR_LIST_PATH='I:\RUBY_Proj\Test\Lab3\artist.txt'
BUFFER='I:\RUBY_Proj\Test\Lab3\buffer.txt'
def index
  File.foreach(ACTOR_LIST_PATH) {|actor| puts actor}
end
def where(name)
  File.foreach(ACTOR_LIST_PATH).with_index do |actor,index|
    @actor_index=index if actor.include?(name)
  end
  @actor_index
end
def update(id,name)
  file=File.open(BUFFER,"w")
  File.foreach(ACTOR_LIST_PATH).with_index do |actor,index|
    file.puts(id==index ? name : actor)
  end
  file.close
  File.write(ACTOR_LIST_PATH,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end
def delete(id)
  file=File.open(BUFFER,"w")
  File.foreach(ACTOR_LIST_PATH).with_index do |actor,index|
    file.puts(actor) if index!=id
  end
  file.close
  File.write(ACTOR_LIST_PATH,File.read(BUFFER))
  File.delete(BUFFER) if File.exist?(BUFFER)
end
def find(id)
  File.foreach(ACTOR_LIST_PATH).with_index do |actor,index|
    puts actor if id==index
  end
end

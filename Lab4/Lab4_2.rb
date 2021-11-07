
module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp.strip.downcase
      break if verb == 'q'

      action = nil

      if verb == 'get'
        print 'Choose action (INDEX/SHOW) / q to exit: '
        action = gets.chomp.strip.downcase
        break if action == 'q'
      end
      action.nil? ? routes[verb].call : routes[verb][action].call
      end
      end
end

class PostsController
  extend Resource

  def initialize
    @posts = []
  end

  def index
    i=1
    if @posts.size!=0
    for p in @posts do
      puts "#{i}. #{p}"
      i+=1
    end
    else
      puts "No posts yet."
    end
  end

  def show
    print "Write index of post."
    ind=gets.to_i
    while ind<0
      puts "Invalid input. You need to enter a natural number."
      ind=gets.chomp.to_i
    end
    puts "#{ind}. #{@posts[ind-1]}"
    end

  def create
    puts "Write the post "
    post=gets.chomp.strip
    if post.empty?
      puts "You cannot leave an empty post."
    else
    @posts<<post
    puts "#{@posts.size}. #{@posts[-1]}"
    end
    end

  def update
    puts "Write index of post that you want to update."
    ind=gets.chomp.to_i
    while ind<0
      puts "Invalid input. You need to enter a natural number."
      ind=gets.chomp.to_i
    end
    if @posts[ind-1]==nil
      puts "There is no post with this index."
    else
      puts "Write updated post"
    post=gets.chomp.strip
    @posts[ind-1]=post
    end
  end

  def destroy
    puts "Write index of post that you want delete."
    ind=gets.chomp.to_i
    while ind<0
      puts "Invalid input. You need to enter a natural number."
      ind=gets.chomp.to_i
    end
    @posts.delete_at(ind-1)
  end
end

class CommentController
  extend Resource

  def initialize
    @comments = []
  end

  def index
    i=1
    if @comments.size!=0
    for p in @comments do
      puts "#{i}. #{p}"
      i+=1
    end
    else
      puts "No comments yet."
    end
  end

  def show
    print "Write index of comment."
    ind=gets.chomp.to_i
    while ind<0
      puts "Invalid input. You need to enter a natural number."
      ind=gets.chomp.to_i
    end
    puts "#{ind}. #{@comments[ind-1]}"
  end

  def create
    puts "Write the comment."
    post=gets.chomp.strip
    if post.empty?
      puts "You cannot leave an empty comment."
      else
    @comments<<post
    puts "#{@comments.size}. #{@comments[-1]}"
    end
  end

  def update
    puts "Write index of comment that you want to update."
    ind=gets.chomp.to_i
    while ind<0
      puts "Invalid input. You need to enter a natural number."
      ind=gets.chomp.to_i
    end
    if @comments[ind-1]==nil
      puts "There is no comment with this index."
    else
    puts "Write updated comment."
    post=gets.chomp.strip
    @comments[ind-1]=post
    end
  end

  def destroy
    puts "Write index of comment that you want delete "
    ind=gets.chomp.to_i
    while ind<0
      puts "Invalid input. You need to enter a natural number."
      ind=gets.chomp.to_i
    end
    if @comments[ind-1]==nil
      puts "There is no comment with this index."
      else
    @comments.delete_at(ind-1)
    end
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')
    resources(CommentController, 'comments')
    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp.strip

      PostsController.connection(@routes['posts']) if choise == '1'
      break if choise == 'q'

      CommentController.connection(@routes['comments']) if choise == '2'
      break if choise == 'q'
    end
    puts 'Good bye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'get' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'post' => controller.method(:create),
      'put' => controller.method(:update),
      'delete' => controller.method(:destroy)
    }
  end
end


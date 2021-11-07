require './Lab4_1'
require './Lab4_2'
RSpec.describe "Lab4"do
  context "Lab4_1" do
  before do
    File.write("I:\\RUBY_Proj\\Test\\Lab4\\Balance.txt","100.0",mode:"w")
  end
  subject{CashMachine.new}
  it '#balance' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("b","q")
    expect(subject.init)
    expect{subject.show_balance}.to output("Your balance 100.0\n").to_stdout
  end
  it '#depsit' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n",10,"q\n")
    expect(subject.init)
    expect{subject.show_balance}.to output("Your balance 110.0\n").to_stdout
  end
  it "#withdraw"  do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("w\n",10,"q\n")
    expect(subject.init)
    expect{subject.show_balance}.to output("Your balance 90.0\n").to_stdout
  end
  end
  context "Lab4_2" do
    subject{PostsController.new}
    context "Posts" do
      it '#create' do
        allow_any_instance_of(PostsController).to receive(:gets).and_return("first post")
        expect{subject.create}.to output("Write the post \n1. first post\n").to_stdout
        end
      end

    it '#show'do
      allow_any_instance_of(PostsController).to receive(:gets).and_return("first post!","1")
      expect(subject.create)
      expect{subject.show}.to output("Write index of post.1. first post!\n").to_stdout
    end

    it '#index' do
      allow_any_instance_of(PostsController).to receive(:gets).and_return("first post!","second post")
      expect(subject.create)
      expect(subject.create)
      expect{subject.index}.to output("1. first post!\n2. second post\n").to_stdout
    end

    it '#update' do
    allow_any_instance_of(PostsController).to receive(:gets).and_return("first post!","second post","2","updated second post")
    expect(subject.create)
    expect(subject.create)
    expect(subject.update)
    expect{subject.index}.to output("1. first post!\n2. updated second post\n").to_stdout
    end

    it '#destroy' do
      allow_any_instance_of(PostsController).to receive(:gets).and_return("first post!","second post","2")
      expect(subject.create)
      expect(subject.create)
      expect(subject.destroy)
      expect{subject.index}.to output("1. first post!\n").to_stdout
    end
  end

  context "Comments" do
    subject{CommentController.new}
    it '#create' do
      allow_any_instance_of(CommentController).to receive(:gets).and_return("first comment")
      expect{subject.create}.to output("Write the comment.\n1. first comment\n").to_stdout
    end

  it '#show'do
    allow_any_instance_of(CommentController).to receive(:gets).and_return("first comment!","1")
    expect(subject.create)
    expect{subject.show}.to output("Write index of comment.1. first comment!\n").to_stdout
  end

  it '#index' do
    allow_any_instance_of(CommentController).to receive(:gets).and_return("first comment!","second comment")
    expect(subject.create)
    expect(subject.create)
    expect{subject.index}.to output("1. first comment!\n2. second comment\n").to_stdout
  end

  it '#update' do
    allow_any_instance_of(CommentController).to receive(:gets).and_return("first comment!","second comment","2","updated second comment")
    expect(subject.create)
    expect(subject.create)
    expect(subject.update)
    expect{subject.index}.to output("1. first comment!\n2. updated second comment\n").to_stdout
  end

  it '#destroy' do
    allow_any_instance_of(CommentController).to receive(:gets).and_return("first comment!","second comment","2")
    expect(subject.create)
    expect(subject.create)
    expect(subject.destroy)
    expect{subject.index}.to output("1. first comment!\n").to_stdout
  end
  end
end

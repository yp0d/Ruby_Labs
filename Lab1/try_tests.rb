require 'rspec'
require_relative './test'
RSpec.describe "Main" do

  it "#first_task first_solution" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Kostya", "Lev", 15)
    expect(greeting).to eq("Привет Kostya Lev.Тебе меньше 18 лет, но начать учиться программировать никогда не рано")
  end

  it "#first_task second_solution" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Kostya", "Lev", 20)
    expect(greeting).to eq("Привет Kostya Lev.Самое время заняться делом!")
  end

  it "#second_task first_solution" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(10, 30)
    expect(foobar).to eq(40)
  end

  it "#second_task second_solution" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(20, 30)
    expect(foobar).to eq(30)
  end
end
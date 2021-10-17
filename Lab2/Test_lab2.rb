require 'rspec'
require './Lab2'


RSpec.describe "Main" do
  it "#foobar2_1" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Kocs")
    expect(foobar2).to eq(16)
  end
  it "#foobar2_2" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("ko")
    expect(foobar2).to eq("ok")
  end
  it "#pocemons" do
    allow_any_instance_of(Kernel).to receive(:gets).and_return(2,"Pika", "Yellow", "Bulbazavr","Blue")
    expect(pocemons).to eq([{"Pika"=>"Yellow"}, {"Bulbazavr"=>"Blue"}])
  end

end
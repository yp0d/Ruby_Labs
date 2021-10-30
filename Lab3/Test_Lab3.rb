require 'rspec'
require '../Lab3/Lab3_1'
require '../Lab3/Lab3_2'
require '../Lab3/Lab3_3'
RSpec.describe 'Lab_3' do
  context 'Lab3_1' do
    before { File.write(ACTOR_LIST_PATH,"Matthew McConaughey\nKos Lev\nKir Bill\n") }
    it '#index' do
      expect{ index }.to output("Matthew McConaughey\nKos Lev\nKir Bill\n").to_stdout
    end

    it '#where' do
      expect(where("Kos Lev")).to eq(1)
    end

    it '#update' do
      update(1,"Bread Pitt")
      expect{ index }.to output("Matthew McConaughey\nBread Pitt\nKir Bill\n").to_stdout

    end

    it '#delete' do
      delete(2)
      expect{ index }.to output("Matthew McConaughey\nKos Lev\n").to_stdout
    end

    it '#find' do
      expect{find(0)}.to output("Matthew McConaughey\n").to_stdout
    end
  end

  context "Lab3_2" do
    before do
      File.write("I:/RUBY_Proj/Test/Lab3/results.txt","",mode:"w")
    end
    it "#with all numbers" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("16","17","18","19","20","21","22","23","24","25")
      expect{stud_arr}.to output("All data about people has been transferred to a file\nLiza Lyk 16\nDasha Bann 17\nIlya Gol 18\nKos Lev 19\nKir Bill 20\nAl Sadr 20\nAida Sevost 21\nArt Shi 22\nNik Kit 23\nAnd Shest 25\n").to_stdout
    end

    it "#with some numbers" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("19","16","-1")
      expect{stud_arr}.to output("You entered -1 so the program turns off\nKos Lev 19\nLiza Lyk 16\n").to_stdout
    end

    it "#with -1" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("-1")
      expect{stud_arr}.to output("You entered -1 so the program turns off\n").to_stdout
    end
  end

  context "Lab3_3" do
    before {File.write("I:/RUBY_Proj/Test/Lab3/balance.txt","100",mode:"w")}
    it '#atm with incorrect numbers' do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("d\n",-10,20,"w\n",130,20,"b\n","q\n")
      expect{atm}.to output("Your balance 100\nYour balance 100\nEnter digital\nThe entered number cannot be negative. Enter the number again.\nYour balance 120\nEnter how much do withdraw\nIt is impossible to withdraw this amount.Your balance 120\nEnter the amount you want to withdraw\nYour balance 100\nProgramm ended\n").to_stdout
    end
  end
end

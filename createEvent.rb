
module CalendarView
    def showEvents(array)
      puts "     Date            No of Events"
      for i in 0..array.length-1
        count=array.select {|h| h[:date]== array[i][:date]}
      end
      puts "#{array[i][:date]}                  #{count.length}"
    end
  end


############################# Date and Time #############################
require 'rspec/autorun'
require 'date'
require 'time'

=begin
describe "CreateEvent" do
    it "add an event " do
        ce = CreateEvent.new()
        expect(ce.addEvent([])).to eq([])
    end
end
#=end


describe "modifyEvent" do
    it "modify an event " do
        ce = CreateEvent.new()
        expect(ce.addEvent(["{12 , asad}"])).to eq(["{:date=>12, :title=>asad}"])
    end
end
#=end

describe "deleteEvent" do
    it "add an event " do
        ce = CreateEvent.new()
        expect(ce.addEvent(["{12 , asad}"])).to eq(["{:date=>12, :title=>asad}"])
    end
end
#=end
#=end

describe "CreateEvent" do
    it "add an event " do
        ce = CreateEvent.new()
        expect(ce.addEvent(["{12 , asad}"])).to eq(["{:date=>12, :title=>asad}"])
    end
end
=end

############################# Event Creation #############################

class CreateEvent
    include CalendarView
attr_accessor :title, :date

############################# Adding of Event #############################

def addEvent(array)
    puts "Enter the date: "
    @date = gets.chomp
    
    valid_date = Date.parse(@date).strftime('%Y/%m/%d') 
    p valid_date

    puts "Enter the title: "
    @title = gets.chomp.to_s
    
    hash = Hash.new()
    hash .store(:title ,@title) 
    hash.store(:date,@date)
    hash.each {p "Your Event #{@title} is scheduled to #{@date}"}
    array << hash
    p array
end



############################# Modify Event #############################

def modifyEvent(array)
    p "Enter the Title to modify: "
    n_title = gets.chomp
    p "Enter the Date: "
    n_date = gets.chomp
    has = Hash.new()
    has = array
    has.each do |item|
        if item[:title] == n_title && item[:date] == n_date
            puts "Enter the new Title: "
            new_title = gets.chomp
            puts "Enter the new Date: "
            new_date = gets.chomp
            item[:title] = new_title
            item[:date] = new_date
            p item[:title]
            p item[:date]
            p has
        end
      end

end

############################# Deleting Event on single Date #############################
def deleteEventOnsingleDate(array)
    p "Enter the date to delete Event: "
    d_date = gets.chomp
    p "Enter the title to delete an Event"
    d_title = gets.chomp
    array.delete_if  {|item| item[:date] == d_date && item[:title] == d_title }
    p array
end

############################# Deleting all Events on a given date #############################

def deleteAlleventsOnDate(array)
      p "Enter the date to delete event: "
      del_date = gets.chomp
      array.delete_if {|item|  item[:date] == del_date}
      p array
end

############################# Deleting Events Based on Month #############################

def deleteAlleventsInMonth(array)
p "Enter the date: "
mon = gets.chomp
 
x = Date.parse(mon).strftime("%B")
      array.delete_if {|item| Date.parse(item[:date]).strftime("%B") == x}
      p array
end
    

############################# End OF Class #############################
end

obj = CreateEvent.new()
array = Array.new()

puts "############################# Event Management System #############################"
puts "In this System, You can Create Your Event
Modify Your Event and Delete Your Event"

loop do
    puts "1)- ADD Event."
    puts "2)- Modify Event."
    puts "3)- Delete an Event on Single Date."
    puts "4)- Delete all Events on a Date."
    puts "5)- Delete Events based on Months."
    puts "6)- To View  Calender."
    puts "7)- Exit."


choice = gets.chomp
if choice == "1"
    obj.addEvent(array)

elsif choice == "2" 
  obj.modifyEvent(array)

elsif choice == "3"
    obj.deleteEventOnsingleDate(array)  

elsif choice == "4"
    obj.deleteAlleventsOnDate(array)

elsif choice == "5"
    obj.deleteAlleventsInMonth(array)

elsif choice == "6"
    obj.showEvents(array)
else
    break
end
end
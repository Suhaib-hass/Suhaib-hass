require '/home/suhaib/Desktop/Event Management/calender'
class Event
  attr_accessor :title, :desc

  def initialize(title, desc)
    @title = title
    @desc = desc
  end

  puts '############################# Event Management System #############################'
  puts "In this System, You can Create Your Event
    Modify Your Event and Delete Your Event"

  array = []
  loop do
    puts '1)- ADD Event.'
    puts '2)- Modify Event.'
    puts '3)- Delete an Event on Single Date.'
    puts '4)- Delete all Events on a Date.'
    puts '5)- Delete Events based on Months.'
    puts '6)- To View  Calender.'
    puts '7)- Exit.'

    choice = gets.chomp
    Calender.add_event(array, @title, @desc) if choice == '1'
    Calender.modify_event(array) if choice == '2'
    Calender.delete_event_single_date(array) if choice == '3'
    Calender.delete_allevent_single_date(array) if choice == '4'
    Calender.delete_allevent_on_month(array) if choice == '5'
    Calender.calender_view(array) if choice == '6'
    break if choice == '7'
  end
end

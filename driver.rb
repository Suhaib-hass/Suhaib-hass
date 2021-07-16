require '/home/suhaib/Desktop/ems/calen'
class Driver
    puts '############################# Event Management System #############################'
    puts "In this System, You can Create Your Event
      Modify Your Event and Delete Your Event"
  
    
    
    loop do
      puts '1)- Add Event.'
      puts '2)- Modify Event.'
      puts '3)- Delete an Event on Single Date.'
      puts '4)- Delete all Events on a Date.'
      puts '5)- Delete Events based on Months.'
      puts '6)- To View  Calender.'
      puts '7)- Exit.'
  
      choice = gets.chomp
      Calender.add_event if choice == '1'
      Calender.modify_event if choice == '2'
      Calender.delete_event_single_date if choice == '3'
      Calender.delete_allevent_single_date if choice == '4'
      Calender.delete_allevent_on_month if choice == '5'
      Calender.view_calender if choice == '6'
      break if choice == '7'
    end
end
require '/home/suhaib/Desktop/ems/even'
$events = {}
########################## Claender Class ########################## 
class Calender
    
    attr_accessor :date

    def initialize(date)
        @date = date
    end
##########################  Add Event ########################## 
     
def self.add_event
        
        
        puts 'Enter the day:'
        d = gets.chomp.to_i
        until (1..31).include? d
            
        puts 'Enter a valid day: '
        d = gets.chomp.to_i
         end

        puts 'Enter the Month:'
        m = gets.chomp.to_i
        until (1..12).include? m
        puts 'Enter a valid Month: '
        m = gets.chomp.to_i
        end

        puts 'Enter the Year:'
        y = gets.chomp.to_i
        until (1900..2050).include? y
        puts 'Enter a valid Year: '
        y = gets.chomp.to_i
        end
       
        puts "Enter a title: "
        title = gets.chomp

        puts "Enter a Description: "
        desc = gets.chomp

        date = "#{d}-#{m}-#{y}"
        
        obj = Calender.new(date)
         
        flag = false
           $events.each do |key, value|
             if key == obj.date
              newevent = Event.new(title, desc)
              value.push newevent
              flag = true
             end
            end
            unless flag
                newevent = Event.new(title, desc)
                arr_of_obj = []
                arr_of_obj << newevent
                $events.store(obj.date,  arr_of_obj)
            end
            true
            puts "Event Added!"
        p $events
    end

    ########################## Modify Event ########################## 
    def self.modify_event

    
        puts 'Enter the day:'
        d = gets.chomp.to_i
        until (1..31).include? d
        puts 'Enter a valid day: '
        d = gets.chomp.to_i
        end

        puts 'Enter the Month:'
        m = gets.chomp.to_i
        until (1..12).include? m
        puts 'Enter a valid Month: '
        m = gets.chomp.to_i
        end

        puts 'Enter the Year:'
        y = gets.chomp.to_i
        until (1900..2050).include? y
        puts 'Enter a valid Year: '
        y = gets.chomp.to_i
        end

        date = "#{d}-#{m}-#{y}"
        puts "You provided #{date}"
        
        puts "Enter the Title to Modify: "
        title = gets.chomp
        
        puts "Do You want to change the Title? (Y/N)"
        choice = gets.chomp
        
        if choice == "Y" || choice == "y"
        $events.each_pair do |key, value|
         value.each do |item|
               if title == item.title && date == key
                puts "Enter a New Title: "
                new_title = gets.chomp
                item.title = new_title
               end      
              end 
            end
        elsif choice == "N" || choice == "n"
            
            puts 'Nothing happened to Your title.'
            p title
        end
           puts "Do You want to change your Description?(Y/N)"
           option = gets.chomp
        
           if option == "Y" || option  == "y"
            puts "Enter the description: "
            dis = gets.chomp
            $events.each_pair do |key, value|
             value.each do |item|
                if dis == item.desc
                    puts "Enter a New Description: "
                    new_desc = gets.chomp
                    item.desc = new_desc
                end      
            end
        end
    
            elsif choice == "N" || choice == "n"
                puts "Nothing happened to Your Description!"
                p desc
            end  
            puts "Event Modified!"
        p $events
    end

    ########################## Delete all Events on Single Date ########################## 
    def self.delete_allevent_single_date
        
        puts 'Enter the day:'
        d = gets.chomp.to_i
        until (1..31).include? d
        puts 'Enter a valid day: '
        d = gets.chomp.to_i
        end

        puts 'Enter the Month:'
        m = gets.chomp.to_i
        until (1..12).include? m
        puts 'Enter a valid Month: '
        m = gets.chomp.to_i
        end

        puts 'Enter the Year:'
        y = gets.chomp.to_i
        until (1900..2050).include? y
        puts 'Enter a valid Year: '
        y = gets.chomp.to_i
        end

        n_date = "#{d}-#{m}-#{y}"
        puts "You provided #{n_date}"
 
        $events.each_pair do |key, value|
            if n_date == key
        $events.delete(key) 
            end
        end 
        puts "Event Deleted!"
        p $events
    end
########################## delete Events based on Month ########################## 
    
def self.delete_allevent_on_month
         puts "Enter a month: "
         month = gets.chomp 
            $events.each_pair do |key, value|
              dat, mon, year = key.split('-')
              if month == mon
                $events.delete(key)
            end
          end
          puts "Event Deleted"
        p $events
    end

    ########################## Delete Events on Single Date ########################## 
    def self.delete_event_single_date
           
        puts 'Enter the day:'
        d = gets.chomp.to_i
        rescue => exception
        until (1..31).include? d
        puts 'Enter a valid day: '
        d = gets.chomp.to_i
        end

        puts 'Enter the Month:'
        m = gets.chomp.to_i
        until (1..12).include? m
        puts 'Enter a valid Month: '
        m = gets.chomp.to_i
        end

        puts 'Enter the Year:'
        y = gets.chomp.to_i
        until (1900..2050).include? y
        puts 'Enter a valid Year: '
        y = gets.chomp.to_i
        end
        

        n_date = "#{d}-#{m}-#{y}"
        
        p 'Enter the Title of that Date: '
        title = gets.chomp

        $events.each_pair do |key, value|
            value.each_with_index do |obj,i|
                if title == obj.title && n_date == key
                    value.delete_at(i)
                end
            end
        end
        puts "Event Deleted"
       p $events   
    end
    
    ########################## End of Delete Methods ########################## 
    ########################## Calender View ########################## 
    
    def self.view_calender
       
       h =  $events.map { |key, value| [key, value.length] }.to_h
       puts "Calender View!"

    puts h
    end
end
########################## End Of Class ##########################
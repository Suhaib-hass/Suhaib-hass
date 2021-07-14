# frozen_string_literal: false

class Calender
  attr_accessor :date

  def self.add_event(_array, _title, _desc)
    arr = []

    puts 'Enter the day:'
    d = gets.chomp.to_i
    until (1..31).include? d
      puts 'Enter a valid date: '
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

    @date = "#{d}-#{m}-#{y}"

    puts 'Enter the title of Event: '
    _title = gets.chomp
    puts 'Enter the Description of Event: '
    _desc = gets.chomp

    arr << _title
    arr << _desc

    p arr
    hash = {}
    hash = { @date => arr }

    _array << hash
    p _array
  end

  def self.modify_event(_array)
    p 'Enter the Title to modify: '
    n_title = gets.chomp
    p 'Enter the date to modify: '
    n_date = gets.chomp

    _array.each do |item|
      item.each_pair do |key, value|
        puts "#{key} = #{value}"
        next unless n_date == key && n_title == value[0]

        p 'Do you want to change the Date? (Y/N)'
        choic = gets.chomp

        if %w[Y y].include?(choic)
          p 'Enter a new Date: '
          new_date = gets.chomp
          key = new_date
          p key
        elsif %w[N n].include?(choic)
          p 'Nothing happened to your Date'
          p key
        end
        p 'do you want to change the title? (Y/N)'
        op = gets.chomp
        if %w[Y y].include?(op)
          p 'Enter a new title: '
          new_title = gets.chomp
          value[0] = new_title
        elsif %w[N n].include?(op)
          p 'Nothing Happened to your title'
          p value[0]
        end

        p 'Do you want to change Description?(Y/N)'
        option = gets.chomp

        if %w[Y y].include?(option)
          p 'Please Enter a new Description: '
          new_desc = gets.chomp
          value[1] = new_desc
        elsif %w[N n].include?(option)
          p 'Nothing happened to description'
          p value[1]
        end
      end
    end
    p _array
  end

  def self.delete_event_single_date(_array)
    p 'Enter the date to Delete an Event: '
    n_date = gets.chomp
    p 'Enter the Title of that Date: '
    n_title = gets.chomp

    _array.each do |item|
      item.each_pair do |key, value|
        item.delete_if { n_date == key && n_title == value[0] }
      end
    end
    p _array
  end

  def self.delete_allevent_single_date(_array)
    p 'Enter the date to Delete an Event: '
    n_date = gets.chomp
    _array.each do |item|
      item.each_pair do |key, _value|
        item.delete_if { n_date == key }
      end
    end
    p _array
  end

  def self.delete_allevent_on_month(_array)
    p 'Enter the month: '
    m = gets.chomp
    _array.each do |item|
      item.each_pair do |key, _value|
        dat, mon, year = key.split('-')
        p dat, mon, year
        item.delete_if { m == mon }
      end
    end
    p _array
  end

  def self.calender_view(_array)
    puts '     Date            No of Events'
    i = 0
    while i < _array.length
    _array.each do |item|
      item.each_pair do |key, value|
        puts "#{key} = #{i}"
        
      end
    end
  end
end

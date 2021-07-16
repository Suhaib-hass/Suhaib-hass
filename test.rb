require '/home/suhaib/Desktop/ems/calen.rb'
require '/home/suhaib/Desktop/ems/even.rb'
require 'rspec/autorun'


describe "CreateEvent" do
    it "will create an event " do
        ce = Event.new()
        expected_output = ce.add_event()
        expect(expected_output).to eq("Event Added!")
    end
end


describe "modifyEvent" do
    it "will modify an event " do
        ce = Event.new()
         expected_output = ce.modify_event
        expect(expected_output).to eq("Event Modify!")
    end
end

describe "deleteEvent" do
    it "Delete an Event on Single Date " do
       expected_output = ce.delete_event_single_date
        expect(expected_output).to eq("Event Deleted")
    end
end

describe "deleteEvent" do
    it "Delete all events on single date " do
       expected_output = ce.delete_allevent_single_date
        expect(expected_output).to eq("Event Deleted")
    end
end

describe "deleteEvent" do
    it "Delete all events on same month" do
       expected_output = ce.delete_allevent_on_month
        expect(expected_output).to eq("Event Deleted")
    end
end

describe "calenderView" do
    it "will show no of events on a single date " do
       expected_output = ce.view_calender
        expect(expected_output).to eq("Calender View!")
    end
end
require 'rails_helper'

describe 'List Model' do
    it 'Able to create a new list'
    list_1 = List.create(title: "Chores", task_id: 2, start_time: "10:00 AM", end_time: "10:00 PM", start_date: "07/04/19", end_date: "07/04/19"  )


    visit '/list'
    save_and_open_page
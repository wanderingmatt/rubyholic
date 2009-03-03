class AddEventTestData < ActiveRecord::Migration
  def self.up
    Event.delete_all
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Xavier Institute for Higher Learning').id,
      :start_time => '2009-02-24 23:00:00',
      :end_time => '2009-02-24 23:45:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('Brotherhood of Mutants').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-02-23 21:45:00',
      :end_time => '2009-02-23 22:00:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('Weapon X').id,
      :location_id => Location.find_by_name('Epic Cafe').id,
      :start_time => '2009-03-03 08:45:00',
      :end_time => '2009-03-03 09:45:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('The Avengers').id,
      :location_id => Location.find_by_name('X-Mansion Basement').id,
      :start_time => '2009-03-03 21:00:00',
      :end_time => '2009-03-03 23:00:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('The Avengers').id,
      :location_id => Location.find_by_name('X-Mansion Basement').id,
      :start_time => '2009-03-10 19:30:00',
      :end_time => '2009-03-10 21:45:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('Brotherhood of Mutants').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-04-13 13:15:00',
      :end_time => '2009-04-13 18:00:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('Brotherhood of Mutants').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-03-24 20:00:00',
      :end_time => '2009-03-24 23:45:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Vivace').id,
      :start_time => '2009-03-14 11:30:00',
      :end_time => '2009-03-14 13:00:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('Horsemen of Apocalypse').id,
      :location_id => Location.find_by_name('Ikes Coffee and Tea').id,
      :start_time => '2009-03-16 16:30:00',
      :end_time => '2009-03-16 18:45:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('S.H.I.E.L.D.').id,
      :location_id => Location.find_by_name('The White House').id,
      :start_time => '2009-03-11 10:00:00',
      :end_time => '2009-03-11 12:00:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('The Avengers').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-04-26 08:15:00',
      :end_time => '2009-04-26 11:00:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
    Event.create (
      :group_id => Group.find_by_name('Acolytes').id,
      :location_id => Location.find_by_name('Asteroid M').id,
      :start_time => '2009-04-02 20:15:00',
      :end_time => '2009-04-02 23:45:00',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante."
    )
  end

  def self.down
    Event.delete_all
  end
end

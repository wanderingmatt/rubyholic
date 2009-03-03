class AddEventTestData < ActiveRecord::Migration
  def self.up
    Event.delete_all
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Xavier Institute for Higher Learning').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('Brotherhood of Mutants').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-02-23 21:44:51',
      :end_time => '2009-02-23 21:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('Weapon X').id,
      :location_id => Location.find_by_name('Epic Cafe').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('The Avengers').id,
      :location_id => Location.find_by_name('X-Mansion Basement').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('The Avengers').id,
      :location_id => Location.find_by_name('X-Mansion Basement').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('Brotherhood of Mutants').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('Brotherhood of Mutants').id,
      :location_id => Location.find_by_name('Starbucks').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Vivace').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Xavier Institute for Higher Learning').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Xavier Institute for Higher Learning').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Xavier Institute for Higher Learning').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
    Event.create (
      :group_id => Group.find_by_name('X-Men').id,
      :location_id => Location.find_by_name('Xavier Institute for Higher Learning').id,
      :start_time => '2009-02-24 23:44:51',
      :end_time => '2009-02-24 23:44:51',
      :description => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dui elit, fringilla a, faucibus euismod, varius nec, orci. Curabitur malesuada, sem vitae dignissim
                      sodales, dui sapien rutrum elit, a feugiat arcu urna sed ante. Curabitur dui orci, pulvinar bibendum, porttitor ac, consequat ut, nibh. Sed lorem elit, consectetur ac,
                      placerat sed, pellentesque et, orci. Sed non libero eu tortor imperdiet tincidunt. Pellentesque condimentum dictum sapien. Integer est urna, tempor in, ultrices posuere,
                      tincidunt vel, urna. Aenean nec massa. Vestibulum gravida. Duis laoreet facilisis felis. Pellentesque pellentesque hendrerit purus. Morbi non felis id augue aliquam
                      fringilla. Quisque at arcu vel sem volutpat congue."
    )
  end

  def self.down
    Event.delete_all
  end
end

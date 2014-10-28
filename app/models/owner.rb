class Owner < ActiveRecord::Base
  
  def name
    name = 'Asim'
  end
  def birthdate
    birthdate = Date.new(1990, 9, 22)
  end
  def countdown
    today = Date.today
    birthday = Date.new(today.year, birthdate.month, birthdate.day)
    countdown = (birthday - today).to_i
  end
  
end





class Owner < ActiveRecord::Base
  
  validates_presence_of :email
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  
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





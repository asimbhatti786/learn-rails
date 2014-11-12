class Friend < ActiveRecord::Base
  #make a relationship with user
  belongs_to :user
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       has_one :profile , dependent: :destroy
       has_many :contact, dependent: :destroy
       accepts_nested_attributes_for :profile
        accepts_nested_attributes_for :contact
       
end

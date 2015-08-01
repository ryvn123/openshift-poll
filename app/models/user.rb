class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :timeoutable and :omniauthable, :registerable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end

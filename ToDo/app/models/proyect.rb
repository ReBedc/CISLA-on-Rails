class Proyect < ActiveRecord::Base
   has_many :tasks
   has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

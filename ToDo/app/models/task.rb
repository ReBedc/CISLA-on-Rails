class Task < ActiveRecord::Base
  belongs_to :proyect
  belongs_to :priority
  validates_presence_of :proyect_id
  validates_presence_of :priority_id
  acts_as_taggable
  acts_as_taggable_on :tags
end

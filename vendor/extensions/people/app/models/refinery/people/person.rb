module Refinery
  module People
    class Person < Refinery::Core::BaseModel
      self.table_name = 'refinery_people'

      attr_accessible :name, :title, :phone, :email, :category, :photo_id, :position

      acts_as_indexed :fields => [:name, :title, :phone, :email, :category]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :photo, :class_name => '::Refinery::Image'
    end
  end
end

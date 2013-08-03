module Refinery
  module Carousels
    class Carousel < Refinery::Core::BaseModel
      self.table_name = 'refinery_carousels'

      attr_accessible :title, :description, :picture_id, :position

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end

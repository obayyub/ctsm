module Refinery
  module Textbooks
    class Textbook < Refinery::Core::BaseModel
      self.table_name = 'refinery_textbooks'

      attr_accessible :authors, :title, :state, :picture_id, :position

      acts_as_indexed :fields => [:authors, :title, :state]

      validates :authors, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'
    end
  end
end

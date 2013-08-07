module Refinery
  module Visitors
    class Visitor < Refinery::Core::BaseModel
      self.table_name = 'refinery_visitors'

      attr_accessible :parking, :other, :position

      acts_as_indexed :fields => [:parking, :other]

      validates :parking, :presence => true, :uniqueness => true
    end
  end
end

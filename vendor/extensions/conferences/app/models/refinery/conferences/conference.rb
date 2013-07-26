module Refinery
  module Conferences
    class Conference < Refinery::Core::BaseModel
      self.table_name = 'refinery_conferences'

      attr_accessible :author, :title, :content, :position

      acts_as_indexed :fields => [:author, :title, :content]

      validates :author, :presence => true, :uniqueness => true
    end
  end
end

module Refinery
  module Journals
    class Journal < Refinery::Core::BaseModel
      self.table_name = 'refinery_journals'

      attr_accessible :authors, :title, :content, :pdf_id, :position

      acts_as_indexed :fields => [:authors, :title, :content]

      validates :authors, :presence => true, :uniqueness => true

      belongs_to :pdf, :class_name => '::Refinery::Resource'
    end
  end
end

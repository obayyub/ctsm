module Refinery
  module Publications
    class Publication < Refinery::Core::BaseModel
      self.table_name = 'refinery_publications'

      attr_accessible :authors, :category, :title, :content, :pdf_id, :picture_id, :position

      acts_as_indexed :fields => [:authors, :category, :title, :content]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :picture, :class_name => '::Refinery::Image'

      belongs_to :pdf, :class_name => '::Refinery::Resource'
    end
  end
end

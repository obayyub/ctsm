module Refinery
  module Articles
    class Article < Refinery::Core::BaseModel
      self.table_name = 'refinery_articles'

      attr_accessible :title, :link, :content, :position

      acts_as_indexed :fields => [:title, :link, :content]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end

module Refinery
  module Textbooks
    class TextbooksController < ::ApplicationController

      before_filter :find_all_textbooks
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @textbook in the line below:
        present(@page)
      end

      def show
        @textbook = Textbook.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @textbook in the line below:
        present(@page)
      end

    protected

      def find_all_textbooks
        @textbooks = Textbook.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/textbooks").first
      end

    end
  end
end

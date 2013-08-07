module Refinery
  module Visitors
    class VisitorsController < ::ApplicationController

      before_filter :find_all_visitors
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @visitor in the line below:
        present(@page)
      end

      def show
        @visitor = Visitor.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @visitor in the line below:
        present(@page)
      end

    protected

      def find_all_visitors
        @visitors = Visitor.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/visitors").first
      end

    end
  end
end

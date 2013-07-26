module Refinery
  module Journals
    class JournalsController < ::ApplicationController

      before_filter :find_all_journals
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @journal in the line below:
        present(@page)
      end

      def show
        @journal = Journal.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @journal in the line below:
        present(@page)
      end

    protected

      def find_all_journals
        @journals = Journal.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/journals").first
      end

    end
  end
end

module Refinery
  module Abouts
    class AboutsController < ::ApplicationController

      before_filter :find_all_abouts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @about in the line below:
        present(@page)
      end

      def show
        @about = About.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @about in the line below:
        present(@page)
      end

    protected

      def find_all_abouts
        @abouts = About.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/abouts").first
      end

    end
  end
end

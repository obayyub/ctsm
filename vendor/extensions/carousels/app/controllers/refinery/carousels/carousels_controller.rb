module Refinery
  module Carousels
    class CarouselsController < ::ApplicationController

      before_filter :find_all_carousels
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @carousel in the line below:
        present(@page)
      end

      def show
        @carousel = Carousel.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @carousel in the line below:
        present(@page)
      end

    protected

      def find_all_carousels
        @carousels = Carousel.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/carousels").first
      end

    end
  end
end

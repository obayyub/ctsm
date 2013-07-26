module Refinery
  module People
    class PeopleController < ::ApplicationController

      before_filter :find_all_people
      before_filter :find_page

      def index
        @people = Person.all
        @directors = Person.where(category: 'Directors')
        @associates = Person.where(category: 'Associates')
        @graduates = Person.where(category: 'Graduate Students')
        @undergraduates = Person.where(category: 'Undergraduate Students')
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @person in the line below:
        present(@page)
        respond_to do |format|
          format.html
          format.json { render json: @people }
        end
      end

      def show
        @person = Person.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @person in the line below:
        present(@page)
        respond_to do |format|
          format.html
          format.json { render json: @person }
        end
      end

    protected

      def find_all_people
        @people = Person.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/people").first
      end

    end
  end
end

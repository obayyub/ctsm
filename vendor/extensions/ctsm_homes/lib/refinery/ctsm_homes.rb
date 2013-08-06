require 'refinerycms-core'

module Refinery
  autoload :CtsmHomesGenerator, 'generators/refinery/ctsm_homes_generator'

  module CtsmHomes
    require 'refinery/ctsm_homes/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end

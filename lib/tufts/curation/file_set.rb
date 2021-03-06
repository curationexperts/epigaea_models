module Tufts
  module Curation
    ##
    # A base class for Tufts FileSets
    class FileSet < ActiveFedora::Base
      ##
      # Use `Hyrax::FileSet` in subclasses if it is available. Hyrax
      # applications will have this loaded.
      def self.inherited(subclass)
        subclass.include 'Hyrax::FileSetBehavior'.constantize
      rescue NameError => e
        warn 'Hyrax::FileSetBehavior is unavailable; skipping inclusion ' \
             "in #{subclass}.\n#{e}"
      end
    end
  end
end

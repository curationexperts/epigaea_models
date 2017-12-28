# frozen_string_literal: true

require 'hyrax/controlled_vocabularies/location'
require 'models/concerns/hyrax/core_metadata'
require 'models/concerns/hyrax/basic_metadata'

require 'tufts/curation/vocab/tufts'
require 'tufts/curation/schema/administrative'
require 'tufts/curation/schema/descriptive'
require 'tufts/curation/schema/transcription'

module Tufts
  module Curation
    ##
    # A base class for Tufts Models
    class TuftsModel < ActiveFedora::Base
      include Hyrax::CoreMetadata

      validates :title, presence: { message: 'Your work must have a title.' }

      validates :title, length: {
        maximum: 1,
        message: 'There can be only one title'
      }

      include Tufts::Curation::Schema::Administrative
      include Tufts::Curation::Schema::Descriptive

      # This must be included at the end, because it finalizes the metadata
      # schema (by adding accepts_nested_attributes)
      include Hyrax::BasicMetadata
    end
  end
end

# Generated via
#  `rails generate hyrax:work Composition`
class Composition < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  include ::BinaryArts::Metadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your composition must have a title.' }
  validates :composer, presence: { message: 'Your composition must have a composer.' }
  validates :instruments, presence: { message: 'Your composition must have instruments.' }

  self.human_readable_type = 'Composition'

  property :composer, predicate: ::RDF::Vocab::DC11.creator do |index|
    index.as :stored_searchable, :facetable
  end

  has_many :performances
end

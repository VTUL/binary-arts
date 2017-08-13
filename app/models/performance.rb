# Generated via
#  `rails generate hyrax:work Performance`
class Performance < ActiveFedora::Base
  include ::Hyrax::WorkBehavior
  include ::Hyrax::BasicMetadata
  include ::BinaryArts::Metadata
  # Change this to restrict which works can be added as a child.
  # self.valid_child_concerns = []
  validates :title, presence: { message: 'Your performance must have a title.' }
  validates :performer, presence: { message: 'Your performance must have a performer.' }
  validates :instruments, presence: { message: 'Your performance must have instruments.' }

  self.human_readable_type = 'Performance'

  property :performer, predicate: ::RDF::Vocab::DC11.creator
end

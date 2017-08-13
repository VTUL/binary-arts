# Generated via
#  `rails generate hyrax:work Composition`
module Hyrax
  class CompositionForm < Hyrax::Forms::WorkForm
    self.model_class = ::Composition
    self.terms = [:composer, :title, :instruments, :description,
                  :date, :tags, :length, :genre, :software,
                  :medium]

    self.required_fields = [:composer, :title, :instruments]
  end
end

# Generated via
#  `rails generate hyrax:work Performance`
module Hyrax
  class PerformanceForm < Hyrax::Forms::WorkForm
    self.model_class = ::Performance

    self.terms = [:performer, :title, :instruments, :description,
                  :date, :tags, :length, :genre, :software,
                  :medium, :location]

    self.required_fields = [:performer, :title, :instruments]
  end
end

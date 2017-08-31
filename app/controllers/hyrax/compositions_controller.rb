# Generated via
#  `rails generate hyrax:work Composition`

module Hyrax
  class CompositionsController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Composition
    self.show_presenter = MusicWorkPresenter

    def show
      super
      comp = Composition.find(params[:id])
      @performances = comp.performances      
    end
  end
end

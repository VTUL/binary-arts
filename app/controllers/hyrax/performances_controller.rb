# Generated via
#  `rails generate hyrax:work Performance`

module Hyrax
  class PerformancesController < ApplicationController
    # Adds Hyrax behaviors to the controller.
    include Hyrax::WorksControllerBehavior
    include Hyrax::BreadcrumbsForWorks
    self.curation_concern_type = ::Performance
    self.show_presenter = MusicWorkPresenter
    
    def show
      super
      perf = Performance.find(params[:id])
      @composition = perf.composition
      if !@composition.nil?
        @composer_link = "/users/#{@composition.composer.first.gsub('.', '-dot-')}"
      end
    end
  end
end

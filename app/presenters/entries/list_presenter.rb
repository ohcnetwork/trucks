module Entries
  class ListPresenter < ApplicationPresenter
    def initialize(view_context, entires_scope)
      super(view_context)
      @entires_scope = entires_scope
    end

    def page_title
      "Trucks | Corona Safe Network"
    end

    def entries
      @entries ||= filter.present? ? filter.includes(user: :panchayat).order('created_at DESC') : scope_by_date.order('created_at DESC')
    end

    def filter
      search = view.params[:search]
      if search.present?
        search[:category].present? ? filter_by_category(scope_by_date) : scope_by_date
      else
        scope_by_date
      end
    end

    def date_window
      start_date.beginning_of_day..end_date.end_of_day
    end

    def default_start_date
      Time.zone.yesterday.to_date
    end

    def start_date
      @start_date ||= view.params[:search].try(:[], :start_date) ? view.params[:search][:start_date].to_date : default_start_date
    end

    def end_date
      @end_date ||= view.params[:search].try(:[], :end_date) ? view.params[:search][:end_date].to_date : Time.zone.now.to_date
    end

    def scope_by_date
      @scope_by_date ||= @entires_scope.where(created_at: date_window)
    end

    def filter_by_category(consultations)
      consultations.where(status: view.params[:search][:category])
    end

    def search
      @search ||= view.params[:search]
    end

    def text_search_text
      text_search.try(:[], :vehicle_number) ? text_search[:vehicle_number] : ''
    end

    def search_category
      search.present? ? search[:category].present? ? search[:category] : nil : nil
    end
  end
end
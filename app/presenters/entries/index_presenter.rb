module Entries
  class IndexPresenter < ApplicationPresenter
    def initialize(view_context)
      super(view_context)
    end

    def page_title
      "Trucks | Corona Safe Network"
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
      @scope_by_date ||= current_user.entries.where(created_at: date_window)
    end

    def search
      @search ||= view.params[:search]
    end

    def search_category
      search.present? ? search[:category].present? ? search[:category] : nil : nil
    end

    def text_search
      @text_search ||= view.params[:text_search]
    end

    def text_search_text
      text_search.try(:[], :vehicle_number) ? text_search[:vehicle_number] : ''
    end

    def summary
      @summary = Entry.where(created_at: date_window)
    end

    def stats
      @stats ||= summary.includes(user: :panchayat).each_with_object({}) do |e, hash|
        old_hash = hash
        hash[e.user&.panchayat&.name] = [
          old_hash[e.user&.panchayat&.name]&.first.to_i + (e.status == 'entry' ? 1 : 0),
          old_hash[e.user&.panchayat&.name]&.second.to_i + (e.status == 'entry' ? 0 : 1),
          old_hash[e.user&.panchayat&.name]&.last.to_i + 1
        ]
      end
    end

    def text_search_entries(number)
      Entry.joins(:vehicle).where("vehicles.number LIKE ?", "%#{number.downcase!}%")
    end

    def text_search_results
      @text_search_results ||= text_search.try(:[], :vehicle_number) ? text_search_entries(text_search[:vehicle_number]) : Entry.none
    end
  end
end
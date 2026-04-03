class HomeController < ApplicationController
  def index
    render json: {
      message: "Finance Dashboard System Endpoints",
      endpoints: {
        users: {
          list: "/users",
          create: "/users [POST]",
          update: "/users/:id [PATCH]",
          change_status: "/users/:id/status [PATCH]"
        },
        records: {
          list: "/financial_records",
          list_filter_by_record_type: "/financial_records?record_type=income",
          list_filter_by_category: "/financial_records?category=bills",
          list_filter_by_date: "/financial_records?start_date=2026-03-21&end_date=2026-03-31",
          create: "/financial_records [POST]",
          update: "/financial_records/:id [PATCH]",
          delete: "/financial_records/:id [DELETE]",
        },
        dashboard_summary: "/financial_records/summary"
      }
    }
  end
end

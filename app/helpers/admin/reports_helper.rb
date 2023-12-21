module Admin::ReportsHelper
  def report_status_options
    Report.statuses.map do |key, _value|
      [t("enums.report.status.#{key}"), key]
    end
  end
end

class LogsController < ApplicationController

  def index
    timestamp = Time.at(params[:timestamp].to_i).utc.to_datetime

    logs = ChangeLog
      .where(object_id: params[:object_id], object_type: params[:object_type])
      .where('timestamp <= ?', timestamp)
      .order('timestamp')

    changes = {}
    logs.each { |log| changes.merge! log.object_changes }
    result = changes.empty? ? [] : [changes]

    render json: result, status: :ok
  end
end

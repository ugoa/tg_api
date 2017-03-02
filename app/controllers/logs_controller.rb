class LogsController < ApplicationController

  def index
    timestamp = Time.at(params[:timestamp].to_i).utc.to_datetime

    logs = ChangeLog
      .where(object_id: params[:object_id], object_type: params[:object_type])
      .where('timestamp <= ?', timestamp)

    changes = {}
    logs.each { |log| changes.merge! log.object_changes }

    render json: changes, status: :ok
  end
end
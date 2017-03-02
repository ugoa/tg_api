class CsvImportingsController < ApplicationController
  def index
    render json: {}, status: :ok
  end

  def create
    ChangeLog.import(params[:file])

    render json: {}, status: :created
  end
end

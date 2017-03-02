class CsvImportingsController < ApplicationController
  def index
    render json: {}, status: :ok
  end

  def create
    require 'csv'

    File.open(params[:file].path, 'r') do |file|

      CSV.foreach(file, headers: true) do |row|
        # # First line is header, skip
        # next if index == 0
        # parsed_row = CSV.parse(line.gsub('\"', '""')).first
        log = ChangeLog.new(parsed_row.to_h)
      end
    end

    # CSV.foreach(text, headers: true) do |line|
    #   # # First line is header, skip
    #   # next if index == 0
    #   # parsed_row = CSV.parse(line.gsub('\"', '""')).first
    #   byebug
    #   log = ChangeLog.new(parsed_row.to_h)
    # end
  end
end

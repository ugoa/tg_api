class ChangeLog < ApplicationRecord
  store_accessor :object_changes, :status

  def self.import(file)
    require 'csv'

    text = File.read(file.path).gsub('\"', '""')
    csv = CSV.parse(text, headers: true)

    csv.each do |row|
      attrs = row.to_hash
      attrs['timestamp'] = Time.at(attrs['timestamp'].to_i).utc.to_datetime
      attrs['object_changes'] = JSON.parse attrs['object_changes']
      ChangeLog.create(attrs)
    end
  end

end

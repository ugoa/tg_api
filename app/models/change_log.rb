class ChangeLog < ApplicationRecord

  def self.import(file)
    require 'csv'

    text = File.read(file.path).gsub('\"', '""')
    csv = CSV.parse(text, headers: true)

    csv.each do |row|
      log = ChangeLog.new(row.to_hash)
      log.object_changes = JSON.parse log.object_changes
      log.save
    end
  end

end

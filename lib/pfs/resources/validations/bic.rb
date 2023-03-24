# frozen_string_literal: true

module PFS
  module Resources
    module Validations
      class Bic < Base
        map :bic
        map :valid
        map :sct_inst_supported
      end
    end
  end
end

C
CSV.read("prod_banks.csv").first(2).each { |row| puts client.validations.bic(row[0]).sct_inst_supported }

CSV.open("prod_vs_pfs.csv", "wb") do |csv|
  CSV.read("prod_banks.csv").each do |row|
    validation = client.validations.bic(bic: row[0])
    csv << [row[0], row[1], validation.valid, validation.sct_inst_supported]
    csv.flush
    sleep(0.5)
  end
end

CSV.open("prod_vs_pfs.csv", "wb") do |csv|
  uniq[2606..-1].each do |row|
    validation = client.validations.bic(bic: row[0])
    csv << [row[0], row[1], validation.valid, validation.sct_inst_supported]
    csv.flush
    sleep(0.2)
  end
end

keys = []
uniq = CSV.read("prod_banks.csv").select do |r|
  if keys.include?(r[0])
    false
  else
    keys << r[0]
    true
  end
end

Bank.where(code: "16001462", country_code: "PL")

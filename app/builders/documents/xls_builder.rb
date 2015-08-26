require 'spreadsheet'
module Documents
    module XlsBuilder

        def self.read_file path
            Spreadsheet.open path
        end
    end
end
class EmailHandler
    def initialize(emails)
        @emails = emails
    end
    
    def get_data
        emails.map { |email| EmailValues.new(email).to_h }
    end
    
    private
    attr_reader :emails
end

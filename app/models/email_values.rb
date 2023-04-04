class EmailValues
    #example for value object design pattern
    def initialize(email)
        @email = email
    end
    
    def name
        email.match(/([^@]*)/).to_s
    end
    
    def domain
        email.split("@").last
    end
    
    def to_h
        { name: name, domain: domain }
    end
    
    private
    attr_reader :email
end

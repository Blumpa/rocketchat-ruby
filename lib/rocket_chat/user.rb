module RocketChat
  #
  # Rocket.Chat User
  #
  class User
    # Raw user data
    attr_reader :data

    #
    # @param [Hash] data Raw user data
    #
    def initialize(data)
      @data = Util.stringify_hash_keys data
    end

    # User ID
    def id
      data['_id']
    end

    # User name
    def name
      data['name']
    end

    # User emails
    def emails
      data['emails'] || []
    end

    # User email
    def email
      emails.first && emails.first['address']
    end

    # User email verified
    def email_verified?
      emails.first && emails.first['verified']
    end

    # User status
    def status
      data['status']
    end

    # User connection status
    def status_connection
      data['statusConnection']
    end

    # User username
    def username
      data['username']
    end

    # User UTC offset
    def utc_offset
      data['utcOffset']
    end

    # User active
    def active?
      data['active']
    end

    def inspect
      format(
        '#<%s:0x%p @id="%s" @username="%s" @active="%s">',
        self.class.name,
        object_id,
        id,
        username,
        active?
      )
    end
  end
end
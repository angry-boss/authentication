module Authentication
  module User

    def self.included(base)
      base.has_many :user_sessions, :class_name => 'Authentication::Session', :as => :user, :dependent => :delete_all
    end

  end
end

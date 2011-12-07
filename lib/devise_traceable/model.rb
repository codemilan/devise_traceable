require 'devise_traceable/hooks/traceable'

module Devise
  module Models
    # Trace information about your user sign in. It tracks the following columns:

    # * resource_id
    # * sign_in_at
    # * sign_out_at

    module Traceable
      def track_login!(request)
        "#{self.class}Tracing".constantize.create(:sign_in_at => self.current_sign_in_at, :ip => request.remote_ip, :user_agent => request.headers["User-Agent"], "#{self.class}".foreign_key.to_sym => self.id)
      end
      def track_logout!(request)
        login = "#{self.class}Tracing".constantize.where(:sign_in_at => self.current_sign_in_at, "#{self.class}".foreign_key.to_sym => self.id)
        new_current = Time.now
        if login
          login.first.update_attribute(:sign_out_at, new_current)
        else
          "#{self.class}Tracing".constantize.create(:sign_in_at => self.current_sign_in_at, :ip => request.remote_ip,
                                                     "#{self.class}".foreign_key.to_sym => self.id,
                                                     :sign_out_at => new_current)
        end
      end

    end
  end
end


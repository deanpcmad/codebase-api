module CodebaseApi
  class User

    class << self

      # list all users
      def all
        CodebaseApi::Request.request("users")
      end

      # list all roles
      def roles
        CodebaseApi::Request.request("roles")
      end

      # create a user
      def create(first_name, last_name, email_address, role_id=nil)
        CodebaseApi::Request.request("users", :post, { :user => { :first_name => first_name, :last_name => last_name, :email_address => email_address, :role_id => role_id } } )
      end

    end
  end
end
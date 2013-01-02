module CodebaseApi
	class PublicKey

		class << self

			# lists all the public keys for a user
			def all(username)
				CodebaseApi::Request.request("users/#{username}/public_keys")
			end

			# lists all the deployment keys for a project
			def deploy_keys(project)
				CodebaseApi::Request.request("#{project}/public_keys")
			end

			# create a new public key for a user
			def create(username, description, key)
				CodebaseApi::Request.request("users/#{username}/public_keys", :post, { :public_key => { :description => description, :key => key } })
			end

			# create a new deployment key for a project
			def create_deployment(project, description, key)
				CodebaseApi::Request.request("#{project}/public_keys", :post, { :public_key => { :description => description, :key => key } })
			end

		end
	end
end
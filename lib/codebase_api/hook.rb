module CodebaseApi
	class Hook

		class << self

			# list the hooks for a repository
			def all(project, repo_name)
				CodebaseApi::Request.request("#{project}/#{repo_name}/hooks")
			end

			# create a hook for a project & repo
			def create(project, repo_name, url, username=nil, password=nil)
				CodebaseApi::Request.request("#{project}/#{repo_name}/hooks", :post, {:repository_hook => {:url => url, :username => username, :password => password}} )
			end

		end
	end
end
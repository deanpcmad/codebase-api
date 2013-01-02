module CodebaseApi
	class Repository

		class << self

			# lists all the repositories for a project
			def all(project)
				CodebaseApi::Request.request("#{project}/repositories")
			end

			# show a specified repository for a project
			def show(project, repo_name)
				CodebaseApi::Request.request("#{project}/#{repo_name}")
			end

			# creates a new repository for a project
			def create(project, repo_name, repo_scm)
				CodebaseApi::Request.request("#{project}/repositories", :post, {:repository => {:name => repo_name, :scm => repo_scm}})
			end

		end
	end
end
module CodebaseApi
	class Project

		class << self

			# display all projects
			def all
				CodebaseApi::Request.request("projects")
			end

			# create project - name is required
			def create(name)
				CodebaseApi::Request.request("create_project", :post, {:project => {:name => name}})
			end

			# view a specific project
			def view(project)
				CodebaseApi::Request.request(project)
			end

			# view repositories for a project
			def repos(project)
				CodebaseApi::Request.request("#{project}/repositories")
			end

			# delete a project
			def delete(project)
				CodebaseApi::Request.request(project, :delete)
				return true
			end

		end

	end
end
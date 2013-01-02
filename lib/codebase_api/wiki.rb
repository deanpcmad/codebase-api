module CodebaseApi
	class Wiki

		class << self

			# lists all the wiki pages for a project
			def all(project)
				CodebaseApi::Request.request("#{project}/wiki/index")
			end

			# show a specified wiki page for a project
			def show(project, page_name)
				CodebaseApi::Request.request("#{project}/wiki/#{page_name}")
			end

		end
	end
end
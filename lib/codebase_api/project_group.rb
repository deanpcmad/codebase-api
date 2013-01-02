module CodebaseApi
	class ProjectGroup

		# displays a list of all project groups
		def self.all
			CodebaseApi::Request.request("project_groups")			
		end

	end
end
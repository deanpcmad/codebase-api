module CodebaseApi
  class ProjectUser

    # list of all users assigned to a project
    def self.all(project)
      CodebaseApi::Request.request("#{project}/assignments")      
    end

    # assign users to a project
    def self.assign(project, users)
      CodebaseApi::Request.request("#{project}/assignments", :post, {:users => {:user => users } })
    end

  end
end
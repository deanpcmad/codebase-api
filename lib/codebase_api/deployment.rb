module CodebaseApi
  class Deployment

    class << self

      # create a deployment for a project & repo
      def create(project, repo_name, branch, revision, environment, servers)
        CodebaseApi::Request.request("#{project}/#{repo_name}/deployments", :post, {:deployment => {:branch => branch, :revision => revision, :environment => environment, :servers => servers}} )
      end

    end
  end
end
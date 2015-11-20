module CodebaseApi
  class Commit

    class << self

      # show all commits on a specified ref
      def show(project, repo_name, ref)
        CodebaseApi::Request.request("#{project}/#{repo_name}/commits/#{ref}")
      end

      # show all commits on a specified ref for a path
      def show_path(project, repo_name, ref, path)
        CodebaseApi::Request.request("#{project}/#{repo_name}/commits/#{ref}/#{path}")
      end

    end
  end
end
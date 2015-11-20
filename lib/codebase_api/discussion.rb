module CodebaseApi
  class Discussion

    class << self

      # show all discussions for a project
      def all(project)
        CodebaseApi::Request.request("#{project}/discussions")
      end

      # show all discussion categories for a project
      def categories(project)
        CodebaseApi::Request.request("#{project}/discussions/categories")
      end

      # show all the posts in a discussion for a project
      def show(project, discussion_permalink)
        CodebaseApi::Request.request("#{project}/discussions/#{discussion_permalink}/posts")
      end

      # create a new discussion for a project
      def create(project, subject, content, category_id=nil)
        CodebaseApi::Request.request("#{project}/discussions", :post, {:discussion => {:subject => subject, :content => content, :category_id => category_id}} )
      end

      # update a discussion for a project
      def update(project, discussion_permalink, content)
        CodebaseApi::Request.request("#{project}/discussions/#{discussion_permalink}/posts", :post, {:discussion_post => {:content => content}} )
      end

    end
  end
end
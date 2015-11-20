module CodebaseApi
  class TimeSession

    class << self

      # show all time sessions for a project
      def all(project)
        CodebaseApi::Request.request("#{project}/time_sessions")
      end

      # show time sessions added today for a project
      def today(project)
        CodebaseApi::Request.request("#{project}/time_sessions/day")
      end

      # show time sessions added this week for a project
      def this_week(project)
        CodebaseApi::Request.request("#{project}/time_sessions/week")
      end

      # show time sessions added this month for a project
      def this_month(project)
        CodebaseApi::Request.request("#{project}/time_sessions/month")
      end

      # create a new time session for a project
      def create(project, summary, minutes)
        CodebaseApi::Request.request("#{project}/time_sessions", :post, {:time_session => {:summary => summary, :minutes => minutes}} )
      end

      # show an existing time session for a project
      def show(project, time_session)
        CodebaseApi::Request.request("#{project}/time_sessions/#{time_session}")
      end

      # update an existing time session for a project
      def update(project, time_session, summary, minutes)
        CodebaseApi::Request.request("#{project}/time_sessions/#{time_session}", :put, {:time_session => {:summary => summary, :minutes => minutes}})
      end

      # delete an existing time session for a project
      def delete(project, time_session)
        CodebaseApi::Request.request("#{project}/time_sessions/#{time_session}", :delete)
        return true
      end

    end
  end
end
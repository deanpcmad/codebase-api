module CodebaseApi
	class Ticket

		class << self

			# list the tickets for a project
			def all(project)
				CodebaseApi::Request.request("#{project}/tickets")
			end

			# search all tickets
			def search(project, query)
				CodebaseApi::Request.request("#{project}/tickets?query=#{query}")
			end

			# create a new ticket for a project
			def create(project, summary, description)
				CodebaseApi::Request.request("#{project}/tickets", :post, {:ticket => {:summary => summary, :description => description}} )
			end

			# show all ticket statuses
			def statuses(project)
				CodebaseApi::Request.request("#{project}/tickets/statuses")
			end

			# show all ticket priorities
			def priorities(project)
				CodebaseApi::Request.request("#{project}/tickets/priorities")
			end

			# show all ticket categories
			def categories(project)
				CodebaseApi::Request.request("#{project}/tickets/categories")
			end

		end
	end
end
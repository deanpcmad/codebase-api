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

		end
	end
end
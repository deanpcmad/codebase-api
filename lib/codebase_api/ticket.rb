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

			# view the notes for a ticket
			def show(project, ticket_id)
				CodebaseApi::Request.request("#{project}/tickets/#{ticket_id}/notes")
			end

			# show a specific note for a ticket
			def show_note(project, ticket_id, note_id)
				CodebaseApi::Request.request("#{project}/tickets/#{ticket_id}/notes/#{note_id}")
			end

			# create a note for a ticket
			def update(project, ticket_id, content, time_added=nil, status_id=nil, priority_id=nil, category_id=nil, assignee_id=nil, summary=nil)
				attributes = {:ticket_note => { :content => content, :time_added => time_added, :changes => { :status_id => status_id, :priority_id => priority_id, :category_id => category_id, :assignee_id => assignee_id, :summary => summary } } }
				CodebaseApi::Request.request("#{project}/tickets/#{ticket_id}/notes", :post, attributes)
			end

		end
	end
end
# CodebaseApi

A gem to interact with the [Codebase](http://www.codebasehq.com) API.

## Installation

Add this line to your application's Gemfile:

    gem 'codebase_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install codebase_api

## Usage

The Codebase API requires authentication using your account name & username along with your API Key.

In a Rails app, create a file called `config/initializers/codebase.rb` and fill it with this info (changing it for your account, etc)

```ruby
CodebaseApi.account_user = "account/user"
CodebaseApi.api_key = "apikey"
```

## Commands

The CodebaseApi gem is built to access all the Codebase API functions.


### Projects
#### Displays a list of all projects on your Codebase account
```ruby
CodebaseApi::Project.all
```

#### Shows a specific project
```ruby
CodebaseApi::Project.view("my-cool-project")
```

#### Create a new project
```ruby
CodebaseApi::Project.create("a new project")
```


### Project Groups
#### Display a list of all project groups
```ruby
CodebaseApi::ProjectGroup.all
```


### Project Users
#### Display a list of all users assigned to a project
```ruby
CodebaseApi::ProjectUser.all("my-cool-project")
```

#### Assign users to a project (currently broken)
```ruby
CodebaseApi::ProjectUser.assign("my-cool-project", [ :users => {:user => {:id => 123}, {:user => {:id => 123} } ])
```


### Repositories
#### Display a list of all repositories for a project
```ruby
CodebaseApi::Repository.all("my-cool-project")
```

#### View a specified repository
```ruby
CodebaseApi::Repository.show("my-cool-project", "test-repo")
```

#### Create a repository for a project
The types of repository are Git (git), Subversion (svn), Mercurial (hg) and Bazaar (bzr).
```ruby
CodebaseApi::Repository.create("my-cool-project", "new-repo-name", "git")
```


### Commits
#### Show a list of commits for a specific ref (short or long)
```ruby
CodebaseApi::Commit.show("my-cool-project", "test-repo", "abc123abc")
```

#### Show a list of commits for a specific ref (short or long) for a path
```ruby
CodebaseApi::Commit.show_path("my-cool-project", "test-repo", "abc123abc", "spec/features/admin_spec.rb")
```


### Deployments
#### Create a deployment for a project & repository
```ruby
CodebaseApi::Deployment.create("my-cool-project", "test-repo", "branch", "revision", "environment", "servers")
```


### Hooks
#### Show the hooks for a project & repository
```ruby
CodebaseApi::Hook.all("my-cool-project", "test-repo")
```

#### Create a hook for a project & repository
By default the username and password are nil
```ruby
CodebaseApi::Hook.create("my-cool-project", "test-repo", "url", "username", "password")
```


### Tickets
#### Show all tickets for a project
```ruby
CodebaseApi::Ticket.all("my-cool-project")
```

#### Search all tickets in a project
```ruby
CodebaseApi::Ticket.search("my-cool-project", "query")
```

#### Create a new ticket for a project
```ruby
CodebaseApi::Ticket.create("my-cool-project", "ticket title", "ticket description")
```

#### Show all the notes for a ticket
```ruby
CodebaseApi::Ticket.show("my-cool-project", ticket_id)
```

#### Show a specific ticket note
```ruby
CodebaseApi::Ticket.show_note("my-cool-project", ticket_id, note_id)
```

#### Update a ticket
Unfortunately these are required otherwise it will set them to nil time_added, status_id, priority_id, category_id, assignee_id. To change the name of the ticket, change the summary.
```ruby
CodebaseApi::Ticket.update("my-cool-project", ticket_id, "content", time_added=nil, status_id=nil, priority_id=nil, category_id=nil, assignee_id=nil, summary=nil)
```

#### Show all ticket statuses for a project
```ruby
CodebaseApi::Ticket.statuses("my-cool-project")
```

#### Show all ticket priorities for a project
```ruby
CodebaseApi::Ticket.priorities("my-cool-project")
```

#### Show all ticket categories for a project
```ruby
CodebaseApi::Ticket.categories("my-cool-project")
```

#### Show all ticket milestones for a project
```ruby
CodebaseApi::Ticket.milestones("my-cool-project")
```

#### Show all watchers of a ticket for a project
```ruby
CodebaseApi::Ticket.watchers("my-cool-project", ticket_id)
```

### Wiki
#### Show all the pages in the wiki for a project
```ruby
CodebaseApi::Wiki.all("my-cool-project")
```

#### Show a specific page in the wiki for a project
```ruby
CodebaseApi::Wiki.show("my-cool-project", "page-name")
```


### Public Keys
#### Show all the public keys for a user
```ruby
CodebaseApi::PublicKey.all("username")
```

#### Show all the deployment keys for a project
```ruby
CodebaseApi::PublicKey.deploy_keys("my-cool-project")
```

#### Create a new public key for a user
```ruby
CodebaseApi::PublicKey.create("username", "description", "key")
```

#### Create a deployment key for a project
```ruby
CodebaseApi::PublicKey.create_deployment("project", "description", "key")
```


### Users
#### Show all users on your Codebase account
```ruby
CodebaseApi::User.all
```

#### Show all the user roles
```ruby
CodebaseApi::User.roles
```

#### Create a new user
```ruby
CodebaseApi::User.create("first name", "last name", "email address", role_id)
```


### Discussions
#### Show all the discussions for a project
```ruby
CodebaseApi::Discussion.all("my-cool-project")
```

#### Show all the categories for discussions in a project
```ruby
CodebaseApi::Discussion.categories("my-cool-project")
```

#### Show a specific discussion for a project
```ruby
CodebaseApi::Discussion.show("my-cool-project", "test-discussion")
```

#### Create a new discussion for a project
```ruby
CodebaseApi::Discussion.create("my-cool-project", "discussion title", "discussion content")
```

#### Update a discussion for a project
```ruby
CodebaseApi::Discussion.update("my-cool-project", "test-discussion", "discussion content")
```


### Time Sessions
#### Show all the time sessions for a project
```ruby
CodebaseApi::TimeSession.all("my-cool-project")
```

#### Show time sessions added today for a project
```ruby
CodebaseApi::TimeSession.today("my-cool-project")
```

#### Show time sessions added this week for a project
```ruby
CodebaseApi::TimeSession.this_week("my-cool-project")
```

#### Show time sessions added this month for a project
```ruby
CodebaseApi::TimeSession.this_month("my-cool-project")
```

#### Create a new time session for a project
```ruby
CodebaseApi::TimeSession.create("my-cool-project", "message", time)
```

#### Show an existing time session for a project
```ruby
CodebaseApi::TimeSession.show("my-cool-project", 123)
```

#### Update an existing time session for a project
```ruby
CodebaseApi::TimeSession.update("my-cool-project", 123, "message", time)
```

#### Delete a time session for a project
```ruby
CodebaseApi::TimeSession.delete("my-cool-project", 1234)
```







## Contributing

Fork this project, make any changes and create a pull request :)
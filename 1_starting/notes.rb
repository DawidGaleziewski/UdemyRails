#to start new app:
#type bash:
 #rails new <app_name>
 #bundle install, it is a gem that goes to rubygems.org and installs a sandox installing rails application
 #once this is finish we have a rails app


#MVC - model view conroller structure
#user - https get request -> router
# - > controller -> renders a view
#OR goes to model to change something/ gets response
#model <- update or gets info -> db

#app folder:
 #controllers folder
 #models folder
 #views folder
 
 #router is in config folder routes.rb file
 
 #app/assets folder - images, js used, stylesheets 
 #config- database.yml how to communicate with sql lite
 
#gemfile - stores info about default installed gems
#gemfile.lock - dependencies- important when commiting app to production


#to start rails app navigate to folder directory and type 
#rails server -b 0.0.0.0

#How to configure this on AWS:
https://medium.com/@obrientimothya/developing-ruby-on-rails-5-1-apps-with-the-aws-cloud9-ide-18826ae1426b

####2nd lesson
#go to routes.rb filer
#go to app dir enter:
 #rake routes - displays all routes
 #add this line inside routes.rb:
 get 'welcome/home', to: 'welcome#home'
#it creates a get action and rake routes will display now:
 welcome_home GET  /welcome/home(.:format) welcome#home

#GET is a http verb
#it is directed to welcome controler
# home is the name of the action
#now error will change as we have a route but not the controller 
#to create a new controller go to controllers and create:
#welcome_controller.rb
#create a new class:
class WelcomeController < ApplicationController
  
end

#now error states that action could not be found
#we add the class method:
  def home
    
  end
#now its missing template
#create new folder "welcome" inside views
#we have a welcome controller, so we need a welcome view

#now we need action, that is html file inside welcome
  #welcome\home.html.erb
  
# to do: same for about page
#1 about action in welcome controler
welcome/about_controller.rb

#actually you just have to create about method in WelcomeController class.

class WelcomeController < ApplicationController
  def about 
    
  end
end

#2 template in views
views/welcome/about.html.erb
#3 route > routes.rb create a get route:
get 'welcome/about', to: 'welcome#about'


#use embeded ruby to link those pages together
# we do this by paths so this will be routes + _path
#i.e: welcome_home_path
#in home page w add:
<% link_to 'About', welcome_about_path %>
# this is ruby code inside html: <%%>
#link_to in order to link the page
#still it is not displayed, in order to display this we need to add = sign
<%= link_to 'About', welcome_about_path %>
#<% is ruby code, but if we want to display it we need <%=

#homework:
#1) Create new rails app and call it alpha-blog
#2) Ensure you can run server and preview the app
#3) create Pages_controller
#4) make sure you have correct routes
#5) create a hompage, about page
#6) use existing html

#step by step
#1) rails new <app>
#2) run ->rmb -> new run config
#3) name alphablog 
#4) command: rails s -b 0.0.0.0
#5) CWD selec alpha blog
#6) preview - > preview running application

#7) config/routes.rb:
get 'pages/home', to: 'pages#home'
get 'pages/about', to: 'pages#about'

#8) app/controllers
pages_controller.rb
class PagesController < ApplicationController
  
  def home 
    
  end
  
  def about
    
  end 

end

#9) go to:
https://f03a2edeacf84f21be43a62a805db4d6.vfs.cloud9.us-east-2.amazonaws.com/pages/home


#adding href in rb:
<%= link_to 'KONTAKT', pages_kontakt_path %> 
# <%%> is irb code
# link_to is a command
#'' this is displayed name of the link
# actual link is a route that can be checked by rake routes
  #<route name>_path
  
  
###Next lesson: routes, git version controll
# to define root simply do:
root 'pages#home'

#now we can just use this link:
https://f03a2edeacf84f21be43a62a805db4d6.vfs.cloud9.us-east-2.amazonaws.com/

#however root folder has changed! so we need to change other links:
get 'pages/kontakt', to: 'pages#kontakt'
get 'kontakt', to: 'pages#kontakt'

#however now we also have to change all referances in the app!
<li><%= link_to 'KONTAKT', pages_kontakt_path %> </li> 
<li><%= link_to 'KONTAKT', kontakt_path %> </li>
#above will change, we will need to check rake routes once more

<li><%= link_to 'Homepage', root_path %></li>

###version control with git
#git is pre installed on AWS!

#check if git is installed:
git --version

#check usernames and emails associated with the git version on cloud9
git config --list

#configure new git account:
git config --global user.name "username" 
git config --global user.email "email@domain.com"

#check settings so far
git config --list

#create a repository
git init #it exists automatically on rails5 !

#start tracking files:
git add -A

#you can check this by:
git status

#we have to save our files by
git commit -m "Create rails app, inital commit" #-m stands for msg

#.gitignore - created hidden file - shows ignores paths

#now if something is broken we can:
git status - check what was broken

#to undo the changes
git checkout -f #this will restore broken folders


##connecting to github
#link cloud9 with github so that we don't need password
copy the ssh:
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDMxHMLYV0h3OsErPz1EL8VomM2BMhMriNZCrH/OKkKiyuCNOtRUT8AX+Aw1xFQlJUX8Yj5SXNbRue0drcZC3i1tdJSx8Bsd4AQPVpo/WGrcn/5QesMOwePeQr45pwJ1ULYOQQ43DmtVShLAabbh1itKxIbPMHeuzRJ5+q2BpZJ5vGLReIOQEa6urf74NGHPlLGwFRY4AhViueRv7T393kJVLuJFw3JH/84ZdkzvG+dIwMxx4c6lQee6PXfjtaIyGbPe1nb43mhDdHQEceLro6t/JozRPsqaTDWNIs3813eq3208goaL/scnpWLoicJ8OA5JeUoJ3+7VHb+YVgP5ztyxPGCG/z+0ohyJ4Da9MFKcxYDRSsw8AjQxLMxitrrU1dSXKPUJ5stWG+l5WH/HFebkboEayKfIbHfsWaGhIhEO3eeTV80QZZc/GH/b4CiU5EKnFy6nqk9AdeI5CoO44oys3BbHp0xfeXydRF63+0mAqP/zw2Ahv520HF4b/Hj9Ok1iZ2OrITFuTWA7yt3ERqbXsr0RojYEP6BUkG/KFszuYLu5XZO+9w+X/lF67030pXd7mcQxD2vjER3GyhI7kNStqZx+hVS4CnWmeYs398IFXtsDWdmPFrVwPeT7/5joNoXsFBAG6peHNEO8K+Wi0ahQiwNu39z7lBesxTijVXj9Q== f03a2edeacf84f21be43a62a805db4d6@cloud9.amazon.com

#go to github accoun and in account settings go to ssh key settings
# get the ssh for the repo on git:
git@github.com:DawidGaleziewski/AWSUdemyRuby.git

#add origin to the repo: #that is repo online connected to the repo!!
git remote add origin git@github.com:DawidGaleziewski/AWSUdemyRuby.git

#check if this was added correctly by:
git remote -v

#push to github!:
git push -u origin master

#after every change we have to
git add -A #to add all files
git commit -m 'changed reademe file'
git push #to push to online repo

##deploy to production: heroku!
#go to Gemfile folder
#heroku does not support sqllite it support Postgresql
#move: 
gem 'sqlite3'
#to:
group :test do
  
#add this line to add postgre:
group :production do 
  gem 'pg'
  gem 'rails_12factor'
end

#this updates Gems.lock file and this will be used by heroku
bundle install --without production #to install gemfile.lock

#install heroku:
npm install -g heroku
#check version:
heroku --version

##!!if there is a issue with heroku version on AWS update:
nvm install 8.3
nvm use 8.3
npm install -g heroku-cli
npm i -g cli-engine-config
npm i -g cli-engine-command
heroku --version

#to login:
heroku login

#create new heroku app:
heroku create #!!make sure you are in app folder dir!

#ssh hey upload for heroku:
heroku keys:add

#push app to heroku:
git push heroku master

#created link for app:
https://intense-river-54254.herokuapp.com/

#rename app:
heroku rename alpha-blog-dawid

####persistance - model and db
#id autogenerated
#title - each article will have a title
#description
#user id- who created 

##we want to:
#create article
#read article
#update article
#delete article
#CRUD

#active record patttern- to communicate by rails to db
#ruby code translates to sql!
#this is done by model

#create CRUD
#inside rails app dir:
rails generate scaffold Article title:string description:text
  #creates migertion db file
  #creates article model
  #created tests
  #added controller
  #added routes

#now we need to run migretion file to create a table
rake db:migrate #in older rails
rails db:migrate #in rails 5
#this created db/schema.rb file

#in app controllers creates a controller file
#created models in model folder

#in routes
resources :articles #this added many routes to the app

#when checking app online we can now add articles!:
/articles/new


##!Models migrations and rails console
#builing basic sql table
#naming is very important!

#model name Article #uppercase singular
#table name articles #lowercase singular
#model name filename article.rb # lowercase singular
#controller articles_controller.rb #lowercase plural, snake case

#same for user:

#model name: user
#table name: users
#model name filename: user.rb
#controller: users_controllers.rb

##building a table:
#generate a migration:
rails generate migration create_articles
#is is created in db/migrate folder

#migrate file:
class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      #create type string, with column title
      t.string :title
    end
  end
end

#to run migration use:
rails db:migrate

#if we forgot something
rails db:rollback #drops the table

#best way however is to create a new migration file
rails generate add_description_to_articles
#this creates new migrate file
#this creates new file we can use to update the schema 
class AddDescriptionToArticles < ActiveRecord::Migration[5.2]
  def change
    #method, table name, column name (attribute name), type
    add_column :articles, :description, :text
    
    #maintained by rails!
    #names have to be created_at and updated_at!
    #method, table, created at, type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end

#rails will run only newest migration, once its run it won't run it again
#run again:
rails db:migrate

#we have the table, we need to communicate with it now
#create new article.rb file:
class Article < ApplicationRecord
  
  
end
#rails provides getters and setters just as we have empty class!


#testing the db and the model:
rails console #test db methods and connections
Article.all #check connection
Article #check all attributes in db
#we can play now with the objects:
article = Articles.new
article.title = "My first article" #we can change the attribute
article.save #creates a sql query that handles this transaction
#now we can check this table in the db:
Article.all
#mass assigment:
article2 = Article.new(title = "example title",
description = "example description")

#another setter method - it saves it automatically.
Article.create(title: "test title", description: "test description")
#exit to quit rails console


###edit delete and validations
#console
rails console
#check articles
Article.all

#edit articles - grab one article, takes id as argument
article = Article.find(2)
article.title = "I am edditing article title"
article.save

#delete article
article = Article.find(3)
atricle .destroy

#one problem is that we can create a empty article:
article = Article.new 
article.save

##adding validations to the model:
article.rb
class Article < ApplicationRecord
  #enforces: object needs to have title
  validates :title, presence: true
  
end
#we need to restart rails console! otherwise this won't take effect
reload!

#now it shows rollback!

#we can check what went wrong by ussing those methods
article.errors.any?
article.errors
article.errors.full_messages

#another validation we can do is for the length:
class Article < ApplicationRecord
  #enforces: object needs to have title
  #adding length validation
  validates :title, presence: true, length: {minimum:3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end

##!create new articles from UI

#how this works:
#0 instance variable is initiated:
@article = Article.new
#1. The form - acting as a input
@article = Article.new(title= "title that user inputs", description = "description that user inputs")
#2. Once user submits this object goes to controller
 #it is handled by create action here. Those are WHITELISTED/ validated.
 #this is called strong paramrthers and it started in rails 4.
#3 saves to db
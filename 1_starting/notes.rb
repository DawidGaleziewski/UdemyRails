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
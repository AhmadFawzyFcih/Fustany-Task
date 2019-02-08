# Fustany Task
1-This is a simple application through it you can create your account and login to :
   - create products and browse the home page to see other products.
   - you can add/remove products to/from your favorite list.
   - you can display your favorite list product
   - you can filter your home page by categories
   - you can add new categories. 
 
2-Here are the installation steps to run the project :
  - download the project
  - create my mysql database
  - access your project : cd "your project name"
  - run this command to install your gems : bundle install
  - run the database migrations : rails db:migrate
  - run database seed file to intialize database with some default data : rails db:seed 
  - run project with this command : rails s
  - you can login with email : user1@gmail.com and password : 123456
  
3-To add new product or category or add product to your favorite list through apis :
  - add new category : http://localhost:3000/api/v1/categories
  - add new product  : http://localhost:3000/api/v1/products
  - add product to favorite list : http://localhost:3000/api/v1/products/favorite
  
4-I have finished the task with bonus points except this two point : 
   - Adding your Testing code.
   - Deploy it to Heroku so that we can test the solution online.
 
# Fustany-Task

# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

Student has many Categories  =>             <- Categories
                                <-categories->
Student has many Teachers    => <-categories-> <= Teacher has many students

Student has:
    name:
    categories:
    professor:
Teacher has:
    name:
    categories:
    student:
professor has:
    name:
    student_id:
    professor_id:
    grade:
    lesson:

    Agile User Story
     Student
        a Student can set a name
        a Student can view its grade
        a Student can organized the DashBoard
        a Student can view its schedule
        a Student can email a professor
        a Student can login from annonymous
        a Student can logout
        a Student loggedin can change password
        a Student can register for an account as annonymous
        a Student can reset his account password as annonymous
        a student can upload a picture
    
    Professor
        a Professor can login from annonymous
        a Professor can logout
        a Prfessor loggedin:
        a professor loggedin can change password
        a Professor can view It's student's from the DashBoard
        a professor can assign grades to each student 
        a professor can drop the student from the curriculum
        a professor can email the student
        a professor can signup from annonymous 
        a professor can reset its account password from annonymous
        a professor can upload a picture

    Admin
        an Admin can login from annonymous
        an Admin can logout
        as Admin login:
        as Admin login can change password
        an Admin can assign a subject to a professor
        an Admin can assign students to a professor
        an Admin can delete students & professors account 
        an Admin can edit the Dashboard
        an Admin can upload a picture
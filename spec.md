# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
	 # in the Gem ruby '2.4.4' and gem 'rails', '~> 5.2.2' 
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes) 
	 # user has_many post
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
	# post_belongs_to user
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
	# 
- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
 	#
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
	# validates email and password length
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	# defaut_scope {post: :desc}
- [x] Include signup (how e.g. Devise)
	# custom made
- [x] Include login (how e.g. Devise)
	# custom made
- [x] Include logout (how e.g. Devise)
	# custom made
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
	# login through githubj
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	# user /admin
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
	# users/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
	# javascript embed and at the model level
Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use helper methods if appropriate


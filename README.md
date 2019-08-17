# Food Store

Heroku deployment: https://afternoon-garden-33195.herokuapp.com/

#### Epicodus Ruby and Rails - Rails with Active Record - 2019.08.09

#### By Ben Bennett-Cauchon

## Description

A website for (fictional) Mario's Speciality Food Products created using Ruby on Rails.

## Specifications

#### Database
The site should have functionality to review products so your database should include a one-to-many relationship between Products and Reviews. All products must have a name, cost and country_of_origin. All reviews should have an author, content_body and rating. (A rating can be a number between 1 and 5.) You can include other fields of your choosing as well.

#### Landing Page
The landing page should include basic information about the company and should allow users to easily navigate to other areas of the site. This page should also include the three most recently added products and the product with the most reviews. See more information in the Scopes section below.

#### Products
The site needs to include a products section with a list of the tasty products that Mario sells. Each product should be clickable with a detail view.

* Users should be able to add, update and delete new products. Don't worry about user authentication. Assume everyone who visits the site is an admin for now.
* Users should be able to click an individual product to see its detail page. (You will not be expected to show the product's average rating. That's included in the further exploration section.)
* Users should be able to add a review to a product.

#### Scopes
Your site should use scopes to display the following information on the site:

* The product with the most reviews.
* The three most recently added products.
* All products made in the USA for buyers that want to buy local products.

#### Validations
Your site should include validations for the following:

* All fields should be filled out, including rating.
* Rating can only be an integer between 1 and 5.
* The review's content_body must be between 50 and 250 characters.

#### Callbacks
Your site should include a callback for the following:
* All products are automatically titleized (first letter of each word capitalized) before they are saved to the database.

#### Seeding
* Your project should include seed data for 50 products and 250 reviews. Use Faker with a loop to seed the database.

#### Flash Messages
* The project should include flash success and error messages for creating products and reviews.

#### Overall Styling
You'll be demoing this site to the CEO of Mario's Specialty Foods, so it should look presentable.

## Setup

Created with Ruby version 2.5.1
* clone/download the repository
* navigate to the directory in a terminal
* run the commands
```
bundle install
rake db:create
rake db:migrate
rake db:seed
rails server
```
* open http://localhost:3000 in a web browser

## Support and contact details

If you find a bug, run into any issues, or have questions, ideas or concerns please feel free to submit an issue for the project here on GitHub.

## Technologies Used

* Ruby on Rails
* ActiveRecord
* RSpec
* Shoulda-Matchers
* Capybara
* Faker
* FactoryBot
* SimpleCov
* Devise
* Heroku

### License

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright (c) 2019 Benjamin Bennett-Cauchon

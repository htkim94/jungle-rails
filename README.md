# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Final Product
###### Main Page
!["Main Page"](https://github.com/htkim94/jungle-rails/blob/master/docs/main_page.jpg)
###### Cart Page
!["Cart Page"](https://github.com/htkim94/jungle-rails/blob/master/docs/cart_page.jpg)
###### Payment Pop-up
!["Payment Pop-up"](https://github.com/htkim94/jungle-rails/blob/master/docs/payment_pop_up.jpg)
###### Order Page
!["Order Page"](https://github.com/htkim94/jungle-rails/blob/master/docs/order_page.jpg)
###### Admin Products Page
!["Admin Product"](https://github.com/htkim94/jungle-rails/blob/master/docs/admin_products_page.jpg)
###### Admin Dashboard Page
!["Admin Dashboard"](https://github.com/htkim94/jungle-rails/blob/master/docs/admin_dashboard_page.jpg)
###### Register Page
!["Register Page"](https://github.com/htkim94/jungle-rails/blob/master/docs/register_page.jpg)
###### Login Page
!["Login Page"](https://github.com/htkim94/jungle-rails/blob/master/docs/login_page.jpg)

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

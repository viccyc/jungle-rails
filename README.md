# Jungle

A mini e-commerce application built with Ruby and Rails 4.2.  
Took an existing code base and made some major functionality enhancements.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

### Screenshots

!["Homepage and products"](https://github.com/viccyc/jungle-rails/blob/master/docs/Products.png)
!["Cart order items"](https://github.com/viccyc/jungle-rails/blob/master/docs/cart%20order%20items.png)
!["Email order confirmation"](https://github.com/viccyc/jungle-rails/blob/master/docs/email%20order%20conf.png)
!["Login auth pages"](https://github.com/viccyc/jungle-rails/blob/master/docs/Login%20auth.png)
!["Admin pages"](https://github.com/viccyc/jungle-rails/blob/master/docs/Admin.png)
!["Admin and sold out"](https://github.com/viccyc/jungle-rails/blob/master/docs/Admin%20sold%20out.png)

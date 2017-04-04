# Code Test

## Description

Imagine a shop that sells only three things - jeans, blouses, and socks. Each product has a corresponding product code and price:

<table>
  <tr><th>Product</th><th>Code</th><th>Price</th></tr>
  <tr><td>Jeans</td><td>J01</td><td>£32.95</td></tr>
  <tr><td>Blouse</td><td>B01</td><td>£24.95</td></tr>
  <tr><td>Socks</td><td>S01</td><td>£7.95</td></tr>
</table>

To try and incentivise customers to spend more, the delivery charges are staggered.

* For orders under £50 delivery costs £4.95
* For orders under £90, delivery costs £2.95
* Orders over £90 have free delivery

There's also a special offer of “buy one pair, get another pair half price” on jeans.


## Implementation

Implement the basket according to the above rules and with this interface:

* Initialise with product catalog, delivery charge rules, and offers
* Include an add method that takes the product code as a parameter
* Include a total method that returns the total cost of the basket including delivery and offers


## Setup

This requires Ruby 2.4.0 (rvm or rbenv is recommended) and a recent version of Bundler. If using rvm it should
automatically detect and use the correct version of Ruby. Then simply run `bundle` to install dependent gems.


## Running tests

Once gems are installed run `bundle exec rspec`. This will output test coverage information to the `coverage` folder (currently ~99%)


## Enhancements

* More complicated discount rules would likely need extra metadata to define the discount structure
* Add support for discounting combinations of products - currently only allows one product code per discount
* Handling of multiple discounts for the same product could be better - currently applies all matching discounts, it's
  more likely that products should only be eligible for one discount.

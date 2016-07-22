[![Build Status](https://travis-ci.org/tigretoncio/ecommerce-test.svg?branch=wip)](https://travis-ci.org/tigretoncio/ecommerce-test)[![Coverage Status](https://coveralls.io/repos/github/tigretoncio/ecommerce-test/badge.svg?branch=master)](https://coveralls.io/github/tigretoncio/ecommerce-test?branch=master)

# Solution

Author: Sergio Enrech Trillo

## Usage

Items are defined, instantiating new objects from the Item class, providing the product `code`, `name` and `price` of product.  Define as many items as you wish.

Then define promotions, instantiating new Promotion object, with promo `id`, `type`, (at the moment they are 2 main type provided, either discount over total bill, named "volume discount", or discounted promo price when buy multiple items of an item, named `"multiple_buy"), the minimum buy quantity for the promotion to apply (`quantity`), and the `promo_price`

After that, just instantiate a `PromotionRules` object which is the collection of the promotional rules added.

Finally, define a `Checkout` object, passing as parameters a new basket and the promo_rules object created before.

At that point the checkout object can scan items, and calculate a total, providing the value in a formatted string with the pound symbol at the beginning.

An IRB example:

<script src="https://gist.github.com/tigretoncio/695310fc4af62637192eb20390cd9f62.js"></script>


## Comment

This is a flexible approach, as multiple PromotionalRule objects can be coexisting, and therefore different items can have different promotional rules depending on location on any other variables.  Also, it allows to define many products to apply the "multiple discount" promotion, not just a single one.  The "volume discount" has been defined unique, but separated in methods and defined in the calculations class, so it can be easily amended to include other type of volume discount by ranges, (for e.g. price<60 no discount, 60<basket<100 10%, 100<basket<500 12% etc.)





## The Test
Our client is an online marketplace, here is a sample of some of the products available on our site:


| Product  code | Name                   | Price  |
|---------------|------------------------|--------|
| 001           | Lavenderheart          | £9.25  |
| 002           | Personalised cuff links| £45.00 |
| 003           | KidsT­shirt            | £19.95 |


Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the
price drops to £8.50.
Our check­out can scan items in any order, and because our promotions will change, it needs to be flexible
regarding our promotional rules.
The interface to our checkout looks like this (shown in Ruby):

```
co=Checkout.new​(promotional_rules)
co.scan​(item)
co.scan​(item)
price=co.total
```

Implement a checkout system that fulfills these requirements. Do this outside of any frameworks. We’re
looking for candidates to demonstrate their knowledge of TDD.

##Testdata

```
Basket:001,002,003
Totalpriceexpected:£66.78
```

```
Basket:001,003,001
Totalpriceexpected:£36.95
```

```
Basket:001,002,001,003
Totalpriceexpected:£73.76
```

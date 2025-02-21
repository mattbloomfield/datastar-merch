# Datastar Merch Shop

This demo site was made by me to explore the world of Datastar. It is a simple e-commerce site that allows users to view products, add them to their cart, and (potentially) check out.

## Exploration

This site uses Craft as a backend CMS (not commerce) to support the product data. The frontend, images, and text are all AI generated. 

## Installation

This site relies on ddev

```bash
ddev start
ddev composer install
ddev import-db --src storage/datastar-2025-02-20--23-07-59.sql
ddev craft users/create --admin
```

## Understanding the Code

The main Datastar features to look out for here are the search functionality and the cart functionality.

Starting in the `index.twig` file you'll see it's a relatively simple site. 

Look in the `_components/search-bar-nav-item.twig` and `_datastar/product-listing.twig` to get an idea of how the search functionality works.

The cart functionality is a bit more complex. Look in the `_components/cart-nav-item.twig` and `_datastar/update-cart.twig` to see how it works. 

The _datastar/update-cart.twig file is where the logic happens and then it loads `_components/cart-contents.twig` to display the cart.

The cart is also used on product pages, found in `_channels/products/product.twig`. 


*** Settings ***
Documentation    Locators for cart page

*** Variables ***
${CART_ICON}                 css:a[data-testid="nav-cart"]
${CHECKOUT_BUTTON}           xpath://button[contains(text(), 'Checkout') or contains(text(), 'checkout')]
${CART_ITEM_QUANTITY}        xpath://input[@type='number']

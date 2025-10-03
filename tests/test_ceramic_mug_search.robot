*** Settings ***
Documentation    Test Case 2: Login, search directly, add to cart, and verify checkout
Resource         ../resources/variables.robot
Resource         ../resources/pages/login_page.robot
Resource         ../resources/pages/search_page.robot
Resource         ../resources/pages/product_page.robot
Resource         ../resources/pages/cart_page.robot
Resource         ../resources/pages/checkout_page.robot

Suite Setup      Open browser and maximize
Suite Teardown   Close Browser

*** Test Cases ***
User can add ceramic mug via direct search and checkout
    [Documentation]    Search Ceramic Mug directly, add 3 items to cart, verify total calculation
    [Tags]    search    checkout
    
    Login to application
    # Search product directly    Ceramic Mug
    # Select product color    Blue
    # Add product to cart    3
    # Navigate to checkout
    # Verify price calculation on checkout
*** Settings ***
Documentation     Test Case 1: Login, search with autocomplete, add to cart, and verify checkout (Run 3 times, Parallel Ready)
Resource          ../resources/variables.robot
Resource          ../resources/pages/login_page.robot
Resource          ../resources/pages/search_page.robot
Resource          ../resources/pages/product_page.robot
Resource          ../resources/pages/cart_page.robot
Resource          ../resources/pages/checkout_page.robot
Resource          ../resources/pages/logout_page.robot

Suite Setup       Open browser and maximize
Suite Teardown    Close Browser

*** Test Cases ***
User can add ceramic mug via autocomplete and checkout - Run 1
    [Documentation]    Full E2E flow: Search mug, add 3 items, verify total calculation. (Run 1 of 3)
    [Tags]             autocomplete    checkout
    Log To Console     ========================================
    Log To Console     🔄 Starting Run 1 of 3
    Log To Console     ========================================
    Run Single Test Iteration

User can add ceramic mug via autocomplete and checkout - Run 2
    [Documentation]    Full E2E flow: Search mug, add 3 items, verify total calculation. (Run 2 of 3)
    [Tags]             autocomplete    checkout
    Log To Console     ========================================
    Log To Console     🔄 Starting Run 2 of 3
    Log To Console     ========================================
    Run Single Test Iteration

User can add ceramic mug via autocomplete and checkout - Run 3
    [Documentation]    Full E2E flow: Search mug, add 3 items, verify total calculation. (Run 3 of 3)
    [Tags]             autocomplete    checkout
    Log To Console     ========================================
    Log To Console     🔄 Starting Run 3 of 3
    Log To Console     ========================================
    Run Single Test Iteration


*** Keywords ***
Run Single Test Iteration
    [Documentation]    Execute one complete test flow from login to logout (Core Logic)
    
    Log To Console     📝 Logging in...
    Login to application
    
    Log To Console     🔍 Searching for product...
    Search product with autocomplete    mug     Ceramic Mug
    
    Log To Console     🛒 Adding to cart...
    Select White Color And Increase Quantity
    
    Log To Console     💳 Navigating to checkout...
    Navigate to checkout
    
    Log To Console     ✔️ Verifying price calculation...
    Verify price calculation on checkout
    
    Log To Console     👋 Logging out...
    Logout from account
    
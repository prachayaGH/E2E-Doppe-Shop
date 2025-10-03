*** Settings ***
Documentation    Test Case 1: Login, search with autocomplete, add to cart, and verify checkout (Run 3 times)
Resource         ../resources/variables.robot
Resource         ../resources/pages/login_page.robot
Resource         ../resources/pages/search_page.robot
Resource         ../resources/pages/product_page.robot
Resource         ../resources/pages/cart_page.robot
Resource         ../resources/pages/checkout_page.robot
Resource         ../resources/pages/logout_page.robot

Suite Setup      Open browser and maximize
Suite Teardown   Close Browser

*** Test Cases ***
User can add ceramic mug via autocomplete and checkout - Run 3 times
    [Documentation]    Search mug using autocomplete, add 3 items to cart, verify total calculation (Repeat 3 times)
    [Tags]    autocomplete    checkout    loop
    
    FOR    ${iteration}    IN RANGE    1    4
        Log To Console    ${\n}========================================
        Log To Console    🔄 Starting Iteration ${iteration} of 3
        Log To Console    ========================================
        
        Run Single Test Iteration    ${iteration}
        
        Log To Console    ✅ Iteration ${iteration} completed successfully
        Log To Console    ========================================${\n}
    END

*** Keywords ***
Run Single Test Iteration
    [Documentation]    Execute one complete test flow from login to logout
    [Arguments]    ${iteration_number}
    
    Log To Console    📝 Iteration ${iteration_number}: Logging in...
    Login to application
    
    Log To Console    🔍 Iteration ${iteration_number}: Searching for product...
    Search product with autocomplete    mug    Ceramic Mug
    
    Log To Console    🛒 Iteration ${iteration_number}: Adding to cart...
    Select White Color And Increase Quantity
    
    Log To Console    💳 Iteration ${iteration_number}: Navigating to checkout...
    Navigate to checkout
    
    Log To Console    ✔️ Iteration ${iteration_number}: Verifying price calculation...
    Verify price calculation on checkout
    
    Log To Console    👋 Iteration ${iteration_number}: Logging out...
    Logout from account
    
    # รอสักครู่ก่อนเริ่ม iteration ถัดไป (ยกเว้นครั้งสุดท้าย)
    Run Keyword If    ${iteration_number} < 3    Sleep    2s
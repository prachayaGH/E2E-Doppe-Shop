*** Settings ***
Documentation    Keywords for cart page
Resource         ../locators/cart_locators.robot
Resource         ../variables.robot

*** Keywords ***
Navigate to checkout
    [Documentation]    Navigate to cart and proceed to checkout
    Wait Until Element Is Visible    ${CART_ICON}    timeout=10s
    Click Element    ${CART_ICON}

    Wait Until Location Is    ${CART_URL}    timeout=15s
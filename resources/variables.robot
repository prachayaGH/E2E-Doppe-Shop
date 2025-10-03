*** Settings ***
Documentation    Common settings and keywords for all tests
Library          SeleniumLibrary
Library          String

*** Variables ***
${BASE URL}      https://training-platform2.doppio-tech.com/
${SIGNIN_URL}    https://training-platform2.doppio-tech.com/signin
${CART_URL}    https://training-platform2.doppio-tech.com/cart
${USERNAME}      test@gmail.com
${PASSWORD}      Test123456

# Browser setting
${BROWSER}        chrome
${IMPLICIT WAIT}  0.5s
${PAGE LOAD TIMEOUT}  15s

*** Keywords ***
Open browser and maximize
    [Documentation]    Open browser and navigate to application
    Open Browser    ${SIGNIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.3s
    Set Selenium Timeout    ${PAGE LOAD TIMEOUT}

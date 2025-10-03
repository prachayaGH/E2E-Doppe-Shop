*** Settings ***
Documentation    Common settings and keywords for all tests
Library          SeleniumLibrary
Library          String

*** Variables ***
${BASE URL}      https://training-platform2.doppio-tech.com/
${SIGNIN_URL}    https://training-platform2.doppio-tech.com/signin
${CART_URL}    https://training-platform2.doppio-tech.com/cart
${USERNAME}      prachaya.ksp@gmail.com
${PASSWORD}      August889900

# ความคลาดเคลื่อนในการเปรียบเทียบราคา (เช่น 0.01 = 1 cent)
# คาดว่าได้ 10.00 แต่จริงๆ ได้ 9.999999999 หรือ 10.0000001
# ถ้าไปตรวจสอบด้วย Should Be Equal แบบตรงๆ → test จะ fail
${PRICE TOLERANCE}    0.01

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

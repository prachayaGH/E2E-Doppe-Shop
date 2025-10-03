*** Settings ***
Documentation    Keywords for product page
Resource         ../locators/product_locators.robot
Resource         ../variables.robot

*** Keywords ***
Select White Color And Increase Quantity
    [Documentation]    Select White color option and click + button twice

    # 1.คลิกปุ่ม White
    Execute JavaScript    document.querySelector('${SHADOW_HOST}').shadowRoot.querySelector('${COLOR_WHITE_BTN}').click()

    # 2.กดปุ่ม + สองครั้ง
    Execute JavaScript    document.querySelector('${SHADOW_HOST}').shadowRoot.querySelector('${QTY_INC_BTN}').click()
    Execute JavaScript    document.querySelector('${SHADOW_HOST}').shadowRoot.querySelector('${QTY_INC_BTN}').click()

    # 3.ตรวจสอบว่า quantity = 3
    ${qty}=    Execute JavaScript    return document.querySelector('${SHADOW_HOST}').shadowRoot.querySelector('${QTY_INPUT}').value
    Log    Quantity after clicking + twice = ${qty}
    Should Be Equal As Strings    ${qty}    3

    # 4.คลิกปุ่ม Add to cart
    Execute JavaScript    document.querySelector('${SHADOW_HOST}').shadowRoot.querySelector('${ADD_TO_CART} ').click()

    Wait Until Element Contains    css=[data-testid^="notification-success-"]    Added to cart    timeout=10s
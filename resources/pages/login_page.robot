*** Settings ***
Documentation    Keywords for login page
Resource         ../locators/login_locators.robot
Resource         ../variables.robot

*** Keywords ***
Login to application
    [Documentation]    Login with username and password (handles shadow DOM)
    Wait Until Page Contains Element    css=${LOGIN_SHADOW_HOST}    timeout=15s
    ${host}=    Get WebElement    css=${LOGIN_SHADOW_HOST}

    # หา input email โดยตรงจาก shadow root
    ${email_input}=    Execute JavaScript    return arguments[0].shadowRoot.querySelector('${LOGIN_EMAIL_INPUT}')    ARGUMENTS    ${host}
    # กรอก email แล้ว trigger event
    Execute JavaScript    arguments[0].value = "${USERNAME}"; arguments[0].dispatchEvent(new Event('input', {bubbles:true}));    ARGUMENTS    ${email_input}

    # หา input password
    ${password_input}=    Execute JavaScript    return arguments[0].shadowRoot.querySelector('${LOGIN_PASSWORD_INPUT}')    ARGUMENTS    ${host}
    # กรอก password แล้ว trigger event
    Execute JavaScript    arguments[0].value = "${PASSWORD}"; arguments[0].dispatchEvent(new Event('input', {bubbles:true}));    ARGUMENTS    ${password_input}

    # หาและกดปุ่ม submit
    ${submit_button}=    Execute JavaScript    return arguments[0].shadowRoot.querySelector('${LOGIN_SUBMIT_BUTTON}')    ARGUMENTS    ${host}
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${submit_button}


    # รอจนเข้าสู่ระบบสำเร็จ
    Wait Until Location Is    ${BASE_URL}    timeout=15s
    Wait Until Element Contains    css=[data-testid^="notification-success-"]    Signed in successfully    timeout=10s
*** Settings ***
Resource         ../variables.robot
Resource         ../locators/login_locators.robot

*** Keywords ***
Logout from account
    [Documentation]    Click account button then logout
    # 1. กดปุ่ม account menu เพื่อเปิด dropdown
    Wait Until Element Is Visible    css=[data-testid="nav-account-button"]    timeout=10s
    Click Element    css=[data-testid="nav-account-button"]

    Wait Until Element Is Visible    css=[data-testid="nav-account-logout"]    timeout=10s

    # 2. กดปุ่ม Sign out
    Click Element    css=[data-testid="nav-account-logout"]
    Wait Until Page Contains Element    css=[data-testid="nav-login"]    timeout=5s

    # 4. รอให้ logout สำเร็จ - ปุ่ม login ต้องปรากฏ
    Sleep    2s
    Wait Until Element Is Visible    css=[data-testid="nav-login"]    timeout=20s

    # 5. Clear browser storage
    Delete All Cookies
    Execute JavaScript    window.localStorage.clear()
    Execute JavaScript    window.sessionStorage.clear()
    
    # 6. ไปหน้า signin
    Go To    ${SIGNIN_URL}
    Wait Until Page Contains Element    css=${LOGIN_SHADOW_HOST}    timeout=20s

    ${location}=    Get Location
    Should Contain    ${location}    signin

    Sleep    1s
    
    Log To Console    ✅ Logged out and ready for next iteration
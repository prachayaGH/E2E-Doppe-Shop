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
    Sleep    2s

    # 3. Clear browser storage
    Delete All Cookies
    Execute JavaScript    window.localStorage.clear()
    Execute JavaScript    window.sessionStorage.clear()

    
    # 4. รอให้ shadow host ปรากฏก่อน 
    Wait Until Page Contains Element    css=${LOGIN_SHADOW_HOST}    timeout=10s
    Sleep    2s
    
    
    # 5. ยืนยันว่าอยู่หน้า signin
    ${location}=    Get Location
    Should Contain    ${location}    signin

    Log To Console    ✅ Logged out and ready for next iteration
*** Settings ***
Documentation    Keywords for search functionality
Resource         ../locators/search_locators.robot
Resource         ../locators/product_locators.robot
Resource         ../variables.robot

*** Keywords ***
Search product with autocomplete
    [Arguments]    ${search_term}    ${product_name}

    # 1. พิมพ์ค้นหา
    Wait Until Element Is Visible    ${SEARCH_INPUT}    timeout=20s
    Click Element    ${SEARCH_INPUT}
    Clear Element Text    ${SEARCH_INPUT}
    Input Text    ${SEARCH_INPUT}    ${search_term}
    
    # 2. รอให้ dropdown แสดง
    Wait Until Element Is Visible    ${AUTOCOMPLETE_DROPDOWN}    timeout=10s
    
    # 3. รอให้ li ที่ต้องการโผล่มา
    Wait Until Page Contains Element    ${AUTOCOMPLETE_ITEM_LINK}    timeout=10s

    # 4. คลิก product (Ceramic Mug)
    Click Element    ${AUTOCOMPLETE_ITEM_LINK}
    
    # 5. Verify redirect
    Wait Until Location Contains    /products/11    timeout=10s
    ${title}=    Execute JavaScript    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot.querySelector('h1[data-testid="productdetail-title"]').innerText
    Should Contain    ${title}    ${product_name}

# Search product directly
#     [Documentation]    Search for product by typing and clicking search button
#     [Arguments]    ${product_name}
    
#     Wait Until Element Is Visible    ${SEARCH_INPUT}    timeout=10s
#     Input Text    ${SEARCH_INPUT}    ${product_name}
#     Click Button    ${SEARCH_BUTTON}

#     Sleep    3s

#     # เลื่อนหน้าจอไปที่ product section
#     Execute JavaScript    window.scrollTo(0, 500)
#     Sleep    1s

#     # ลอง Wait แบบ Page Contains Element ก่อน (ไม่ต้อง visible)
#     Wait Until Page Contains Element    css=[data-testid^="product-card-view-"]    timeout=15s
    

#     # เลื่อนไปที่ element
#     ${first_view_btn}=    Set Variable    css=[data-testid^="product-card-view-"]
#     Scroll Element Into View    ${first_view_btn}
#     Sleep    2s
    
#     # ลอง JavaScript Click แทน
#     Execute JavaScript    document.querySelector('[data-testid^="product-card-view-"]').click()


#     Log    Clicked first product View Details button

# Click Product View Details
#     [Documentation]    Click view details of specific product by ID
#     [Arguments]    ${product_id}
    
#     ${view_detail_locator}=    Replace String    ${PRODUCT_VIEWDETAIL}    {id}    ${product_id}
#     Wait Until Element Is Visible    ${view_detail_locator}    timeout=10s
#     Scroll Element Into View    ${view_detail_locator}
#     Sleep    1s
#     Click Element    ${view_detail_locator}
#     Log    Clicked View Details for product ${product_id}
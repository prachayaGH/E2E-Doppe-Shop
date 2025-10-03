*** Settings ***
Documentation    Keywords for checkout page
Resource         ../locators/checkout_locators.robot
Resource         ../variables.robot

*** Keywords ***
Verify price calculation on checkout
    [Documentation]    Check all checkboxes and verify that subtotal - discount + shipping + vat = total
    Sleep    3s
    # 1. กด Select All (checkbox อยู่ใน shadowRoot)
    ${checkbox}=    Execute Javascript
    ...    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot
    ...    .querySelector('input[type="checkbox"]');
    Click Element    ${checkbox}
    Sleep    1s

    # 2. ดึงค่าราคา (แก้ locator ให้ตรง DOM)
    ${subtotal_text}=    Execute Javascript
    ...    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot
    ...    .querySelector('section[aria-label="cart-section-0"] div:nth-of-type(1) span[aria-label="cart-span-1"]').innerText;

    ${shipping_text}=    Execute Javascript
    ...    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot
    ...    .querySelector('section[aria-label="cart-section-0"] div:nth-of-type(2) span[aria-label="cart-span-1"]').innerText;

    ${vat_text}=    Execute Javascript
    ...    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot
    ...    .querySelector('section[aria-label="cart-section-0"] div:nth-of-type(3) span[aria-label="cart-span-1"]').innerText;

    ${total_text}=    Execute Javascript
    ...    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot
    ...    .querySelector('section[aria-label="cart-section-0"] div:nth-of-type(4) span[aria-label="cart-span-1"]').innerText;

    # ถ้ามี Discount (optional)
    ${discount_present}=    Run Keyword And Return Status
    ...    Execute Javascript    return document.querySelector('div[data-testid="shadow-host"]').shadowRoot
    ...    .querySelector('section[aria-label="cart-section-0"] div[aria-label="cart-div-discount"] span[aria-label="cart-span-1"]')?.innerText;

    ${discount_text}=    Set Variable If    ${discount_present}    ${discount_present}    THB 0.00

    # 3. แปลงเป็นตัวเลข
    ${subtotal}=    Extract price from text    ${subtotal_text}
    ${shipping}=    Extract price from text    ${shipping_text}
    ${vat}=         Extract price from text    ${vat_text}
    ${total}=       Extract price from text    ${total_text}
    ${discount}=    Extract price from text    ${discount_text}

    # 4. คำนวณผลลัพธ์
    ${expected_total}=    Evaluate    ${subtotal} - ${discount} + ${shipping} + ${vat}

    Log To Console    Subtotal: ${subtotal}, Shipping: ${shipping}, VAT: ${vat}, Discount: ${discount}, Total: ${total}
    Log To Console    👉 Expected total = ${expected_total}

    # 5. ตรวจสอบ
    Should Be Equal As Numbers    ${total}    ${expected_total}
    ...    msg=❌ Total calculation incorrect. Expected: ${expected_total}, Got: ${total}


Extract price from text
    [Documentation]    Extract numeric price from text (handles THB, ฿, commas, nbsp, etc.)
    [Arguments]    ${text}

    # ถ้า text ไม่มีค่า หรือไม่ใช่ string → return 0
    IF    not "${text}"
        RETURN    0
    END

    # ตรวจว่าเป็นข้อความที่เกี่ยวกับราคา (เช่นมี THB หรือมีตัวเลข)
    ${is_price}=    Run Keyword And Return Status
    ...    Should Match Regexp    ${text}    (THB|฿|\\d)

    IF    not ${is_price}
        RETURN    0
    END

    # ล้างสัญลักษณ์/ตัวหนังสือที่ไม่ใช่ตัวเลข
    ${cleaned}=    Replace String    ${text}    THB    ${EMPTY}
    ${cleaned}=    Replace String    ${cleaned}    ฿      ${EMPTY}
    ${cleaned}=    Replace String    ${cleaned}    ,      ${EMPTY}
    ${cleaned}=    Replace String    ${cleaned}    &nbsp;    ${EMPTY}
    ${cleaned}=    Replace String    ${cleaned}    \u00a0    ${EMPTY}    # non-breaking space
    ${cleaned}=    Strip String      ${cleaned}

    # ถ้า text กลายเป็นว่าง → return 0
    IF    "${cleaned}" == ""
        RETURN    0
    END

    # แปลงเป็น float (รองรับทศนิยม)
    ${price}=    Convert To Number    ${cleaned}
    [Return]    ${price}


    
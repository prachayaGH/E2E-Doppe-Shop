*** Settings ***
Documentation    Locators for search functionality

*** Variables ***
# form ที่ครอบ input นี้ hidden อยู่ หรือ data-testid="nav-search-input" มีมากกว่า 1 ตัว
${SEARCH_INPUT}              css:input[data-testid="nav-search-input"]:not([type="hidden"])
${SEARCH_BUTTON}             css:button[data-testid="nav-search-submit"]
${AUTOCOMPLETE_DROPDOWN}     css:div#nav-search-suggest
${AUTOCOMPLETE_ITEM_LINK}    css:li[data-testid^="nav-search-item-"] a[href="/products/11"]
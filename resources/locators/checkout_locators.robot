*** Variables ***
# Shadow Host
${SHADOW_HOST}           css:div[data-testid="shadow-host"]

# Checkbox
${CHECKBOX}              input[type="checkbox"]

# Price rows inside cart-section-0
${SUBTOTAL_LOCATOR}      section[aria-label="cart-section-0"] div:nth-of-type(1) span[aria-label="cart-span-1"]
${SHIPPING_LOCATOR}      section[aria-label="cart-section-0"] div:nth-of-type(2) span[aria-label="cart-span-1"]
${VAT_LOCATOR}           section[aria-label="cart-section-0"] div:nth-of-type(3) span[aria-label="cart-span-1"]
${TOTAL_LOCATOR}         section[aria-label="cart-section-0"] div:nth-of-type(4) span[aria-label="cart-span-1"]

# Discount (optional)
${DISCOUNT_LOCATOR}      section[aria-label="cart-section-0"] div[aria-label="cart-div-discount"] span[aria-label="cart-span-1"]

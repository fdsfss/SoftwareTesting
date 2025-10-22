*** Settings ***
Library  SeleniumLibrary
Variables   ./locators.py
Variables   ./testData.py

*** Keywords ***

Sign up
    Open Browser    ${baseUrl}      Chrome
    wait until page contains element    ${signUpButton}    timeout=80      error=logInButtonNotFound
    Sleep   1s
    click element   ${signUpButton}
    wait until page contains element     ${signUpUsername}    timeout=80      error=logInButtonNotFound
    Sleep   1s
    Input Text    ${signUpUsername}    ${login}
    Sleep    2s
    Input Password    ${signUpPassword}    ${password}
    Sleep    2s
    Click Element    ${signUpFormButton}
    Sleep    3s
    
Log in
    Open Browser    ${baseUrl}      Chrome
    wait until page contains element    ${logInButton}    timeout=80      error=logInButtonNotFound
    Sleep   1s
    click element   ${logInButton}
    wait until page contains element     ${loginUsernameField}    timeout=80      error=logInButtonNotFound
    Sleep   1s
    input text      ${loginUsernameField}      ${login}
    Input Password    ${loginPasswordField}      ${password}
    Sleep    1s
    Click Element    ${logInFormButton}
    Sleep    2s

Close Browser
    Close All Browsers

Check If Browser Is Open
    ${status}=    Run Keyword And Return Status    Get Location
    Run Keyword If    '${status}' == 'True'    Log To Console    Browser is open

Log out
    wait until page contains element    ${logOutButton}    timeout=80      error=logOutButtonNotFound
    Sleep    1s
    click element    ${logOutButton}
    wait until page contains element    ${logInButton}    timeout=80      error=logOutButtonNotFound
    Sleep    2s

Add product to cart
    Wait Until Page Contains Element    ${categories}    timeout=80
    Click Element    ${categories}
    Sleep    2s
    Click Element    ${phonesButton}
    Sleep    2s
    Click Element    ${itemToBuy}
    Sleep    2s
    Click Element    ${addToCart}

Pay
    Wait Until Element Is Visible    ${cartButton}    timeout=80
    Click Element    ${cartButton}
    Wait Until Element Is Visible    ${placeOrderButton}    timeout=80
    Click Element    ${placeOrderButton}
    Sleep    2s
    Wait Until Element Is Visible    ${fullNameField}    timeout=80
    Input Text    ${fullNameField}    ${name}
    Input Text    ${countryField}    ${country}
    Input Text    ${cityField}    ${city}
    Input Text    ${creditCardField}    ${card}
    Input Text    ${monthField}    ${month}
    Input Text    ${yearField}    ${year}

    Wait Until Element Is Visible    ${purchaseButton}    timeout=80
    Click Element    ${purchaseButton}

    Wait Until Element Is Visible    ${newPurchaseButton}    timeout=80
    Sleep    2s
    Click Element    ${okButton}
    Sleep    5s
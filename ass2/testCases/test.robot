*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Browser


*** Variables ***

*** Keywords ***

*** Test Cases ***
SIGN UP
    Sign up
    Close Browser



LOGIN_TEST
    Log in
    Log out
    Close Browser

BUY PRODUCT TEST
    Log in
#    Check If Browser Is Open
    Add product to cart
    Pay
    Log out
    Close Browser
##
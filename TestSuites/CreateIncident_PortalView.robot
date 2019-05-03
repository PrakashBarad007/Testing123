*** Settings ***
Resource          ../Resource/GlobalVariables.robot
Library           Selenium2Library
Library           ../../../Documents/ScrollToElement.py
Library           ../../../Documents/xpaths.py

*** Test Cases ***
CreateIncident_PortalView
    Start Test2
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Order Something')]    10s
    Click Element    xpath=//h2[contains(text(),'Order Something')]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Browse by Categories')]    10s
    Click Element    xpath=//a[contains(text(),'Browse by Categories')]
    Wait Until Element Is Visible    xpath=//span[contains(@title,'Can We Help You?')]    10s
    Click Element    xpath=//span[contains(@title,'Can We Help You?')]
    Wait Until Element Is Visible    xpath=//span[contains(@title,'Can We Help You?')]    10s
    Wait Until Element Is Visible    xpath=//button[contains(text(),'Show More')]    10s
    Click Button    xpath=//button[contains(text(),'Show More')]
    Wait Until Element Is Visible    xpath=//h2[contains(@title,'Create Incident')]    10s
    Click Element    xpath=//h2[contains(@title,'Create Incident')]
    Wait Until Element Is Visible    xpath=//span[@id='select2-chosen-1']    10s
    Click Element    xpath=//span[@id='select2-chosen-1']
    Input Text    xpath=//input[@id='s2id_autogen1_search']    1 - High
    Press Key    xpath=//input[@id='s2id_autogen1_search']    \\13
    Input Text    xpath=//textarea[@id='sp_formfield_comments']    Automation - Testing
    Wait Until Element Is Visible    xpath=//button[contains(@id,'add_attachment_button')]    10s
    Choose File    xpath=//button[contains(@id,'add_attachment_button')]    C:\\Users\\Shadow22.txt
    Click Button    Submit

*** Keywords ***
Start Test2
    Open Browser    https://dev59107.service-now.com/sp    ${BROWSER}
    Maximize Browser Window
    Sleep    10s
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Welcome to the')]
    input text    id=username    ${ENDUSER_USERNAME}
    input text    id=password    ${ENDUSER_PASSWORD}
    Click Button    Login

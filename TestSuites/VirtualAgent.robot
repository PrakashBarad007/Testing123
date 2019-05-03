*** Settings ***
Resource          ../Resource/GlobalVariables.robot
Library           ../../../Documents/Shadow.py
Library           SeleniumLibrary
Library           ../../../Documents/Shadow12.py
Library           ../../../Documents/text.py

*** Test Cases ***
VirtualAgent
    Start Test
    Open Virtual Chat
    #Scenerio 1
    ${title}=    open_an_item
    #Scenerio 2
    Comment    ${title}=    open_it_ticket
    #Scenerio 3
    Comment    ${title}=    check_it_ticket_status
    Comment    ${title}=    check_it_ticket_status2
    Comment    ${title}=    text.Check It Ticket Status

VirtualAgnet_2

*** Keywords ***
Start Test
    SeleniumLibrary.Open Browser    https://dev59107.service-now.com/sp    ${BROWSER}
    SeleniumLibrary.Maximize Browser Window
    Sleep    20s
    Element Should Be Visible    xpath=//h1[contains(text(),'Welcome to the')]
    input text    id=username    ${ENDUSER_USERNAME}
    input text    id=password    ${ENDUSER_PASSWORD}
    Click Button    Login

Open Virtual Chat
    Sleep    10s
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'How can we help?')]    20s
    Wait Until Element Is Visible    xpath=//div[contains(@class,'conversation-button-container')]//button[@class='help-button']    20s
    Sleep    10s
    Mouse Over    xpath=(//div[@id='x3c5e072bdb432300427bd426ca96193e']//div[contains(@class,'conversation-button-container')]//button[contains(@class,'help-button')])
    Sleep    10s
    Click Button    xpath=(//div[@id='x3c5e072bdb432300427bd426ca96193e']//div[contains(@class,'conversation-button-container')]//button[contains(@class,'help-button')])
    Sleep    30s
    Select Frame    xpath=(//*[@class='chat-frame'])[2]

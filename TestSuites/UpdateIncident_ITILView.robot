*** Settings ***
Resource          ../Resource/GlobalVariables.robot
Library           Selenium2Library
Library           ../../../Documents/ScrollToElement.py

*** Test Cases ***
UpdateIncident_ITILView
    Start Test3
    ${INC}    Set Variable    INC0010019
    Wait Until Element Is Visible    xpath=//span[text()='Service Management']    10s
    Input Text    xpath=//input[@id='filter']    Service Desk
    Sleep    10s
    Click Element    xpath=//li[contains(@class,'sn-widget') and .//span[text()='Service Desk']]//div[contains(text(),'Incidents')]
    Select Frame    id=gsft_main
    Wait Until Element Is Visible    xpath=//div[contains(@class,'input-group')]//select    10s
    Select From List By Label    xpath=//div[contains(@class,'input-group')]//select    Number
    Input Text    xpath=//div[contains(@class,'input-group')]//input[@class='form-control']    ${INC}
    Press Key    xpath=//div[contains(@class,'input-group')]//input[@class='form-control']    \\13
    Click Link    ${INC}
    Sleep    5s
    Input Text    id=sys_display.incident.assignment_group    Big Data
    Press Key    id=sys_display.incident.assignment_group    \\13
    Sleep    5s
    Comment    Input Text    id=sys_display.incident.assigned_to    Big Data    #No DATA Available
    Comment    Press Key    id=sys_display.incident.assigned_to    \\13
    #WatchList
    Click Element    id=incident.watch_list_unlock
    Input Text    id=sys_display.incident.watch_list    Abraham Lincoln
    Press Key    id=sys_display.incident.watch_list    \\13
    Sleep    5s
    Input Text    id=sys_display.incident.watch_list    Alejandra Prenatt
    Press Key    id=sys_display.incident.watch_list    \\13
    Sleep    5s
    Input Text    id=sys_display.incident.watch_list    Adela Cervantsz
    Press Key    id=sys_display.incident.watch_list    \\13
    Click Element    id=incident.watch_list_lock
    Input Text    id=activity-stream-textarea    Work Notes
    Click Button    Post
    Click Element    xpath=//label[contains(text(),'Additional comments (Customer visible)')]
    Sleep    5s
    Input Text    id=activity-stream-textarea    additional comments
    Click Button    Post
    Sleep    5s
    Click Button    xpath=//button[.//span[contains(text(),'Filter Activity')]]
    ${Status}    Run Keyword And Return Status    Element Should Not Be Visible    xpath=//label[contains(text(),'All')]//preceding::input[@class='checkbox ng-valid ng-dirty ng-valid-parse ng-touched ng-empty']
    Run Keyword If    ${Status}    Click Element    xpath=//label[contains(text(),'All')]
    Sleep    15s
    Click Element    xpath=(//label[contains(@class,'checkbox-label ng-binding')][text()='Additional comments'])
    Sleep    10s
    Click Element    xpath=(//label[contains(text(),'Impact')])
    Click Button    Update

*** Keywords ***
Start Test3
    Open Browser    https://dev59107.service-now.com    ${BROWSER}
    Maximize Browser Window
    Sleep    10s
    Select Frame    id=gsft_main
    input text    id=user_name    ${ITIL_USERNAME}
    input text    id=user_password    ${ITIL_PASSWORD}
    Click Button    Login
    Unselect Frame

*** Settings ***
Documentation    Variables and Keywords Resourse
Library    SeleniumLibrary


*** Variables ***
${url}    https://web-demo.qahive.com/
${Browser}    Chrome
&{form_locator}    username=//input[@id='username']    firstname=//input[@name='firstname']    lastname=//input[contains(@class,'lastname')]    submit=//button[@type='submit']  


*** Keywords ***
Lanuch URL
    [Documentation]    Run Keyword for open url and Maximize it
    Open Browser    url=${url}    browser=${Browser}
    Maximize Browser Window
    Wait Until Page Contains    RPA Core Service App
    Title Should Be    title=RPA Core Service App

Delete Todo
    [Arguments]    ${arr}
    Click Button    locator=//div[../span = '${arr}']/button[contains(@data-testid,'Remove')]

Open Todo Page
    Click Link    locator=//a[text() = 'Todo']
    Wait Until Page Contains    text=Todo List    timeout=10s

Open Form Page
    Click Link    locator=//a[text() = 'Form']
    Wait Until Page Contains    text=Form Demo    timeout=5s

Input Text And Click Submit
    [Arguments]    ${locator_input}    ${text}    ${locator_submit} 
    Input Text    locator=${locator_input}   text=${text}
    Click Button    locator=${locator_submit} 

Input Text And Press Submit
    [Arguments]    ${locator_input}    ${text}
    Input Text    locator=${locator_input}   text=${text}
    Press Keys    NONE    ENTER

Done Todo    
    [Arguments]    ${arr}
    Click Button    locator=//div[../span = '${arr}']/button[contains(@data-testid,'Done')]
    ${text1}=    Get Element Attribute    locator=//span[text() = '${arr}']    attribute=style
    Should Be Equal    first=${text1}    second=text-decoration: line-through;

Input List Of Names And UserName
    [Arguments]    ${username}    ${firstname}    ${lastname}
    Input Text    locator=${form_locator.username}    text=${username}    clear=True
    Input Text    locator=${form_locator.firstname}    text=${firstname}    clear=True
    Input Text    locator=${form_locator.lastname}    text=${lastname}    clear=True
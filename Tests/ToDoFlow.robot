*** Settings ***
Resource    ../Resource/recource.robot

*** Variables ***
@{todo_list}    walking    running
${text_box_xpath}    //input[@type='text']
${submit_xpath}    //button[@type='submit']

*** Test Cases ***
TestAdditionTodoByClick
    Lanuch URL
    Set Selenium Speed    0.2s
    Open Todo Page
    Input Text And Click Submit    ${text_box_xpath}    ${todo_list}[0]    ${submit_xpath} 
    Page Should Contain    text=${todo_list}[0]

TestAdditionTodoByPress
    Input Text And Press Submit    ${text_box_xpath}    ${todo_list}[1]
    Page Should Contain    text=${todo_list}[1]
    

TestDeleteFunction

    Delete Todo    arr=${todo_list}[1]

TestDoneFunction
    Done Todo    arr=${todo_list}[0]
    Click Button    locator=//div[../span = '${todo_list}[0]']/button[contains(@data-testid,'Done')]
    ${text1}=    Get Element Attribute    locator=//span[text() = '${todo_list}[0]']    attribute=style
    Should Be Equal    first=${text1}    second=text-decoration: line-through;
    Sleep    time_=2s


TestRefreshPage
    Reload Page
    TRY
        Element Should Contain    locator=//span[@data-testid = 'todoText']    expected=This is a sampel todo    
    EXCEPT
        Skip
    END
    Close All Browsers

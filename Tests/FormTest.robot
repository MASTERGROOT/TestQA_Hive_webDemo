*** Settings ***
Resource    ../Resource/recource.robot
Library    ../Resource/checkDownload.py
Library    OperatingSystem
*** Variables ***
@{FirstName}    Alexis    Kip    Gabe
@{LastName}    Sporer    Maggio    Robel
@{UserName}    Alexis    Kip    Gabe
@{Sex}    Female    Male    Female
@{Country}    Philippines    Hongkong    Vietnam
*** Test Cases ***
TestInput
    LanuchURL
    Set Selenium Speed    value=0.1s
    Open Form Page
    ${len}    Get Length    item=@{FirstName}

    TRY
        Element Should Be Disabled     ${form_locator.submit}
        FOR    ${i}    IN RANGE    ${len}
            Input List Of Names And UserName    ${UserName}[${i}]    ${FirstName}[${i}]    ${LastName}[${i}]
            Select Radio Button    group_name=gender    value=${Sex}[${i}]
            Select From List By Label    //select    ${Country}[${i}]
            Select Checkbox    locator=//input[@type = 'checkbox']
            Element Should Be Enabled     ${form_locator.submit}
            Click Button    locator=${form_locator.submit}
            Element Should Be Visible    //div[contains(@class, 'alert-success')]
        END
    EXCEPT
        Skip
        Close Browser
    END
    Close All Browsers
    
# DownloadTest
#     LanuchURL
#     Set Selenium Speed    value=0.5s
#     Open Form Page
#     ${now}    Get Time    format=epoch
#     Log To Console    ${now} 
#     Click Element    //*[@id="root"]/main/div/div/form/div[7]/a
#     Sleep    30s
#     ${res}    checkDownload    ${now}
#     Log To Console    ${res}


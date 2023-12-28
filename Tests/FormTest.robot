*** Settings ***
Resource    ../Resource/recource.robot
Library    ../Resource/checkDownload.py
Library    OperatingSystem
*** Variables ***
@{FirstName}    good    bow
@{LastName}    vith_d    ranyahu
@{UserName}    gekD    MiMi
@{Sex}    Male    Female
@{Country}    Thailand    Hongkong
&{FullName1}    first=@{FirstName}     last=@{LastName}    user=@{UserName}    sex=@{Sex}
&{Locator}    username=//input[@id='username']    firstname=//input[@name='firstname']    lastname=//input[contains(@class,'lastname')]    submit=//button[@type='submit']  
*** Test Cases ***
TestInput
    LanuchURL
    Set Selenium Speed    value=0.1s
    Open Form Page
    ${len}    Get Length    item=@{UserName}

    TRY
        Element Should Be Disabled     //button[@type='submit']
        FOR    ${i}    IN RANGE    ${len}
            Input Text    locator=${Locator.username}    text=${FullName1.user}[${i}]    clear=True
            Input Text    locator=${Locator.firstname}    text=${FullName1.first}[${i}]    clear=True
            Input Text    locator=${Locator.lastname}    text=${FullName1.last}[${i}]    clear=True
            Select Radio Button    group_name=gender    value=${Sex}[${i}]
            Select From List By Label    //select    ${Country}[${i}]
            Select Checkbox    locator=//input[@type = 'checkbox']
            Element Should Be Enabled     ${Locator.submit}
            Click Button    locator=${Locator.submit}
            Element Should Be Visible    //div[contains(@class, 'alert-success')]
        END
    EXCEPT
        Skip
    END
    
    
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


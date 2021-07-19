*** Settings ***
Resource            base.robot

Test Setup          Nova sessão
Test Teardown       Encerrar sessão


*** Variables ***
${check_thor}       id:thor
${check_iron}       css:input[value='iron-man']
${check_panther}    xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com Id
    Go To                               ${url}/checkboxes
    Select Checkbox                     ${check_thor}
    Checkbox Should be Selected         ${check_thor} 

Marcando opção com CSS Selector
    Go To                               ${url}/checkboxes
    Select Checkbox                     ${check_iron}
    Checkbox Should be Selected         ${check_iron}

Marcando opção com Xpath
    [Tags]      ironman
    Go To                               ${url}/checkboxes
    Select Checkbox                     ${check_panther}
    Checkbox Should be Selected         ${check_panther} 
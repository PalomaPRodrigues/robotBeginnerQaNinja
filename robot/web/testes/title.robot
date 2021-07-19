*** Settings ***
Resource            base.robot

Test Setup          Nova sessão
Test Teardown       Encerrar sessão


*** Test Cases ***
Should see Page Title 
    Open Browser     http://training-wheels-protocol.herokuapp.com       chrome
    Title Should Be  Training Wheels Protocol 
    Close Browser 
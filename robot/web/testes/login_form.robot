*** Settings ***
Resource            base.robot

Test Setup          Nova sessão
Test Teardown       Encerrar sessão

*** Test Cases ***
Login com sucesso
    Go To                   ${url}/login
    Login With              stark   jarvis!
    Page Should Contain     Olá, Tony Stark. Você acessou a área logada!

Senha inválida 
    [tags]                          login_error
    Go To                           ${url}/login
    Login With                      stark       abc123
    Should Contain Login Alert      Senha é invalida! 

Usuário não existe
    [tags]                          login_user404 
    Go To                           ${url}/login
    Login With                      papito      123456
    Should Contain Login Alert      O usuário informado não está cadastrado! 

*** Keywords ***
Login With
    [Arguments]             ${uname}    ${pass}

    Input Text              css:input[name=username]      stark
    Input Text              css:input[name=password]      jarvis!
    sleep                   6
    Click Element           xpath://*[@type='submit']
    sleep                   6 

Should Contain Login Alert
    [Arguments]             ${expect_message}

    ${message}=             Get WebElement                 id:flash
    Should Contain          ${message.tex}                 ${expect_message} 

Should See Logged User
    [Arguments]             ${full_name}

    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!






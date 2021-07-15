
*** Settings***
Library       app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result} =      Welcome     Paloma
    Should Be Equal  ${result}   Olá Paloma, bem Vindo ao Curso básico de Robot Framework!

*** Settings ***
Library  SeleniumLibrary
Resource    ../global_resources/Resourceglobal.robot
*** Variables ***

${INPUT_EMAIL}                 id=email
${INPUT_SENHA}                 id=senha
${BTN_ENTRAR}                  css=.btn
${MSG_ERRO_LOGIN_SEM_EMAIL}    xpath = //div[.='Email é um campo obrigatório']
${MSG_ERRO_LOGIN_SEM_SENHA}    xpath = //div[.='Senha é um campo obrigatório']
${MSG_ERRO_LOGIN_INVÁLIDO}     xpath = //div[.='Problemas com o login do usuário']
${MSG_TELA_PRINCIPAL}          xpath = //span[.='Seu Barriga. Nunca mais esqueça de pagar o aluguel.reset']  

*** Keywords ***

Digitar o email cadastrado
    Input Text    ${INPUT_EMAIL}    jefferson@gmail.com
Digitar a senha cadastrada
    Input Text    ${INPUT_SENHA}    123456
Clicar no botão Entrar
    Click Button    ${BTN_ENTRAR}
Verificar se o sistema mostra mensagem de sucesso e direciona para tela principal.
    Page Should Contain Element    //div[@class='alert alert-success']
Digitar uma senha qualquer
    Input Text    ${INPUT_SENHA}    1234567
Sistema deve emitir mensagem de erro e não realiza o login: "${MSG_ERRO_LOGIN_SEM_EMAIL}"
    Page Should Contain Element    xpath = //div[.='Email é um campo obrigatório']
Sistema deve informar mensagem de erro e não realiza o login: "${MSG_ERRO_LOGIN_SEM_SENHA}"
    Page Should Contain Element    xpath = //div[.='Senha é um campo obrigatório']
Sistema deve mostrar uma mensagem de Problemas com o login do usuário
    Page Should Contain Element    ${MSG_ERRO_LOGIN_INVÁLIDO}
Digitar um email não cadastrado
    Input Text    ${INPUT_EMAIL}    mariana@gmail.com
Verificar mensagem na tela inicial do sistema
    Page Should Contain Element   ${MSG_TELA_PRINCIPAL}












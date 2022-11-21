*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL}              https://seubarriga.wcaquino.me
${BROWSER}               chrome
${MENSAGEM_ERRO}         //div[@class='alert alert-danger']

*** Keywords ***
Acessar a página do site
    Open Browser  url=${BASE_URL}  browser=${BROWSER}
    Set Selenium Speed    0.1
    Page Should Contain Element  css = .btn
Acessar a página de cadastro
    Open Browser  ${BASE_URL}/cadastro  browser=${BROWSER}
    Set Selenium Speed    0.1
    Page Should Contain Element    //input[@class='btn btn-primary']
Fechar o navegador
    Close Browser



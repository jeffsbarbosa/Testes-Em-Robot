*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}                https://robotizandotestes.blogspot.com/
${BROWSER}            chrome
${BTN_PESQUISAR}      css=button.search-expand.touch-icon-button
${INPUT_PESQUISAR}    name=q
${SUBMIT_PESQUISAR}   css=input.search-action.flat-button
${LINK_POST}          xpath=//a[contains(text(),'Season Premiere: Introdução ao Robot Framework')]

*** Keywords ***
Acessar a página do blog
    Open Browser  url=${URL}  browser=${BROWSER}
    Title Should Be    Robotizando Testes
Pesquisar por um post com "${TEXTO_PESQUISA}"
    Click Button    ${BTN_PESQUISAR}
    Input Text    ${INPUT_PESQUISAR}    ${TEXTO_PESQUISA}
    Click Element    ${SUBMIT_PESQUISAR}
Conferir mensagem de pesquisa por "${MENSAGEM_DESEJADA}"
    Page Should Contain    ${MENSAGEM_DESEJADA}
Fechar o navegador
    Close Browser

Acessar o post "${TEXTO_PESQUISA}"
    Pesquisar por um post com "${TEXTO_PESQUISA}"
    Click Element    ${LINK_POST}
    Wait Until Page Contains    O que é Robot Framework

Conferir se o texto "${TEXTO_DESEJADO}" 
    Page Should Contain    text=${TEXTO_DESEJADO}


  


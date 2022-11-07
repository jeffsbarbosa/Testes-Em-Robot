*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
Resource    ../global_resources/Resourceglobal.robot
*** Variables ***

${INPUT_NOME}              css=input#nome.form-control
${INPUT_EMAIL}             css=input#email.form-control
${INPUT_SENHA}             css=input#senha.form-control
${SUBMIT_CADASTRAR}        css=input.btn.btn-primary
${IR_PARA_LOGIN}           xpath = //a[.='Login']
${MENSAGEM_ERRO_CADASTRO}  xpath = //div[.='Endereço de email já utilizado']
${MENSAGEM_ERRO_NOME}      xpath = //div[.='Nome é um campo obrigatório']
${MENSAGEM_ERRO_EMAIL}     xpath = //div[.='Email é um campo obrigatório']
${MENSAGEM_ERRO_PASSWORD}  xpath = //div[.='Senha é um campo obrigatório']
 
*** Keywords ***

Inserir um novo usuário  
    ${nome}=    FakerLibrary.Name Male
    Log To Console    ${nome}
    Input Text    ${INPUT_NOME}      ${nome}
Inserir o email
    ${email}=   FakerLibrary.Email
    Input Text    ${INPUT_EMAIL}     ${email}
Inserir a senha
    Input Text    ${INPUT_SENHA}     1234567
Clicar no botão cadastrar
    Click Element    ${SUBMIT_CADASTRAR}    
Verificar mensagem de sucesso
    Page Should Contain Element    //div[@class='alert alert-success']
Verificar se após o sucesso do cadastro, sistema direciona para a tela de login.
    Page Should Contain Element    ${IR_PARA_LOGIN}
Inserir um usuário já cadastrado
    Input Text    ${INPUT_NOME}      Jefferson
Inserir um email já cadastrado
    Input Text    ${INPUT_EMAIL}     jefferson@gmail.com
Inserir a senha já cadastrada
    Input Text    ${INPUT_SENHA}     123456
Clicar em cadastrar
    Click Element  ${SUBMIT_CADASTRAR}
Verificar mensagem de erro Endereço de email já utilizado
    Page Should Contain Element  ${MENSAGEM_ERRO_CADASTRO}
Validar mensagem de erro informando ${MENSAGEM}
    Page Should Contain  ${MENSAGEM}


    
    
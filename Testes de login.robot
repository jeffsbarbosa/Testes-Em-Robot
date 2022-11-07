*** Settings ***
Resource  page_objects/page_login.robot
Test Setup  Acessar a página do site
Test Teardown  Fechar o navegador

*** Test Cases ***

Caso de Teste 01: Login com sucesso
    Digitar o email cadastrado
    Digitar a senha cadastrada
    Clicar no botão Entrar
    Verificar se o sistema mostra mensagem de sucesso e direciona para tela principal.
    Verificar mensagem na tela inicial do sistema
Caso de Teste 02: Login inserindo somente o campo senha
    Digitar uma senha qualquer
    Clicar no botão Entrar
    Sistema deve emitir mensagem de erro e não realiza o login: "${MSG_ERRO_LOGIN_SEM_EMAIL}"
Caso de Teste 03: Login inserindo somente o campo email
    Digitar o email cadastrado
    Clicar no botão Entrar
    Sistema deve informar mensagem de erro e não realiza o login: "${MSG_ERRO_LOGIN_SEM_SENHA}"
Caso de Teste 04: Login com usuário ou senha incorretos
    Digitar o email cadastrado
    Digitar uma senha qualquer
    Clicar no botão Entrar
    Sistema deve mostrar uma mensagem de Problemas com o login do usuário
Caso de Teste 05: Login com usuário inválido
    Digitar um email não cadastrado 
    Digitar uma senha qualquer
    Clicar no botão Entrar
    Sistema deve mostrar uma mensagem de Problemas com o login do usuário
    
    
    
    
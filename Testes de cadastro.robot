*** Settings ***
Resource    page_objects/page_cadastro.robot
Resource    page_objects/page_login.robot
Resource    global_resources/Resourceglobal.robot
Test Setup  Acessar a página de cadastro     
Test Teardown  Fechar o navegador

*** Test Cases ***
   
Caso de Teste 01: Criar um novo usuário com sucesso
    
    Inserir um novo usuário
    Inserir o email
    Inserir a senha
    Clicar no botão cadastrar
    Verificar mensagem de sucesso
    Verificar se após o sucesso do cadastro, sistema direciona para a tela de login.
    
Caso de Teste 02: Tentar criar um usuário já cadastrado
    
    Inserir um usuário já cadastrado
    Inserir um email já cadastrado
    Inserir a senha já cadastrada
    Clicar em cadastrar
    Verificar mensagem de erro Endereço de email já utilizado
    
Caso de Teste 03: Criar um usuário faltando o campo nome
    
    Digitar um email não cadastrado
    Digitar uma senha qualquer
    Clicar no botão cadastrar
    Validar mensagem de erro informando Nome é um campo obrigatório
    
Caso de Teste 04: Criar um usuário faltando o campo email
    
    Inserir um usuário já cadastrado
    Digitar uma senha qualquer
    Clicar no botão cadastrar
    Validar mensagem de erro informando Email é um campo obrigatório
    
Caso de Teste 05: Criar um usuário faltando o campo senha
    
    Inserir um usuário já cadastrado
    Inserir um email já cadastrado
    Clicar no botão cadastrar
    Validar mensagem de erro informando Senha é um campo obrigatório
    




    
        
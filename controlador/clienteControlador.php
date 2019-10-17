<?php
require_once "modelo/clienteModelo.php";

//recebe os dados via POST

function adicionar() {
if (ehPost()) {
$rg = (int)$_POST["rg"];
$nome = $_POST["nome"];

$mensagem = adicionarClientes($rg, $nome);
echo $mensagem;
}else{
       exibir("cliente/formulario");
   } 
}

function listar(){
    $dados = array();
    $dados["clientes"] = listarClientes();
    exibir('cliente/listar', $dados);
}

function deletar($id) {
    deletarCliente($id);
    redirecionar("cliente/listar");
}

function editar ($id){
    if(ehPost()){
    $rg = (int)$_POST["rg"];
    $nome = $_POST["nome"];
    $mensagem= EditarCliente($id,$rg, $nome);
    echo $mensagem;
    
     redirecionar("cliente/listar");
    }else{
        $dados["clientes"] = pegarClienteId($id);
        exibir('cliente/formulario', $dados);
        
    }
    
}
?>



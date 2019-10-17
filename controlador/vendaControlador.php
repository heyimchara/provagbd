<?php
require_once "modelo/vendaModelo.php";

//recebe os dados via POST

function adicionar() {
if (ehPost()) {
$idCliente =  $_POST["idCliente"];
$datavenda =  $_POST["datavenda"];


$mensagem = adicionarVendas($idCliente,$datavenda);
echo $mensagem;
}else{
       exibir("venda/formulario");
   } 
}

function listar(){
    $dados = array();
    $dados["vendas"] = listarVendas();
    exibir('venda/listar', $dados);
}

function deletar($id) {
    deletarVendas($id);
    redirecionar("venda/listar");
}

function editar ($id){
    if(ehPost()){
    $idCliente =  $_POST["idCliente"];   
    $datavenda = $_POST["datavenda"];
    $mensagem= EditarVenda($idCliente, $datavenda);
    echo $mensagem;
    
     redirecionar("venda/listar");
    }else{
        $dados["vendas"] = pegarVendasId($id);
        exibir('venda/formulario', $dados);
        
    }
    
}
?>



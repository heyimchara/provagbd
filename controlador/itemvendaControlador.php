<?php
require_once "modelo/itemvendaModelo.php";

//recebe os dados via POST

function adicionar() {
if (ehPost()) {
    $codvenda= $_POST["codvenda"];
    $codProduto= $_POST["codProduto"];
    $quantidade = $_POST["quantidade"];
$mensagem = adicionarItemVenda($codvenda,$codProduto,$quantidade);
echo $mensagem;
}else{
       exibir("itemvenda/formulario");
   } 
}

function listar(){
    $dados = array();
    $dados["itemvenda"] = listarItemVendas();
    exibir('itemvenda/listar', $dados);
}

function deletar($id) {
    deletarItemvenda($id);
    redirecionar("itemvenda/listar");
}

function editar ($id){
    if(ehPost()){
    $codvenda= $_POST["codvenda"];
    $codProduto= $_POST["codProduto"];
    $quantidade = $_POST["quantidade"];
    $mensagem= EditarItemvenda($id,$rg, $nome);
    echo $mensagem;
    
     redirecionar("itemvenda/listar");
    }else{
        $dados["itemvendas"] = pegarItemvendaId($id);
        exibir('itemvenda/formulario', $dados);
        
    }
    
}
?>



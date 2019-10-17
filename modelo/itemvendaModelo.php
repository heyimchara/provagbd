<?php

function adicionarClientes($codvenda, $codProduto, $quantidade) {
$sql = "call inserir_cliente('codvenda, $codProduto, $quantidade)";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar Item Venda' . mysqli_error($cnx)); }
    return 'Item Venda cadastrado com sucesso!';
}

function listarItemVendas(){
    $sql = "call select_cliente()";
    $result = mysqli_query(conn(), $sql);
    $itemvendas = array();
    while($linha = mysqli_fetch_assoc($result)){
        $itemvendas[] = $linha;
    }
    return $itemvendas;
}

function deletarItemvenda($id) {
 $sql = "call deletar_cliente($id)";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro' . mysqli_error($cnx)); }
    return 'Sucesso!';
}

function pegarItemvendaId($id){
 $sql = "call pegar_por_id_os_clientes($id)";
     $resultado = mysqli_query($cnx = conn(), $sql);
     $itemvendas = mysqli_fetch_assoc($resultado);
    return $itemvendas;
}

function EditarItemvenda($codvenda, $codProduto, $quantidade){
 $sql = "call editar_cliente('$codvenda, $codProduto, $quantidade')";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao editar Item Venda' . mysqli_error($cnx)); }
    return 'Item Venda atualizado com sucesso!';  
}

 ?> 
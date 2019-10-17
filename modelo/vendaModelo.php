<?php

function adicionarVendas($idCliente, $datavenda) {
$sql = "call inserir_venda('$idCliente', '$datavenda')";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar venda' . mysqli_error($cnx)); }
    return 'Venda com sucesso!';
}

function listarVendas(){
    $sql = "call select_vendas";
    $result = mysqli_query(conn(), $sql);
    $vendas = array();
    while($linha = mysqli_fetch_assoc($result)){
        $vendas[] = $linha;
    }
    return $vendas;
}

function deletarVendas($codvenda) {
 $sql = "call deletar_venda($codvenda)";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro' . mysqli_error($cnx)); }
    return 'Sucesso!';
}

function pegarVendasId($id){
 $sql = "call pegar_por_id_as_vendas($id)";
      $resultado = mysqli_query($cnx = conn(), $sql);
      $vendas = mysqli_fetch_assoc($resultado);
     return $vendas;
}


function EditarVenda($idCliente, $dataVenda){
 $sql = "call editar_venda($idCliente, $dataVenda)";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao editar venda' . mysqli_error($cnx)); }
    return 'Venda atualizado com sucesso!';  
}

 ?> 
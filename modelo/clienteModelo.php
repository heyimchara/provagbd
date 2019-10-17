<?php

function adicionarClientes($rg, $nome) {
$sql = "call inserir_cliente($rg, '$nome')";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao cadastrar cliente' . mysqli_error($cnx)); }
    return 'Cliente cadastrado com sucesso!';
}

function listarClientes(){
    $sql = "call select_cliente()";
    $result = mysqli_query(conn(), $sql);
    $clientes = array();
    while($linha = mysqli_fetch_assoc($result)){
        $clientes[] = $linha;
    }
    return $clientes;
}

function deletarCliente($idCliente) {
 $sql = "call deletar_cliente($idCliente)";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro' . mysqli_error($cnx)); }
    return 'Sucesso!';
}

function pegarClienteId($id){
 $sql = "call pegar_por_id_os_clientes($id)";

     $resultado = mysqli_query($cnx = conn(), $sql);
     $clientes = mysqli_fetch_assoc($resultado);
    return $clientes;
}


function EditarCliente($id,$rg, $nome){
 $sql = "call editar_cliente($id,$rg, '$nome')";
     $resultado = mysqli_query($cnx = conn(), $sql);
    if(!$resultado) { die('Erro ao editar cliente' . mysqli_error($cnx)); }
    return 'Cliente atualizado com sucesso!';  
}

 ?> 
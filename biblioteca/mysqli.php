<?php

function conn() {
    $cnx = mysqli_connect("localhost", "root", "", "gbd");
    if (!$cnx) die('Deu errado a conexao!');
    return $cnx;
}
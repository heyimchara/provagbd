<h2>SELECT CLIENTE</h2>

<table class="table">
    <thead>
        <tr>
            <th>RG</th>
            <th>NOME</th>
            <th>UPDATE</th>
            <th>DELETE</th>
        </tr>
    </thead>
    <?php foreach ($clientes as $cliente): ?>
    <tr>
        <td><?=$cliente['rg']?></td>
        <td><?=$cliente['nome']?></td>
        <td><a href="./cliente/editar/<?=$cliente['idCliente']?>">UPDATE</a></td>
        <td><a href="./cliente/deletar/<?=$cliente['idCliente']?>">DELETE</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<br><br>
<a href="./cliente/adicionar">Adicionar novo cliente</a>
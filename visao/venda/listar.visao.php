<h2>SELECT VENDAS</h2>

<table class="table">
    <thead>
        <tr>
            <th>DATA VENDA</th>
            <th>UPDATE</th>
            <th>DELETE</th>
        </tr>
    </thead>
    <?php foreach ($vendas as $venda): ?>
    <tr>
        <td><?=$venda['dataVenda']?></td>
        <td><a href="./venda/editar/<?=$venda['codvenda']?>">UPDATE</a></td>
        <td><a href="./venda/deletar/<?=$venda['codvenda']?>">DELETE</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<br><br>
<a href="./venda/adicionar">Adicionar nova venda</a>
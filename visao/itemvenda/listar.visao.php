<h2>SELECT ITEM VENDA</h2>

<table class="table">
    <thead>
        <tr>
            <th>COD.VENDA</th>
            <th>COD.PRODUTO</th>
            <th>QUANTIDADE</th>
            <th>UPDATE</th>
            <th>DELETE</th>
        </tr>
    </thead>
    <?php foreach ($itemvendas as $itemvenda): ?>
    <tr>
        <td><?=$itemvenda['codvenda']?></td>
        <td><?=$itemvenda['codProduto']?></td>
        <td><?=$itemvenda['quantidade']?></td>
        <td><a href="./itemvenda/editar/<?=$itemvenda['codvenda']?>">UPDATE</a></td>
        <td><a href="./itemvenda/deletar/<?=$itemvenda['codvenda']?>">DELETE</a></td>
    </tr>
    <?php endforeach; ?>
</table>

<br><br>
<a href="./itemvenda/adicionar">Adicionar novo item venda</a>


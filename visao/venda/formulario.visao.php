<form action="" method="POST">

<h3>Venda</h3>
Id Cliente: <input type="text" name="idCliente" value="<?=@$vendas['idCliente']?>" ><br><br>
Data Venda: <input type="date" name="datavenda" value="<?=@$vendas['datavenda']?>" ><br><br>
 <button>Vai</button>
 
</form>

<a href="./venda/listar">Listar Vendas</a>
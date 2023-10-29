--Questão 01
SELECT	cliente
FROM	cliente
WHERE	cliente LIKE 'J%';

--Questão 02
SELECT		cliente,
			pais
FROM		cliente
WHERE		pais = 'Mexico' OR pais = 'France'
ORDER BY	cliente ASC;

--Questão 03
SELECT		*
FROM		pedido
WHERE		vlrtotal_pedido IS NULL
ORDER BY	codpedido;

--Questão 04
SELECT	AVG(vlrtotal_pedido) AS Média
FROM	pedido
WHERE	dt_pedido > CONVERT(DATETIME, '1997-12-31', 102);

--Questão 05:
SELECT MIN(codpedido) AS Menor_Pedido
FROM pedido;

--Questão 06:
SELECT		codpedido,
			preco_unit,
			codproduto,
			qtde
FROM		pedido_detalhe
WHERE		qtde BETWEEN 100 AND 101
ORDER BY	codproduto ASC;	

--Questão 07:
SELECT	COUNT(*) AS Qtde_de_Produtos
FROM	produto
--WHERE	codcategoria=3 OR codcategoria=5;
WHERE	codcategoria IN (3, 5);

--Questão 08:
SELECT	cliente,
		cidade
FROM	cliente
WHERE	(cliente LIKE 'MAR%' AND cliente LIKE '%S')
OR		cidade = 'London';

--Questão 09:
SELECT	codcliente,
		codpedido,
		vlrtotal_pedido
FROM	pedido
WHERE	(dt_pedido > CONVERT(DATETIME, '1998-03-31', 102))
AND		(vlrtotal_pedido < 7.30 OR vlrtotal_pedido > 800);

--Questão 10:
-- Não é possível fazer o SELECT para esta questão, pois o codpedido e codproduto juntos fazem parte de uma Primary Key da tabela pedido_detalhe e não pode haver duplicidade de dados, pois eles identificam unicamente um campo.

--Questão 11:
SELECT		c.cliente,
			c.tel,
			p.dt_pedido,
			p.vlrtotal_pedido
FROM		cliente c INNER JOIN pedido p
			ON c.codcliente = p.codcliente
WHERE		(dt_pedido > CONVERT(DATETIME, '1996-03-31', 102)
AND			dt_pedido < CONVERT(DATETIME, '1996-03-31', 102))
OR			vlrtotal_pedido > 800;

--Questão 12:
SELECT		c.categoria AS Categoria,
				COUNT(p.produto) AS Total_de_Produtos
FROM		categoria c INNER JOIN produto p
			ON c.codcategoria = p.codcategoria
WHERE		p.preco_unit <= 100
GROUP BY	c.categoria;

--Questão 13:
SELECT		c.cliente AS Cliente,
				SUM(p.vlrtotal_pedido) AS Total
FROM		cliente c INNER JOIN pedido p
			ON c.codcliente = p.codcliente
WHERE		(p.dt_pedido > CONVERT(DATETIME, '1997-12-31', 102)
AND			p.dt_pedido < CONVERT(DATETIME, '1999-01-01', 102))
AND			c.regiao = 'SP'
GROUP BY	c.cliente;

--Questão 14:
SELECT		p.produto AS Produto,
			AVG(pd.qtde) AS Qtd_Média_Vendida
FROM		produto p INNER JOIN pedido_detalhe pd
			ON p.codproduto = pd.codproduto
WHERE		p.preco_unit = 120
OR			p.codcategoria = 5
GROUP BY	p.produto;

--Questão 15:
SELECT		p.codcliente,
			pd.codproduto,
			ROUND(sum(pd.preco_unit*pd.qtde-pd.desconto),2) AS Total 
FROM		pedido p INNER JOIN pedido_detalhe pd
			ON p.codpedido = pd.codpedido
WHERE		pd.qtde <= 3
AND			(p.dt_pedido BETWEEN  CONVERT(DATETIME,'1997-12-15', 102) AND  CONVERT(DATETIME,'1997-12-31',102))
GROUP BY	p.codcliente, pd.codproduto;

--Questão 16:
SELECT		c.pais AS País,
			c.cliente AS Cliente,
			COUNT(p.codpedido) AS Qtde_de_Pedidos
FROM		cliente c INNER JOIN pedido p
			ON c.codcliente = p.codcliente
WHERE		c.regiao IS NOT NULL OR c.pais IN ('Brazil', 'France')
GROUP BY	c.pais, c.cliente
ORDER BY	c.pais ASC;
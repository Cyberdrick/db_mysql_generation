DROP DATABASE db_pizzaria_legal;

CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT,
    vegetariana TINYINT,
    doce TINYINT,
    valor decimal(6, 2),
    PRIMARY KEY (id)
);

INSERT INTO tb_categorias (vegetariana, doce, valor)
VALUES (1, 0, 70.90);

INSERT INTO tb_categorias (vegetariana, doce, valor)
VALUES (1, 1, 80.90);

INSERT INTO tb_categorias (vegetariana, doce, valor)
VALUES (0, 1, 60.90);

INSERT INTO tb_categorias (vegetariana, doce, valor)
VALUES (0, 0, 40.00);

CREATE TABLE tb_pizzas(
	id bigint AUTO_INCREMENT,
    sabor VARCHAR(20),
    borda VARCHAR(20),
    tamanho INT,
    refrigerante TINYINT,
    categoria_id bigint,
    PRIMARY KEY (id),
	FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Margherita", "Catupiry", 30, 1, 3);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Portuguesa", "Não", 20, 1, 3);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Rúcula", "Não", 30, 1, 1);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Chocolate", "Não", 30, 0, 3);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Prestígio", "Leite Condensado", 20, 0, 3);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Frango & Catupiry", "Cheddar", 50, 1, 4);

INSERT INTO tb_pizzas(sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Calabresa", "Não", 50, 1, 4);

INSERT INTO tb_pizzas (sabor, borda, tamanho, refrigerante, categoria_id)
VALUES ("Sensação", "Não", 30, 0, 3);

SELECT * FROM tb_pizzas;

SELECT sabor, borda, tamanho, tb_categorias.vegetariana, tb_categorias.doce, tb_categorias.valor
FROM tb_pizzas
INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.valor > 45;

SELECT * FROM tb_pizzas WHERE sabor LIKE "%M%";

SELECT sabor, borda, tamanho, tb_categorias.vegetariana, tb_categorias.doce, tb_categorias.valor
FROM tb_pizzas
INNER JOIN tb_categorias 
ON tb_pizzas.categoria_id = tb_categorias.id
WHERE tb_categorias.valor BETWEEN 50.00 AND 100.00;
DROP DATABASE db_cidade_das_carnes;

CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
	id bigint AUTO_INCREMENT,
    tipo VARCHAR(40) not null,
    gordura VARCHAR(40) not null,
    PRIMARY KEY (id)
);

INSERT INTO tb_categorias (tipo, gordura)
VALUES ("Bovína", "Pouca Gordura");

INSERT INTO tb_categorias (tipo, gordura)
VALUES ("Suína", "Pouca Gordura");

INSERT INTO tb_categorias (tipo, gordura)
VALUES ("Bovína", "Muita Gordura");

INSERT INTO tb_categorias (tipo, gordura)
VALUES ("Suína", "Muita Gordura");

CREATE TABLE tb_produtos(
	id bigint AUTO_INCREMENT,
    parte VARCHAR(20) not null,
    peso decimal(6, 2) not null,
	outro_produto VARCHAR(20) not null,
    valor decimal(6, 2) not null,
    categoria_id bigint,
    PRIMARY KEY (id),
	FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Filé Mignon", 4.00, "Refrigerante", 180.00, 1);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Bisteca", 2.00, "Manteiga", 30.00, 2);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Picanha", 10.00, "Alho", 500.00, 1);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Lombo", 1.00, "Cerveja", 36.00, 4);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Patinho", 8.00, "Linguiça", 210.00, 2);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Costela", 5.00, "Suco", 125.00, 4);

INSERT INTO tb_produtos(parte, peso, outro_produto, valor, categoria_id)
VALUES ("Coxão Mole", 9.00, "Sal Grosso", 250.00, 3);

INSERT INTO tb_produtos (parte, peso, outro_produto, valor, categoria_id)
VALUES ("Panceta", 100.00, "Carvão", 2000.00, 4);

SELECT * FROM tb_produtos;

SELECT parte, peso, outro_produto, valor, tb_categorias.tipo, tb_categorias.gordura
FROM tb_produtos
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.valor > 50;

SELECT * FROM tb_produtos WHERE parte LIKE "%C%";

SELECT parte, peso, outro_produto, valor, tb_categorias.tipo, tb_categorias.gordura
FROM tb_produtos
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_produtos.valor BETWEEN 50.00 AND 150.00;

SELECT parte, peso, outro_produto, valor, tb_categorias.tipo, tb_categorias.gordura
FROM tb_produtos
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
WHERE tb_categorias.gordura LIKE "Pouca Gordura";
DROP DATABASE hops;
CREATE DATABASE IF NOT EXISTS hops;
USE hops;

CREATE TABLE estado (
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO estado (nome) VALUES ('São Paulo');

CREATE TABLE cidade (
	id INT NOT NULL AUTO_INCREMENT, 
    id_estado INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id),
    PRIMARY KEY (id)
);

INSERT INTO cidade (id_estado, nome) VALUES (1, 'São Paulo');

CREATE TABLE agencia (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_cidade INT NOT NULL,
    cep CHAR(8) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero_endereco INT NOT NULL,
    location POINT,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id),
    PRIMARY KEY (id)
);

INSERT INTO agencia (nome, id_cidade, cep, logradouro, numero_endereco, location)
VALUES ('IFSP', 1, '12345678', 'Main Street', 123, ST_GeomFromText('POINT(-23.523597569736406 -46.62227612249197)', 4326));

SELECT ST_DISTANCE_Sphere(
    ST_GeomFromText('POINT(-23.514209674140623 -46.616479312141294)', 4326),
    location
) AS distance
FROM agencia;

CREATE TABLE marca(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE cor(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE modelo(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ano YEAR NOT NULL,
	preco DECIMAL NOT NULL,
    id_marca INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_marca) REFERENCES marca(id)
);

CREATE TABLE carro(
	id INT NOT NULL AUTO_INCREMENT,
    id_cor INT NOT NULL,
    id_modelo INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    id_agencia INT NOT NULL,
    image_path VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (id_agencia) REFERENCES agencia(id),
    FOREIGN KEY (id_modelo) REFERENCES modelo(id),
	FOREIGN KEY (id_cor) REFERENCES cor(id)
);

CREATE TABLE usuario(
	id INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(255) NOT NULL,
    segundo_nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
	cnh CHAR(16),
    categoria_cnh VARCHAR(6),
    PRIMARY KEY (id)
);

CREATE TABLE entregador(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cpf CHAR(11) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
	cnh CHAR(16) NOT NULL,
    categoria_cnh VARCHAR(6) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE transporte(
	id INT NOT NULL AUTO_INCREMENT,
    id_entregador INT NOT NULL,
    cep CHAR(8) NOT NULL,
    id_cidade INT NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    logradouro VARCHAR(255) NOT NULL,
    numero_endereco INT NOT NULL,
    observacoes VARCHAR(255),
    FOREIGN KEY (id_entregador) REFERENCES entregador(id),
    FOREIGN KEY (id_cidade) REFERENCES cidade(id),
    PRIMARY KEY (id)
);

CREATE TABLE movimentacao_veiculo(
	id INT NOT NULL AUTO_INCREMENT,
    horario DATETIME NOT NULL,
    id_agencia INT NOT NULL,
    id_transporte INT,
    FOREIGN KEY (id_agencia) REFERENCES agencia(id),
    FOREIGN KEY (id_transporte) REFERENCES transporte(id),
    PRIMARY KEY (id)
);

CREATE TABLE locacao(
	id INT NOT NULL AUTO_INCREMENT,
    id_carro INT NOT NULL,
    id_usuario INT NOT NULL,
    id_check_in INT NOT NULL,
    id_check_out INT NOT NULL,
    devolvido BOOLEAN NOT NULL DEFAULT FALSE,
    FOREIGN KEY (id_carro) REFERENCES carro(id),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_check_in) REFERENCES movimentacao_veiculo(id),
    FOREIGN KEY (id_check_out) REFERENCES movimentacao_veiculo(id),
    PRIMARY KEY (id)
);
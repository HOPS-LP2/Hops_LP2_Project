DROP DATABASE hops;
CREATE DATABASE IF NOT EXISTS hops;
USE hops;

CREATE TABLE estado (
	id INT NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO estado (nome)
VALUES
('Acre'),
('Alagoas'),
('Amapá'),
('Amazonas'),
('Bahia'),
('Ceará'),
('Distrito Federal'),
('Espírito Santo'),
('Goiás'),
('Maranhão'),
('Mato Grosso'),
('Mato Grosso do Sul'),
('Minas Gerais'),
('Pará'),
('Paraíba'),
('Paraná'),
('Pernambuco'),
('Piauí'),
('Rio de Janeiro'),
('Rio Grande do Norte'),
('Rio Grande do Sul'),
('Rondônia'),
('Roraima'),
('Santa Catarina'),
('São Paulo'),
('Sergipe'),
('Tocantins');

CREATE TABLE cidade (
	id INT NOT NULL AUTO_INCREMENT, 
    id_estado INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_estado) REFERENCES estado(id),
    PRIMARY KEY (id)
);

INSERT INTO cidade (id_estado, nome)
VALUES
(1, 'Rio Branco'),
(2, 'Maceió'),
(3, 'Macapá'),
(4, 'Manaus'),
(5, 'Salvador'),
(6, 'Fortaleza'),
(7, 'Brasília'),
(8, 'Vitória'),
(9, 'Goiânia'),
(10, 'São Luís'),
(11, 'Cuiabá'),
(12, 'Campo Grande'),
(13, 'Belo Horizonte'),
(14, 'Belém'),
(15, 'João Pessoa'),
(16, 'Curitiba'),
(17, 'Recife'),
(18, 'Teresina'),
(19, 'Rio de Janeiro'),
(20, 'Natal'),
(21, 'Porto Alegre'),
(22, 'Porto Velho'),
(23, 'Boa Vista'),
(24, 'Florianópolis'),
(25, 'São Paulo'),
(26, 'Aracaju'),
(27, 'Palmas');

CREATE TABLE agencia (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    id_cidade INT NOT NULL,
    cep CHAR(8) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    location POINT,
    FOREIGN KEY (id_cidade) REFERENCES cidade(id),
    PRIMARY KEY (id)
);

INSERT INTO agencia (nome, id_cidade, cep, endereco, location)
VALUES
('Agência Tancredo Neves', 4, '69087055 ', 'Rua das Esmeraldas, 84', ST_GeomFromText('POINT(-3.0508852209390773 -59.93409440469008)', 4326)),
('Agência Vila Laura', 5, '40270180 ', 'Rua Raul Leite, 133', ST_GeomFromText('POINT(-12.972078221715684 -38.486957451567065)', 4326)),
('Agência Santa Teresa', 5, '40260215 ', 'Rua Baixão, 465', ST_GeomFromText('POINT(-12.971981161925973 -38.481105105786746)', 4326)),
('Agência St. Coimbra', 9, '74530015 ', 'Av. Castelo Branco, 2065', ST_GeomFromText('POINT(-16.677539939148048 -49.28663829710026)', 4326)),
('Agência Setor Negrão de Lima', 9, '74653230 ', 'Av. Ver. José Monteiro, 1655', ST_GeomFromText('POINT(-16.654722900305444 -49.24716696113827)', 4326)),
('Agência St. Morada do Sol', 9, '74473806 ', 'Rua Aurora, QD 216', ST_GeomFromText('POINT(-16.61082927798199 -49.31910348250643)', 4326)),
('Agência Marambaia', 14, '66620040 ', 'Rua Oriximina, 115', ST_GeomFromText('POINT(-1.3960279324202698 -48.46055325568506)', 4326)),
('Agência Bela Vista', 25, '01323130 ', 'Rua Maestro Cardim, 1041', ST_GeomFromText('POINT(-23.569966359554698 -46.64193041893966)', 4326)),
('Agência Morumbi', 25, '05724002 ', 'Av. Morumbi, 6340', ST_GeomFromText('POINT(-23.617248463115267 -46.70840007087052)', 4326)),
('Agência Itaquera', 25, '08260030 ', 'Rua Agrimensor Sugaya, 986', ST_GeomFromText('POINT(-23.559519072232973 -46.43548365693204)', 4326));

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

INSERT INTO marca (nome)
VALUES
('Ford'),
('Chevrolet'),
('Toyota'),
('Honda'),
('Volkswagen'),
('BMW'),
('Mercedes-Benz'),
('Hyundai'),
('Audi'),
('Nissan'),
('Fiat'),
('Kia'),
('Volvo'),
('Subaru'),
('Jeep'),
('Tesla'),
('Mazda'),
('Peugeot'),
('Jaguar'),
('Land Rover');

CREATE TABLE cor(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO cor (nome)
VALUES
('Azul'),
('Vermelho'),
('Preto'),
('Prata'),
('Branco'),
('Cinza'),
('Amarelo'),
('Verde'),
('Azul Marinho'),
('Vermelho Metálico'),
('Dourado'),
('Rosa'),
('Roxo'),
('Marrom'),
('Laranja'),
('Cinza Escuro'),
('Prata Metálico'),
('Cinza Claro'),
('Azul Celeste'),
('Branco Fosco');

CREATE TABLE modelo(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    ano YEAR NOT NULL,
	preco DECIMAL NOT NULL,
    id_marca INT NOT NULL,
	PRIMARY KEY (id),
    FOREIGN KEY (id_marca) REFERENCES marca(id)
);

INSERT INTO modelo (nome, ano, preco, id_marca)
VALUES
('Fiesta', '2020', 80.00, 1),
('Cruze', '2021', 120.00, 2),
('Corolla', '2019', 150.00, 3),
('Civic', '2022', 200.00, 4),
('Golf', '2020', 250.00, 5),
('Série 3', '2021', 180.00, 6),
('Classe A', '2019', 300.00, 7),
('Elantra', '2022', 100.00, 8),
('A4', '2020', 350.00, 9),
('Sentra', '2021', 170.00, 10),
('Uno', '2019', 400.00, 11),
('Sportage', '2022', 90.00, 12),
('XC40', '2020', 95.00, 13),
('Impreza', '2021', 55.00, 14),
('Renegade', '2019', 75.00, 15),
('Model 3', '2022', 120.00, 16),
('Mazda3', '2020', 70.00, 17),
('208', '2021', 50.00, 18),
('F-PACE', '2019', 110.00, 19),
('Range Rover Evoque', '2022', 95.00, 20);

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

INSERT INTO carro (id_cor, id_modelo, placa, id_agencia, image_path)
VALUES
(1, 1, 'ABC-1234', '8', 'carro1.jpg'),
(2, 2, 'DEF-5678', '8', 'carro2.jpg'),
(3, 3, 'GHI-9012', '8', 'carro3.jpg'),
(4, 4, 'JKL-3456', '8', 'carro4.jpg'),
(5, 5, 'MNO-7890', '8', 'carro5.jpg'),
(6, 6, 'PQR-1234', '8', 'carro6.jpg'),
(7, 7, 'STU-5678', '8', 'carro7.jpg'),
(8, 8, 'VWX-9012', '8', 'carro8.jpg'),
(9, 9, 'YZA-3456', '8', 'carro9.jpg'),
(10, 10, 'BCD-7890', '8', 'carro10.jpg'),
(11, 11, 'EFG-1234', '8', 'carro11.jpg'),
(12, 12, 'HIJ-5678', '8', 'carro12.jpg'),
(1, 1, 'ABC-1234', '9', 'carro1.jpg'),
(2, 2, 'DEF-5678', '9', 'carro2.jpg'),
(3, 3, 'GHI-9012', '9', 'carro3.jpg'),
(4, 4, 'JKL-3456', '9', 'carro4.jpg'),
(5, 5, 'MNO-7890', '9', 'carro5.jpg'),
(6, 6, 'PQR-1234', '9', 'carro6.jpg'),
(7, 7, 'STU-5678', '9', 'carro7.jpg'),
(8, 8, 'VWX-9012', '9', 'carro8.jpg'),
(9, 9, 'YZA-3456', '9', 'carro9.jpg'),
(10, 10, 'BCD-7890', '9', 'carro10.jpg'),
(11, 11, 'EFG-1234', '9', 'carro11.jpg'),
(12, 12, 'HIJ-5678', '9', 'carro12.jpg'),
(13, 13, 'KLM-9012', '9', 'carro13.jpg'),
(14, 14, 'NOP-3456', '9', 'carro14.jpg'),
(15, 15, 'QRS-7890', '9', 'carro15.jpg'),
(16, 16, 'TUV-1234', '9', 'carro16.jpg'),
(1, 1, 'ABC-1234', '10', 'carro1.jpg'),
(2, 2, 'DEF-5678', '10', 'carro2.jpg'),
(3, 3, 'GHI-9012', '10', 'carro3.jpg'),
(4, 4, 'JKL-3456', '10', 'carro4.jpg'),
(5, 5, 'MNO-7890', '10', 'carro5.jpg'),
(6, 6, 'PQR-1234', '10', 'carro6.jpg'),
(7, 7, 'STU-5678', '10', 'carro7.jpg'),
(8, 8, 'VWX-9012', '10', 'carro8.jpg'),
(9, 9, 'YZA-3456', '10', 'carro9.jpg'),
(10, 10, 'BCD-7890', '10', 'carro10.jpg'),
(11, 11, 'EFG-1234', '10', 'carro11.jpg'),
(12, 12, 'HIJ-5678', '10', 'carro12.jpg'),
(13, 13, 'KLM-9012', '10', 'carro13.jpg'),
(14, 14, 'NOP-3456', '10', 'carro14.jpg'),
(15, 15, 'QRS-7890', '10', 'carro15.jpg'),
(16, 16, 'TUV-1234', '10', 'carro16.jpg'),
(17, 17, 'WXY-5678', '10', 'carro17.jpg'),
(18, 18, 'ZAB-9012', '10', 'carro18.jpg'),
(19, 19, 'BCD-3456', '10', 'carro19.jpg'),
(20, 20, 'EFG-7890', '10', 'carro20.jpg');

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
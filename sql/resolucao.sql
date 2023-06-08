create database loja_musica;

CREATE TABLE instrumento (
  id_instrumento SERIAL PRIMARY KEY,
  nome_instrumento VARCHAR(500) not NULL,
  preco float not NULL,
  promocao BOOLEAN NOT NULL
)

CREATE TABLE produto_vendido (
  id_vendedor SERIAL PRIMARY KEY,
  nome_vendedor VARCHAR(500) NOT NULL,
  data_hora_venda TIMESTAMP not null,
  preco_venda FLOAT NOT NULL,
  fk_id_instrumento INT NOT NULL,
  CONSTRAINT fk_instrumento FOREIGN KEY (fk_id_instrumento) REFERENCES instrumento(id_instrumento)
  on DELETE CASCADE
)

INSERT INTO instrumento (nome_instrumento, preco, promocao) VALUES
  ('Jimi Hendrix Spirit One', 10000.00, TRUE),
  ('Jimi Hendrix Spirit Two', 15000.00, FALSE),
  ('Fender Precision Bass', 1500.00, TRUE),
  ('Fender Jazz Bass', 1800.00, FALSE),
  ('Gibson Thunderbird', 3000.00, TRUE),
  ('Pearl Export', 2500.00, FALSE),
  ('Ludwig Classic Maple', 2000.00, FALSE)
  
INSERT INTO produto_vendido (nome_vendedor, data_hora_venda, preco_venda, fk_id_instrumento) VALUES
  ('Maciel Galvão', '2023-03-28 10:30:00', 8900.00, 1),
  ('Rafael Augusto', '2023-03-30 18:56:00', 9000.00, 1),
  ('Larissa Esteves', '2023-04-15 14:32:00', 1800.00, 4),
  ('Flávio César', '2023-05-09 16:29:54', 2000.00, 7),
  ('Amanda Santos', '2023-07-08 09:23:45', 2800.00, 5),
  ('Larissa Esteves', '2023-11-09 08:20:37', 8000.00, 1),
  ('Flávio César', '2023-04-28 16:55:12', 15000.00, 2),
  ('Amanda Santos', '2023-06-05 19:12:03', 1300.00, 3),
  ('Maciel Galvão', '2023-11-09 08:20:37', 2500.00, 6)
  
  select * from produto_vendido INNER JOIN instrumento
  on produto_vendido.id_vendedor = instrumento.id_instrumento
  
  SELECT * from produto_vendido RIGHT JOIN instrumento
  on instrumento.id_instrumento = produto_vendido.fk_id_instrumento
  
  SELECT * from produto_vendido RIGHT JOIN instrumento
  on instrumento.id_instrumento = produto_vendido.fk_id_instrumento
  where instrumento.preco > 2000
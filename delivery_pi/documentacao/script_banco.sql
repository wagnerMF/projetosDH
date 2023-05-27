
create database projetodelivery;
use projetodelivery;

create table usuarios
(
  id_usuario int not null primary key auto_increment,
  cracha_usuario char(6) not null unique,
  nome_usuario varchar (35) not null
);

insert into usuarios (cracha_usuario,nome_usuario) values ('WMF','wagner rodrigues');
insert into usuarios (cracha_usuario,nome_usuario) values ('VRC','vanessa rodrigues');
select * from usuarios;

create table categorias
(
  id_categoria int not null primary key auto_increment,
  nomecategoria char(35) not null unique
);
insert into categorias (nomecategoria) values ('ESFIHAS');
insert into categorias (nomecategoria) values ('PIZZAS');
insert into categorias (nomecategoria) values ('LANCHES');
insert into categorias (nomecategoria) values ('REFRIGERANTES');
insert into categorias (nomecategoria) values ('SUCOS');

select * from categorias;

create table produtos
(
  id_produtos int not null primary key auto_increment,
  nome_produtos char(35) not null unique,
  descricao_produtos varchar(100) null,
  valor_produtos dec(10,2) not null,
  id_categoria int references categorias (id_categoria),
  status_produtos char(1) not null
);
insert into produtos (id_categoria,nome_produtos,descricao_produtos,valor_produtos,status_produtos) values (1,'Esfiha de Carne','mussarela,carne moida',2.5,'A');
insert into produtos (id_categoria,nome_produtos,descricao_produtos,valor_produtos,status_produtos) values (2,'Pizza de frango','mussarela,frango desfiado',18,'A');
insert into produtos (id_categoria,nome_prprodutosodutos,descricao_produtos,valor_produtos,status_produtos) values (3,'Coxinha e carne','mussarela,carne moida',4.5,'A');
insert into produtos (id_categoria,nome_produtos,descricao_produtos,valor_produtos,status_produtos) values (5,'Suco de Uva','polpa de uva',2.5,'A');
insert into produtos (id_categoria,nome_produtos,descricao_produtos,valor_produtos,status_produtos) values (4,'Guaraná',"",2.5,'A');

select * from produtos;
select * from categorias;

create table pedidos
(
  id_pedidos int not null primary key auto_increment,
  datahora_pedidos DATETIME,   
  cracha_usuario char(6) references usuarios(cracha_usuario),
  valorTotal dec(10,2) not null,
  status_pedido char(7) not null
);

  insert into pedidos (cracha_usuario,valorTotal,datahora_pedidos,status_pedido) values ('WMF',52.5,now(),'fechado');
  insert into pedidos (cracha_usuario,valorTotal,datahora_pedidos,status_pedido) values ('WMF',75,now(),'fechado');
  insert into pedidos (cracha_usuario,valorTotal,datahora_pedidos,status_pedido) values ('WMF',48,now(),'fechado');
  
 select * from pedidos;
 select * from produtos;
 truncate table pedidos;
 drop table pedidos;
  
create table itempedidos
(
  id_itempedidos int not null primary key auto_increment,
  id_pedidos int not null unique references pedidos (id_pedidos),
  id_produtos int not null references produtos (id_produtos),
  qtde_itempedidos int not null,
  valor_unitario dec(10,2) not null,
  total_itempedidos dec(10,2)
);

insert into itempedidos (id_pedidos,id_produtos,qtde_itempedidos,valor_unitario,total_itempedidos) values (1,1,5,2.5,15.5);  #5x2,5=15,5
insert into itempedidos (id_pedidos,id_produtos,qtde_itempedidos,valor_unitario,total_itempedidos) values (2,2,1,18,36);  #2x18=36
insert into itempedidos (id_pedidos,id_produtos,qtde_itempedidos,valor_unitario,total_itempedidos) values (3,3,4,4.5,13.5);  #3x4,5=13,5

select * from itempedidos;
truncate table itempedidos;
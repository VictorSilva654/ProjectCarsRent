drop database if exists `DBFleet`;
create database DBFleet;
use DBFleet;

drop table if exists `filial`;
create table filial(
id_filial int not null primary key auto_increment,
nome_filial varchar(50) not null,
logradouro_filial varchar(150) not null,
cidade_filial varchar(30) not null,
uf_filial varchar(20) not null,
telefone_filial varchar(15) not null
);

insert into filial(
nome_filial, logradouro_filial, cidade_filial, 
uf_filial, telefone_filial) values ("Matriz", "Rua Florêncio de Abreu, 
304, Centro", "São Paulo", "São Paulo", "(11) 3796-7971");
insert into filial(
nome_filial, logradouro_filial, cidade_filial, 
uf_filial, telefone_filial) values ("Butantã", "Rua Rizieri Negrini, 
772, Jardim Bonfiglioli", "São Paulo", "São Paulo", "(11)3650-3085");
insert into filial(
nome_filial, logradouro_filial, cidade_filial, 
uf_filial, telefone_filial) values ("Santa Bárbara - Interior SP", 
"Rua Adolphino Camargo, 553, Jardim Santa Rita de Cássia", 
"Santa Bárbara D'Oeste", "São Paulo", "(19)2881-1564");

drop table if exists `fornecedor`;
create table fornecedor(
id_fornecedor int not null primary key auto_increment,
nome_fornecedor varchar(50) not null,
cnpj_fornecedor bigint(15) not null unique,
endereco_fornecedor varchar(150) not null,
telefone_fornecedor varchar(20) not null,
contatovendas_fornecedor varchar(50) not null
);

insert into fornecedor(
nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, 
telefone_fornecedor, contatovendas_fornecedor) values (
"Felipe e Kauê Pneus ME", "11983653000154", "Rua Doutor Theodoro 
Langaard, 373, Bonfim, Campinas - SP", "(19)3727-3433" ,
"Kauê Rodrigues");
insert into fornecedor(
nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, 
telefone_fornecedor, contatovendas_fornecedor) values (
"O Rei da Peça - Peças Automotivas LTDA", "31000413000108", 
"Rua Virgínia Viel Campo Dall'Orto, 552, Vila Yolanda Costa e Silva,
Jardim Palo Alto, São Paulo - SP", "(11) 3841-3328" , 
"Thainá Cristina");
insert into fornecedor(
nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, 
telefone_fornecedor, contatovendas_fornecedor) values (
"NewCar Consessionárias LTDA","50277762000108", "Rua Antônio 
Marques, 789, Pinheiros, São Paulo - SP", "(11) 3527-2902" ,
"Adolfo Pinheiro");
insert into fornecedor(
nome_fornecedor, cnpj_fornecedor, endereco_fornecedor, 
telefone_fornecedor, contatovendas_fornecedor) values (
"Vecchia Signora Motors LTDA","26585313000142", "Rua dos Carvalhos,
320, Granja Vianna - Cotia - SP", "(11) 2706-4298" ,
"Rodolfo Rezende");
select * from fornecedor;

drop table if exists `veiculo`;
create table veiculo(
id_veiculo int not null primary key auto_increment,
placa_veiculo varchar(8) not null unique,
documento_veiculo varchar(30) not null unique,
marca_veiculo varchar(15) not null,
modelo_veiculo varchar(30) not null,
carroceria_veiculo varchar(20) not null,
ano_veiculo int(5) not null,
filial_veiculo int not null,
fornecedor_veiculo int not null,
foreign key (`filial_veiculo`) references 
`filial.id_filial` on delete no action 
on update cascade,
foreign key (`fornecedor_veiculo`) references 
`fornecedor.id_fornecedor` on delete no action 
on update cascade
 );

insert into veiculo(
placa_veiculo, documento_veiculo, marca_veiculo,
modelo_veiculo, carroceria_veiculo, ano_veiculo, filial_veiculo,
fornecedor_veiculo) values ("BZK8745", "23397617177", "Renault", 
"Sandero Authentique 1.0 5p", "Hatch", 2015, 1, 3);
insert into veiculo(
placa_veiculo, documento_veiculo, marca_veiculo,
modelo_veiculo, carroceria_veiculo, ano_veiculo, filial_veiculo,
fornecedor_veiculo) values ("BHR6542", "08779888990", "Ford", 
"EcoSport SE 1.6 16V Flex", "SUV", 2013, 1, 3);
insert into veiculo(
placa_veiculo, documento_veiculo, marca_veiculo,
modelo_veiculo, carroceria_veiculo, ano_veiculo, filial_veiculo,
fornecedor_veiculo) values ("DKO3265", "83296111190", "VolksWagen", 
"Saveiro CROSSOVER 1.8 8V", "Caminhonete", 2005, 1, 3);
insert into veiculo(
placa_veiculo, documento_veiculo, marca_veiculo,
modelo_veiculo, carroceria_veiculo, ano_veiculo, filial_veiculo,
fornecedor_veiculo) values ("EQW0814", "45185400921", "Chevrolet", 
"Onix LTE 1.4 Flex", "Hatch", 2017, 2, 4);
insert into veiculo(
placa_veiculo, documento_veiculo, marca_veiculo,
modelo_veiculo, carroceria_veiculo, ano_veiculo, filial_veiculo,
fornecedor_veiculo) values ("BXP7056", "5764276271", "Fiat", 
"Mobi Easy 1.0 Fire Flex 5p.", "Hatch", 2019, 2, 4);

drop table if exists `situacao_cliente`;
create table situacao_cliente(
id_situacaocliente int not null primary key auto_increment,
situacao_cliente varchar(15) not null
);

insert into situacao_cliente(
situacao_cliente) values ("Ativo");
insert into situacao_cliente(
situacao_cliente) values ("Devendo");
insert into situacao_cliente(
situacao_cliente) values ("Inativo");


drop table if exists `cliente_fisico`;
create table cliente_fisico(
id_clientef int not null primary key auto_increment,
nome_clientef varchar(50) not null,
rg_clientef varchar(9) not null unique,
cpf_clientef bigint(11) not null unique,
cnh_clientef bigint(12) not null unique,
endereco_clientef varchar(150) not null,
dtnasc_clientef date not null,
telefone_clientef varchar(20) not null,
email_clientef varchar(50) not null,
situacao_clientef int not null,
foreign key (`situacao_clientef`) references
`situacao_cliente.id_situacaocliente` on delete no action 
on update cascade
 );
 
insert into cliente_fisico(
nome_clientef, rg_clientef, cpf_clientef, cnh_clientef, 
endereco_clientef, dtnasc_clientef, telefone_clientef, 
email_clientef, situacao_clientef) values ("Lucas Teixeira Ducati",
"403289440", "51775217108", "46006157591", "Avenida Antônio Carlos 
Costa, 685, Bela Vista, Osasco- SP","1995-07-21","(11) 98732-6065", 
"lucastxducati@br.pwc.com", 1);
insert into cliente_fisico(
nome_clientef, rg_clientef, cpf_clientef, cnh_clientef, 
endereco_clientef, dtnasc_clientef, telefone_clientef, 
email_clientef, situacao_clientef) values ("Gabriela Rafaela 
Ana Carvalho","383699356", "34197009895", "87712109398", 
"Rua Estocolmo, 170, Vila São Francisco, Itapevi - SP","1987-06-25",
"(11) 98732-6065", "gabrielarafaelaanacarvalho@robiel.com.br", 1);
insert into cliente_fisico(
nome_clientef, rg_clientef, cpf_clientef, cnh_clientef, 
endereco_clientef, dtnasc_clientef, telefone_clientef, 
email_clientef, situacao_clientef) values ("Paulo Marcelo Gomes",
"289648129", "44792475805", "91625261977", 
"Rua Itinga, 456, Jardim São Gabriel, São Paulo - SP","1990-11-13",
"(11) 3872-4120", "paulomarcelogomes@aspadvocacia.com", 1);


drop table if exists `cliente_juridico`;
create table cliente_juridico(
id_clientej int not null primary key auto_increment,
nome_clientej varchar(50) not null,
razaosocial_clientej varchar(50) not null,
cnpj_clientej bigint(15) not null unique,
endereco_clientej varchar(150) not null,
telefone_clientej varchar(20) not null,
email_clientej varchar(60) not null,
situacao_clientej int not null,
foreign key (`situacao_clientej`) references
`situacao_cliente.id_situacaocliente` on delete no action 
on update cascade
);

insert into cliente_juridico(
nome_clientej,razaosocial_clientej,cnpj_clientej,endereco_clientej,
telefone_clientej,email_clientej,situacao_clientej)values(
"Juan e Caroline Alimentos ME", "Mercadinho do Juan","05072766000103",
"Avenida Professora Isette Corrêa Fontão, 4, Jardim Bela Vista, Osasco
-SP","(11) 2772-0489","contato@juanecarolinealimentosme.com.br", 1);
insert into cliente_juridico(
nome_clientej,razaosocial_clientej,cnpj_clientej,endereco_clientej,
telefone_clientej,email_clientej,situacao_clientej)values(
"Ouro Fino Telas ME", "Ouro Fino Telas","28875167000115",
"Rua Maísa, 124, Parque Basílio, Ibiúna-SP","(15) 3918-6248",
"administracao@ourofinotelas.com.br", 2);
insert into cliente_juridico(
nome_clientej,razaosocial_clientej,cnpj_clientej,endereco_clientej,
telefone_clientej,email_clientej,situacao_clientej)values(
"Frigorífico FriFree LTDA", "Frigorífico FriFree","07390102000100",
"Avenida Rotary, 900, Jardim Brasil, Pindamonhangaba-SP","(19) 2990-9540",
"contato@frifree.com.br", 1);

drop table if exists `tipo_cliente`;
create table tipo_cliente(
id_tipocliente int not null primary key auto_increment,
tipocliente varchar(15) not null
);

insert into tipo_cliente(
tipocliente) values ("Físico");
insert into tipo_cliente(
tipocliente) values ("Jurídico");


drop table if exists `motorista`;
create table motorista(
id_motorista int not null primary key auto_increment,
nome_motorista varchar(50) not null,
dtnasc_motorista date not null,
rg_motorista varchar(9) not null unique,
cpf_motorista bigint(11) not null unique,
cnh_motorista bigint(12) not null unique,
validadecnh_motorista date not null,
tipocnh_motorista varchar(2) not null,
endereco_motorista varchar(150) not null,
telefone_motorista varchar(20) not null
);

insert into motorista(
nome_motorista,dtnasc_motorista,rg_motorista, cpf_motorista, 
cnh_motorista,validadecnh_motorista,tipocnh_motorista, 
endereco_motorista, telefone_motorista)values("Benedito Enzo Gomes",
"1975-04-21", "330196467", "90321642872", "36091435606", "2021-03-12",
"C", "Rua Menino da Porteira, 595, Vila Yara, Osasco-SP", "11993866066");
insert into motorista(
nome_motorista,dtnasc_motorista,rg_motorista, cpf_motorista, 
cnh_motorista,validadecnh_motorista,tipocnh_motorista, 
endereco_motorista, telefone_motorista)values("Pedro Portela Ferreira",
"1983-10-23", "477652141", "38517689810", "93604218958", "2023-11-24",
"AB", "Rua Coronel Batista da Luz, 857, Parque Ipê, São Paulo-SP", 
"11982769026");
insert into motorista(
nome_motorista,dtnasc_motorista,rg_motorista, cpf_motorista, 
cnh_motorista,validadecnh_motorista,tipocnh_motorista, 
endereco_motorista, telefone_motorista)values("Marcelo Souza Monteiro",
"1970-01-21", "249137677", "65927646867", "23313414237", "2019-10-06",
"C", "Rua Tibúrcio da Cunha, 43, Jardim Ângela, São Paulo-SP", 
"11987360681");

drop table if exists `multas`;
create table multas(
id_multa int not null primary key auto_increment,
cod_multa varchar(25) not null unique,
veiculo_multa int not null,
valor_multa decimal(10,2) not null,
tipocliente_multa int,
cliente_multa int,
motorista_multa int,
datahora_multa datetime not null,
endereco_multa varchar(150) not null,
cidade_multa varchar(30) not null,
uf_multa varchar(20) not null,
foreign key (`veiculo_multa`) references
`veiculo.id_veiculo` on delete no action
on update cascade,
foreign key (`tipocliente_multa`) references
`tipo_cliente.id_tipocliente` on delete no action
on update cascade,
foreign key (`cliente_multa`) references
`cliente_fisico.id_clientef` on delete no action 
on update cascade,
foreign key (`cliente_multa`) references
`cliente_juridico.id_clientej` on delete no action 
on update cascade,
foreign key (`motorista_multa`) references
`motorista.id_motorista` on delete no action 
on update cascade
);

insert into multas(
cod_multa, veiculo_multa, valor_multa, tipocliente_multa, 
cliente_multa, motorista_multa, datahora_multa, endereco_multa, 
cidade_multa, uf_multa)values("345278634848", 3, 120.41, 1, 3, null,
"2018-02-21 21:51:34","BR-104, S/N", "Juazeiro do Norte","Ceará");
insert into multas(
cod_multa, veiculo_multa, valor_multa, tipocliente_multa, 
cliente_multa, motorista_multa, datahora_multa, endereco_multa, 
cidade_multa, uf_multa)values("57418105AW", 2, 45.68, null, null, 2,
"2019-04-03 10:47:03","Avenida Rotary, 5104, Bairro do Salgado", "Balneário Camboriú",
"Santa Catarina");
insert into multas(
cod_multa, veiculo_multa, valor_multa, tipocliente_multa, 
cliente_multa, motorista_multa, datahora_multa, endereco_multa, 
cidade_multa, uf_multa)values("1024PU78WX62", 3, 68.90, 2, 1, null,
"2018-12-17","Rua Conde Francisco José, 230, Centro", "Maringá",
"Paraná");
select * from multas;

drop table if exists `aluguel`;
create table aluguel(
id_aluguel int not null primary key auto_increment,
veiculo_aluguel int not null,
data_aluguel date not null,
dataentrega_aluguel date not null,
tipocliente_aluguel int not null,
cliente_aluguel int not null,
foreign key (`veiculo_aluguel`) references
`veiculo.id_veiculo` on delete no action
on update cascade,
foreign key (`tipocliente_aluguel`) references
`tipo_cliente.id_tipocliente` on delete no action
on update cascade,
foreign key (`cliente_aluguel`) references
`cliente_fisico.id_clientef` on delete no action 
on update cascade,
foreign key (`cliente_aluguel`) references
`cliente_juridico.id_clientej` on delete no action 
on update cascade
);

insert into aluguel(
veiculo_aluguel, data_aluguel, dataentrega_aluguel,tipocliente_aluguel, 
cliente_aluguel)values(3,"2018-02-19","2018-02-23",1,3);
insert into aluguel(
veiculo_aluguel, data_aluguel, dataentrega_aluguel,tipocliente_aluguel, 
cliente_aluguel)values(4,"2018-12-16","2018-12-23",2,1);
insert into aluguel(
veiculo_aluguel, data_aluguel, dataentrega_aluguel,tipocliente_aluguel, 
cliente_aluguel)values(3,"2019-04-02","2019-04-04",1,1);
insert into aluguel(
veiculo_aluguel, data_aluguel, dataentrega_aluguel,tipocliente_aluguel, 
cliente_aluguel)values(5,"2019-06-04","2019-06-10",1,2);


drop table if exists `viagem`;
create table viagem(
id_viagem int not null primary key auto_increment,
rota_viagem varchar(50) not null,
qtdocupantes_viagem int not null,
veiculo_viagem int not null,
aluguel_viagem int,
motorista_viagem int,
tipocliente_viagem int,
cliente_viagem int,
foreign key (`veiculo_viagem`) references
`veiculo.id_veiculo` on delete no action
on update cascade,
foreign key (`aluguel_viagem`) references
`aluguel.id_aluguel` on delete no action 
on update cascade,
foreign key (`motorista_viagem`) references
`motorista.id_motorista` on delete no action 
on update cascade,
foreign key (`tipocliente_viagem`) references
`tipo_cliente.id_tipocliente` on delete no action
on update cascade,
foreign key (`cliente_viagem`) references
`cliente_fisico.id_clientef` on delete no action 
on update cascade,
foreign key (`cliente_viagem`) references
`cliente_juridico.id_clientej` on delete no action 
on update cascade
);
insert into viagem(
rota_viagem, qtdocupantes_viagem, veiculo_viagem, aluguel_viagem,
motorista_viagem, tipocliente_viagem, cliente_viagem)values("São Paulo/
SP - Fortaleza/CE", 2, 3,1,null,1,3);
insert into viagem(
rota_viagem, qtdocupantes_viagem, veiculo_viagem, aluguel_viagem,
motorista_viagem, tipocliente_viagem, cliente_viagem)values("São Paulo/
SP - Maringá/PR", 4, 1,3,null,1,1);
insert into viagem(
rota_viagem, qtdocupantes_viagem, veiculo_viagem, aluguel_viagem,
motorista_viagem, tipocliente_viagem, cliente_viagem)values("São Paulo/
SP - Santos/SP", 2, 2,null,3,null,null);
insert into viagem(
rota_viagem, qtdocupantes_viagem, veiculo_viagem, aluguel_viagem,
motorista_viagem, tipocliente_viagem, cliente_viagem) values ("São Paulo/
SP - Olinda/PE",3,5,3,null,1,2);
select * from viagem;

drop table if exists `pecas`;
create table pecas(
id_peca int not null primary key auto_increment,
modelo_peca varchar(100) not null,
fornecedor_peca int not null,
qtd_peca bigint(5) not null,
veiculo_peca int not null,
foreign key (`fornecedor_peca`) references
`fornecedor.id_fornecedor` on delete no action 
on update cascade,
foreign key (`veiculo_peca`) references
`veiculo.id_veiculo` on delete no action 
on update cascade
);
insert into pecas(
modelo_peca,fornecedor_peca,qtd_peca,veiculo_peca)values(
"Lanterna Traseira Sandero",2,3,1);
insert into pecas(
modelo_peca,fornecedor_peca,qtd_peca,veiculo_peca)values(
"Escapamento EcoSport",2,1,2);
insert into pecas(
modelo_peca,fornecedor_peca,qtd_peca,veiculo_peca)values(
"Tampa do Tanque",2,15,2);
insert into pecas(
modelo_peca,fornecedor_peca,qtd_peca,veiculo_peca)values(
"Óleo para Motores Lubrax",2,6,3);

drop table if exists `pneus`;
create table pneus(
id_pneu int not null primary key auto_increment,
modelo_pneu varchar(50) not null,
aro_pneu int(2) not null,
qtd_pneu bigint(5) not null,
fornecedor_pneu int not null,
foreign key (`fornecedor_pneu`) references
`fornecedor.id_fornecedor` on delete no action 
on update cascade
);

insert into pneus(
modelo_pneu, aro_pneu, qtd_pneu, fornecedor_pneu) values(
"GoodYear 741B","14", 8, 1);
insert into pneus(
modelo_pneu, aro_pneu, qtd_pneu, fornecedor_pneu) values(
"Michelin 7D43B","13", 14, 1);
insert into pneus(
modelo_pneu, aro_pneu, qtd_pneu, fornecedor_pneu) values(
"Pirelli 88K","16", 4, 1);
select * from pneus;


drop table if exists `seguro_carro`;
create table seguro_carro(
id_seguro int not null primary key auto_increment,
cod_seguro varchar(50) not null unique,
seguradora_seguro varchar(40) not null,
valor_seguro decimal(10,2) not null,
veiculo_seguro int not null,
foreign key (`veiculo_seguro`) references
`veiculo.id_veiculo` on delete no action 
on update cascade
);

insert into seguro_carro(
cod_seguro, seguradora_seguro, valor_seguro, veiculo_seguro)values(
"R43ED4","Bradesco Seguro Auto",2500.00,1);
insert into seguro_carro(
cod_seguro, seguradora_seguro, valor_seguro, veiculo_seguro)values(
"P09GTY432","SulAmerica Auto",5200.00,2);
insert into seguro_carro(
cod_seguro, seguradora_seguro, valor_seguro, veiculo_seguro)values(
"J76ED4","Bradesco Seguro Auto",9600.00,3);
select * from seguro_carro;

drop table if exists `sinistro`;
create table sinistro(
id_sinistro int not null primary key auto_increment,
cod_sinistro varchar(50) not null unique,
viagem_sinistro int not null,
descricao_sinistro varchar(255) not null,
aluguel_sinistro int,
seguro_sinistro int not null,
foreign key (`viagem_sinistro`) references
`viagem.id_viagem` on delete no action 
on update cascade,
foreign key (`aluguel_sinistro`) references
`aluguel.id_aluguel` on delete no action 
on update cascade,
foreign key (`seguro_sinistro`) references
`seguro_carro.id_seguro` on delete no action 
on update cascade
);
insert into sinistro(
cod_sinistro, viagem_sinistro, descricao_sinistro, aluguel_sinistro,
seguro_sinistro)values("4785IRGN3",3,"Leve batida no pára-choque",null,
2);

drop table if exists `contas_receber`;
create table contas_receber(
id_receber int not null primary key auto_increment,
codconta_receber varchar(50) not null unique,
valor_receber decimal(10,2) not null,
nfconta_receber varchar(20) not null unique,
data_receber date not null,
tipocliente_receber int not null,
cliente_receber int not null,
foreign key (`tipocliente_receber`) references
`tipo_cliente.id_tipocliente` on delete no action
on update cascade,
foreign key (`cliente_receber`) references
`cliente_fisico.id_clientef` on delete no action 
on update cascade,
foreign key (`cliente_receber`) references
`cliente_juridico.id_clientej` on delete no action 
on update cascade
);
insert into contas_receber(
codconta_receber, valor_receber, nfconta_receber, data_receber, 
tipocliente_receber, cliente_receber) values("000001",251.35,"000025",
"2019-05-30",2,2);

drop table if exists `manutencao`;
create table manutencao(
id_manutencao int not null primary key auto_increment,
descricao_manutencao varchar(255) not null,
pecas_manutencao int,
veiculo_manutencao int not null,
responsavel_manutencao varchar(100) not null,
datahora_manutencao datetime not null,
foreign key (`pecas_manutencao`) references
`pecas.id_pecas` on delete no action 
on update cascade,
foreign key (`veiculo_manutencao`) references
`veiculo.id_veiculo` on delete no action 
on update cascade
);
insert into manutencao(
descricao_manutencao, pecas_manutencao, veiculo_manutencao, 
responsavel_manutencao, datahora_manutencao)values("Manutenção preventiva:
Trocado óleo do motor",4,3,"Ubirajara Óleos","2019-05-30 14:24:16");

drop table if exists `entrada_veiculo`;
create table entrada_veiculo(
id_entrada int not null primary key auto_increment,
viagem_entrada int not null,
filial_entrada int not null,
tipocliente_entrada int,
cliente_entrada int,
motorista_entrada int,
veiculo_entrada int not null,
datahora_entrada datetime not null,
foreign key (`viagem_entrada`) references
`viagem.id_viagem` on delete no action 
on update cascade,
foreign key (`filial_entrada`) references
`filial.id_filial` on delete no action 
on update cascade,
foreign key (`tipocliente_entrada`) references
`tipo_cliente.id_tipocliente` on delete no action 
on update cascade,
foreign key (`cliente_entrada`) references
`cliente_fisico.id_clientef` on delete no action 
on update cascade,
foreign key (`cliente_entrada`) references
`cliente_juridico.id_clientej` on delete no action 
on update cascade,
foreign key (`motorista_entrada`) references
`motorista.id_motorista` on delete no action 
on update cascade,
foreign key (`veiculo_entrada`) references
`veiculo.id_veiculo` on delete no action 
on update cascade
);
insert into entrada_veiculo(
viagem_entrada, filial_entrada, tipocliente_entrada, cliente_entrada,
motorista_entrada, veiculo_entrada, datahora_entrada) values (
1, 3, null, null,3 ,2,"2019-05-15 06:30:51");
insert into entrada_veiculo(
viagem_entrada, filial_entrada, tipocliente_entrada, cliente_entrada,
motorista_entrada, veiculo_entrada, datahora_entrada) values (
4, 2, 1, 2, null,5,"2019-06-10 12:51:23");

drop table if exists `saida_veiculo`;
create table saida_veiculo(
id_saida int not null primary key auto_increment,
viagem_saida int not null,
filial_saida int not null,
tipocliente_saida int,
cliente_saida int,
motorista_saida int,
veiculo_saida int not null,
datahora_saida datetime not null,
foreign key (`viagem_saida`) references
`viagem.id_viagem` on delete no action 
on update cascade,
foreign key (`filial_saida`) references
`filial.id_filial` on delete no action 
on update cascade,
foreign key (`tipocliente_saida`) references
`tipo_cliente.id_tipocliente` on delete no action 
on update cascade,
foreign key (`cliente_saida`) references
`cliente_fisico.id_clientef` on delete no action 
on update cascade,
foreign key (`cliente_saida`) references
`cliente_juridico.id_clientej` on delete no action 
on update cascade,
foreign key (`motorista_saida`) references
`motorista.id_motorista` on delete no action 
on update cascade,
foreign key (`veiculo_saida`) references
`veiculo.id_veiculo` on delete no action 
on update cascade
);
insert into saida_veiculo(
viagem_saida, filial_saida, tipocliente_saida, cliente_saida,
motorista_saida, veiculo_saida, datahora_saida) values (
1, 1, null, null,3 ,2,"2019-05-13 15:48:00");
insert into saida_veiculo(
viagem_saida, filial_saida, tipocliente_saida, cliente_saida,
motorista_saida, veiculo_saida, datahora_saida) values (
4, 2, 1, 2, null,5,"2019-06-04 16:07:14");

select * from saida_veiculo;

# selects e views do banco de dados

drop view if exists `tb_filial`;
create view tb_filial as(
select nome_filial as `Nome`, logradouro_filial as `Endereço`, cidade_filial 
as `Cidade`, uf_filial as `Estado`, telefone_filial as `Telefone` from
filial);
select * from tb_filial;

drop view if exists `tb_fornecedor`;
create view tb_fornecedor as(
select nome_fornecedor as `Nome`, cnpj_fornecedor as `CNPJ`, 
endereco_fornecedor as `Endereço`, telefone_fornecedor as `Telefone`, 
contatovendas_fornecedor as `Contato de Vendas` from fornecedor);
select * from tb_fornecedor;

drop view if exists `tb_veiculo`;
create view tb_veiculo as(
select concat(marca_veiculo, ' ', modelo_veiculo) as `Modelo`, 
placa_veiculo as `Placa`, ano_veiculo as `Ano`, 
concat(filial_veiculo, ' - ',nome_filial) as `Filial`,
documento_veiculo as `Documento`, carroceria_veiculo as 
`Carroceria`, nome_fornecedor as `Fornecedor` from veiculo join 
filial on veiculo.filial_veiculo = filial.id_filial join fornecedor
on fornecedor.id_fornecedor = veiculo.fornecedor_veiculo order by 
marca_veiculo asc);
select * from tb_veiculo;

drop view if exists `tb_clientej`;
create view tb_clientej as(
select nome_clientej as `Nome`, razaosocial_clientej as `Razão Social`,
cnpj_clientej as`CNPJ`, endereco_clientej as`Endereço`,telefone_clientej 
as `Telefone`, email_clientej as `E-mail`, sc.situacao_cliente as `Situação
do Cliente`from cliente_juridico as cj join situacao_cliente as sc on 
cj.situacao_clientej = sc.id_situacaocliente order by nome_clientej asc);
select * from tb_clientej;

drop view if exists `tb_clientef`;
create view tb_clientef as(
select nome_clientef as `Nome`, rg_clientef as `RG`, cpf_clientef as
`CPF`, cnh_clientef as `CNH`, endereco_clientef as `Endereço`, dtnasc_clientef
as `Data de Nascimento`, telefone_clientef as `Telefone`, email_clientef
as `E-mail`, sc.situacao_cliente as `Situação do Cliente` from 
cliente_fisico as cf join situacao_cliente as sc on cf.
situacao_clientef = sc.id_situacaocliente order by nome_clientef asc);
select * from tb_clientef;

drop view if exists `tb_tipocliente`;
create view tb_tipocliente as(
select id_tipocliente as `ID`, tipocliente as `Tipo de Cliente` from 
tipo_cliente);
select * from tipo_cliente;

drop table if exists `tb_situacaocliente`;
create view tb_situacaocliente as(
select id_situacaocliente as `ID`, situacao_cliente as `Situação`
from situacao_cliente);
select * from tb_situacaocliente;

drop view if exists `tb_aluguel`;
create view tb_aluguel as(
select concat(marca_veiculo,' ',modelo_veiculo) as`Veiculo Alugado`, 
date_format(`data_aluguel`,'%d/%m/%Y') as `Data do Aluguel`, 
date_format(`dataentrega_aluguel`,'%d/%m/%Y') as `Data de Entrega`,
tipocliente as `Tipo do Cliente`, if (a.tipocliente_aluguel=1, 
nome_clientef, nome_clientej) as `Cliente` from aluguel as a join 
tipo_cliente on tipocliente_aluguel = tipo_cliente.id_tipocliente 
join veiculo on veiculo.id_veiculo = a.veiculo_aluguel join cliente_fisico 
as cf on cf.id_clientef = a.cliente_aluguel join cliente_juridico as 
cj on cj.id_clientej = a.cliente_aluguel order by marca_veiculo asc);
select * from tb_aluguel;

drop view if exists `tb_motorista`;
create view tb_motorista as(
select nome_motorista as `Nome`, date_format(`dtnasc_motorista`,
'%d/%m/%Y') as `Data de Nascimento`, rg_motorista as `RG`, 
cpf_motorista as `CPF`, cnh_motorista as `CNH`, date_format(
`validadecnh_motorista`,'%d/%m/%Y') as `Validade da CNH`, 
tipocnh_motorista as `Tipo de CNH`, endereco_motorista as 
`Endereço do Motorista`, telefone_motorista as `Telefone do Motorista`
from motorista);
select * from tb_motorista;

drop view if exists `tb_viagemcliente`;
create view tb_viagemcliente as (
select rota_viagem as `Rota da Viagem`, qtdocupantes_viagem as `Quantidade 
de Ocupantes`, concat(marca_veiculo, ' ', modelo_veiculo) as `Modelo`,
aluguel_viagem as `Aluguel da Viagem`,
tipocliente as `Tipo do Cliente`, if (v.tipocliente_viagem=1, nome_clientef, 
nome_clientej) as `Cliente` from viagem as v join tipo_cliente on tipocliente_viagem 
= tipo_cliente.id_tipocliente join veiculo on veiculo.id_veiculo = 
v.veiculo_viagem join cliente_fisico as cf on cf.id_clientef = 
v.cliente_viagem join cliente_juridico as cj on cj.id_clientej = v.cliente_viagem);
select * from tb_viagemcliente;
 
drop view if exists `tb_viagemmotor`;
create view tb_viagemmotor as(
select rota_viagem as `Rota da Viagem`, qtdocupantes_viagem as `Quantidade 
de Ocupantes`, concat(marca_veiculo, ' ', modelo_veiculo) as `Modelo`,
nome_motorista as `Nome do Motorista` from viagem as v join veiculo on 
veiculo.id_veiculo = v.veiculo_viagem join motorista on motorista.id_motorista 
= v.motorista_viagem);
select * from tb_viagemmotor;

drop view if exists `tb_contasreceber`;
create view tb_contasreceber as(
select codconta_receber as `Código da Conta`, valor_receber as `Valor`,
nfconta_receber as `Nota Fiscal`, date_format(`data_receber`,
'%d/%m/%Y') as `Data de Recebimento`, tipocliente as `Tipo do Cliente`, 
if (cr.tipocliente_receber=1, nome_clientef, nome_clientej) as `Cliente` 
from contas_receber as cr join tipo_cliente on tipocliente_receber =
tipo_cliente.id_tipocliente join cliente_fisico as cf on cf.id_clientef 
= cr.cliente_receber join cliente_juridico as cj on cj.id_clientej = 
cr.cliente_receber);
select * from tb_contasreceber;

drop view if exists `tb_multascliente`;
create view tb_multascliente as(
select cod_multa as `Código`, concat(marca_veiculo, ' ', modelo_veiculo) 
as `Veículo`, valor_multa as `Valor da Multa`, tipocliente as `Tipo do 
Cliente`, if (tipocliente_multa=1, nome_clientef, nome_clientej) as `Cliente`, 
date_format(`datahora_multa`, '%d/%m/%Y %H:%i:%s') as `Data e Hora da Multa`, endereco_multa
as `Endereço`, cidade_multa as `Cidade`, uf_multa as `Estado` from multas join
tipo_cliente as tc on tipocliente_multa=tc.id_tipocliente join cliente_fisico as cf on cf.id_clientef 
= multas.cliente_multa join cliente_juridico as cj on cj.id_clientej = 
multas.cliente_multa join veiculo on multas.veiculo_multa = veiculo.id_veiculo);
select * from tb_multascliente;

drop view if exists `tb_multasmotor`;
create view tb_multasmotor as(
select cod_multa as `Código`, concat(marca_veiculo, ' ', modelo_veiculo) 
as `Veículo`, valor_multa as `Valor da Multa`, nome_motorista as `Motorista`, 
date_format(`datahora_multa`, '%d/%m/%Y %H:%i:%s') as `Data e Hora da Multa`, endereco_multa
as `Endereço`, cidade_multa as `Cidade`, uf_multa as `Estado` from multas join
veiculo on multas.veiculo_multa = veiculo.id_veiculo join motorista on multas.
motorista_multa = motorista.id_motorista);
select * from tb_multasmotor;

drop view if exists `tb_sinistro`;
create view tb_sinistro as(
select cod_sinistro as `Código do Sinistro`, rota_viagem as `Rota da Viagem`, descricao_sinistro as `Descrição`, aluguel_viagem as`Aluguel`,
cod_seguro as `Seguro` from sinistro as s join viagem as v on 
s.viagem_sinistro = v.id_viagem join seguro_carro on  s.seguro_sinistro=
seguro_carro.id_seguro);
select * from tb_sinistro;

drop view if exists `tb_segurocarro`;
create view tb_segurocarro as(
select cod_seguro as `Código`, seguradora_seguro as `Seguradora`, 
valor_seguro as `Valor do Seguro`, concat(marca_veiculo,' ',modelo_veiculo) 
as `Veiculo` from seguro_carro  as seg join veiculo on seg.veiculo_seguro =
veiculo.id_veiculo order by cod_seguro asc);
select * from tb_segurocarro;

drop view if exists `tb_pecas`;
create view tb_pecas as(
select modelo_peca as `Modelo`, nome_fornecedor as `Fornecedor`,
qtd_peca as `Quantidade`, concat(marca_veiculo,' ',modelo_veiculo) 
as `Veiculo` from pecas as p join fornecedor as f on p.fornecedor_peca
= f.id_fornecedor join veiculo as v on p.veiculo_peca = v.id_veiculo);
select * from tb_pecas;

drop view if exists `tb_pneus`;
create view tb_pneus as(
select modelo_pneu as `Modelo`, aro_pneu as `Aro`, qtd_pneu as `Quantidade`, 
nome_fornecedor as `Fornecedor` from pneus  as p join fornecedor as f on
p.fornecedor_pneu = f.id_fornecedor);
select * from tb_pneus;

drop view if exists `tb_manutencao`;
create view tb_manutencao as(
select descricao_manutencao as `Descrição`, modelo_peca as `Peças`, 
concat(marca_veiculo, ' ', modelo_veiculo) as `Veículo`, 
responsavel_manutencao as `Responsável`, date_format(`datahora_manutencao`, 
'%d/%m/%Y %H:%i:%s') as `Data da Manutenção` from manutencao as m join pecas as p 
on m.pecas_manutencao = p.id_peca join veiculo as v on m.veiculo_manutencao
= v.id_veiculo);
select * from tb_manutencao;

drop view if exists `tb_saidacliente`;
create view tb_saidacliente as(
select rota_viagem as `Viagem`, nome_filial as `Filial de Saída`, 
tipocliente as `Tipo de Cliente`, if (s.tipocliente_saida=1, 
nome_clientef, nome_clientej) as `Cliente`, concat(marca_veiculo, ' ',
modelo_veiculo) as `Veículo`,  date_format(`datahora_saida`, '%d/%m/%Y %H:%i:%s')
as `Data e Hora da Saída` from saida_veiculo as s join viagem as vi on
s.viagem_saida = vi.id_viagem join filial as f on s.filial_saida = f.id_filial
join tipo_cliente on tipocliente_saida = tipo_cliente.id_tipocliente join 
cliente_fisico as cf on cf.id_clientef = s.cliente_saida join cliente_juridico 
as cj on cj.id_clientej = s.cliente_saida join veiculo on veiculo.id_veiculo 
= s.veiculo_saida);
select * from tb_saidacliente;


drop view if exists `tb_saidamotor`;
create view tb_saidamotor as(
select rota_viagem as `Viagem`, nome_filial as `Filial de Saída`, 
nome_motorista as `Motorista`, concat(marca_veiculo, ' ',
modelo_veiculo) as `Veículo`,  date_format(`datahora_saida`, '%d/%m/%Y %H:%i:%s')
as `Data e Hora da Saída` from saida_veiculo as s join viagem as vi on
s.viagem_saida = vi.id_viagem join filial as f on s.filial_saida = f.id_filial
join motorista as m on s.motorista_saida = m.id_motorista join veiculo on 
veiculo.id_veiculo = s.veiculo_saida);
select * from tb_saidamotor;

drop view if exists `tb_entradacliente`;
create view tb_entradacliente as(
select rota_viagem as `Viagem`, nome_filial as `Filial de Saída`, 
tipocliente as `Tipo de Cliente`, if (e.tipocliente_entrada=1, 
nome_clientef, nome_clientej) as `Cliente`, concat(marca_veiculo, ' ',
modelo_veiculo) as `Veículo`,  date_format(`datahora_entrada`, '%d/%m/%Y %H:%i:%s')
as `Data e Hora da Saída` from entrada_veiculo as e join viagem as vi on
e.viagem_entrada = vi.id_viagem join filial as f on e.filial_entrada = f.id_filial
join tipo_cliente on tipocliente_entrada = tipo_cliente.id_tipocliente join 
cliente_fisico as cf on cf.id_clientef = e.cliente_entrada join cliente_juridico 
as cj on cj.id_clientej = e.cliente_entrada join veiculo on veiculo.id_veiculo 
= e.veiculo_entrada);
select * from tb_entradacliente;


drop view if exists `tb_entradamotor`;
create view tb_entradamotor as(
select rota_viagem as `Viagem`, nome_filial as `Filial de Saída`, 
nome_motorista as `Motorista`, concat(marca_veiculo, ' ',
modelo_veiculo) as `Veículo`,  date_format(`datahora_entrada`, '%d/%m/%Y %H:%i:%s')
as `Data e Hora da Saída` from entrada_veiculo as e join viagem as vi on
e.viagem_entrada = vi.id_viagem join filial as f on e.filial_entrada = f.id_filial
join motorista as m on e.motorista_entrada = m.id_motorista join veiculo on 
veiculo.id_veiculo = e.veiculo_entrada);
select * from tb_entradamotor;



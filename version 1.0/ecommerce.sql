Create database  if not exists Ecommerce;
use Ecommerce;
-- drop database Ecommerce;
-- criar tabela de clientes
-- drop table seller;
create table clients(
	idClient int auto_increment primary key,
    Fnome varchar(15) not null,
    Minit char(3),
    LName varchar(20) not null,
	CPF char(11) not null,
    Adress varchar(50) not null,
    constraint unique_cpf_client unique (CPF)
);

-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(30) not null,
    classfication_kids bool,
    category enum('eletrônico', 'vestuário', 'brinquedos', 'Alimentos') not null,
    rating float default 0,
    size varchar(10)
);
-- criar tabela pagamento
create table payments(
	idPayment int,
    idClient int,
    typePayment enum('Boleto', 'cartão', 'Dois cartões'),
    limitAvaliable float,
    primary key (idPayment, idClient)
);

-- criar tabela pedido
create table request(
	idRequest int auto_increment primary key,
    idClient int,
    status enum('Processando', 'cancelado', 'confirmado') default 'Processando',
    description varchar(255),
    freightage float default 10,
    paymentCash bool default false,
    idPayment int,
    constraint fk_request_client foreign key(idClient) references clients(idClient),
    constraint fk_request_Payment foreign key(idPayment, idClient) references payments(idPayment, idClient)
);

-- criar tabela estoque
create table productStorage(
	idProductStarage int primary key,
    location varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
drop table Supplier;
create table Supplier(
	idSupplier int primary key,
    CNPJ char(15) not null,
    socialName varchar(255) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
);
-- criar tabela vendedor
create table seller(
	idSeller int primary key,
    CNPJ char(15),
    CPF char(9),
    socialName varchar(255) not null,
    AbsName varchar(255),
    contact char(11) not null,
    Adress varchar(255),
    constraint unique_CPF_seller unique(CPF),
    constraint unique_CNPJ_seller unique(CNPJ)
);

-- criar relacionamento produto_vendedor

create table product_seller(
	idproduct int,
    idSeller int,
    quantity int default 1,
    primary key(idProduct, idSeller),
    constraint fk_product_seller foreign key(idSeller) references seller(idSeller),
    constraint fk_product_product foreign key(idProduct) references product(idProduct)
);

-- criar tabela de relacionamento produto_pedido
create table product_request(
	idProduct int,
    idRequest int,
    quantity int,
    status enum('Processando', 'cancelado', 'confirmado') default 'Processando',
    primary key(idProduct, idRequest),
    constraint fk_product_request foreign key(idProduct) references product(idProduct),
    constraint fk_request_product foreign key(idRequest) references request(idRequest)
);

-- criar tabela estoque
create table storage_location(
	idProduct int,
    idStorage int,
    location varchar(255) not null,
    primary key (idProduct, idStorage),
    constraint fk_storage_location_product foreign key(idProduct) references product(idProduct),
    constraint fk_storage_product foreign key(idStorage) references productStorage(idProductStarage)
);


-- criar tabela de relacionameto produto/fornecedor
create table productSupplier(
	idSupplier int,
    idProduct int,
    quantity int not null,
    primary key (idSupplier, idProduct),
    constraint fk_supplier_supplier foreign key(idSupplier) references Supplier(idSupplier),
    constraint fk_product_supplier foreign key(idProduct) references product(idProduct)
);


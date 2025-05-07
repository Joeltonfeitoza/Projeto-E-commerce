create database ecommerce;
use ecommerce;

create table client(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)
);

create table product(
    idProduct int auto_increment primary key,
    Pname varchar(255) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestuário','Brinquedos','Alimentos','Móveis') not null,
    avaliation float default 0,
    size varchar(10)
);

create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int,
    orderStatus enum('Em processamento','Enviado','Entregue') default 'Em processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references client(idClient)
);

create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível','Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product foreign key (idPOproduct) references product(idProduct),
    constraint fk_productorder_order foreign key (idPOorder) references orders(idOrder)
);

create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14) not null,
    contact varchar(11) not null,
    constraint unique_cnpj_seller unique (CNPJ)
);

create table productSeller(
    idPsProduct int,
    idPsSeller int,
    prodQuantity int default 1,
    primary key (idPsProduct, idPsSeller),
    constraint fk_productseller_product foreign key (idPsProduct) references product(idProduct),
    constraint fk_productseller_seller foreign key (idPsSeller) references seller(idSeller)
);

create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(14),
    contact varchar(11) not null,
    constraint unique_cnpj_supplier unique (CNPJ)
);

create table productSupplier(
    idPsProduct int,
    idPsSupplier int,
    quantity int default 1,
    primary key (idPsProduct, idPsSupplier),
    constraint fk_productsupplier_product foreign key (idPsProduct) references product(idProduct),
    constraint fk_productsupplier_supplier foreign key (idPsSupplier) references supplier(idSupplier)
);

create table storage(
    idStorage int auto_increment primary key,
    location varchar(255),
    capacity int
);

create table productStorage(
    idPsProduct int,
    idPsStorage int,
    quantity int default 0,
    primary key (idPsProduct, idPsStorage),
    constraint fk_productstorage_product foreign key (idPsProduct) references product(idProduct),
    constraint fk_productstorage_storage foreign key (idPsStorage) references storage(idStorage)
);

create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255),
    primary key (idLproduct, idLstorage),
    constraint fk_storagelocation_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storagelocation_storage foreign key (idLstorage) references storage(idStorage)
);

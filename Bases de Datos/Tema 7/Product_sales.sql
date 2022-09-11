-- create database
drop database sales;
create database sales;
use sales;

-- create tables
create table products (
    id                             int auto_increment primary key,
    name                           varchar(50),
    description                    varchar(4000),
    sku                            varchar(30),
    unit                           int,
    unit_price                     int
)
;

create table customers (
    id                             int auto_increment primary key,
    first_name                     varchar(255),
    last_name                      varchar(255),
    email                          varchar(255),
    city                           varchar(255),
    country                        varchar(50),
    gender                         varchar(30) constraint customers_gender_cc
                                   check (gender in ('MALE','FEMALE')),
    date_of_birth                  datetime,
    phone                          varchar(30),
    postal_code                    varchar(30)
)
;

create table channels (
    id                             int auto_increment primary key,
    name                           varchar(255) constraint channels_name_cc
                                   check (name in ('DIRECT','ONLINE','PHONE'))
)
;

create table promotions (
    id                             int auto_increment primary key,
    name                           varchar(255),
    code                           varchar(10),
    date_begin                     datetime,
    date_end                       datetime,
    discount_percentage            int
)
;

create table sales (
    product_id                     int,
    foreign key (product_id) references products(id) on delete cascade,
    customer_id                    int,
    foreign key (customer_id) references customers(id) on delete cascade,
    promotion_id                   int,
    foreign key (promotion_id) references promotions(id) on delete cascade,
    channel_id                     int,
    foreign key (channel_id) references channels(id) on delete cascade,
    date_of_sale                   datetime,
    quantity                       int,
    unit_price                     int
)
;

-- indexes
create index sales_i1 on sales (channel_id);
create index sales_i2 on sales (customer_id);
create index sales_i3 on sales (product_id);
create index sales_i4 on sales (promotion_id);

-- create views
create or replace view sales_v as 
select 
    products.name                                      product_name,
    products.description                               description,
    products.sku                                       sku,
    products.unit                                      unit,
    products.unit_price                                product_unit_price,
    customers.first_name                               first_name,
    customers.last_name                                last_name,
    customers.email                                    email,
    customers.city                                     city,
    customers.country                                  country,
    customers.gender                                   gender,
    customers.date_of_birth                            date_of_birth,
    customers.phone                                    phone,
    customers.postal_code                              postal_code,
    channels.name                                      channel_name,
    promotions.name                                    promotion_name,
    promotions.code                                    code,
    promotions.date_begin                              date_begin,
    promotions.date_end                                date_end,
    promotions.discount_percentage                     discount_percentage,
    sales.date_of_sale                                 date_of_sale,
    sales.quantity                                     quantity,
    sales.unit_price                                   sale_unit_price
from 
    products,
    customers,
    channels,
    promotions,
    sales
where
    sales.product_id = products.id and
    sales.customer_id = customers.id and
    sales.promotion_id = promotions.id and
    sales.channel_id = channels.id
;

-- load data
 
insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AABB-27',
    'Ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec. Donec convallis sollicitudin elementum. Nulla facilisi. In posuere blandit leoeget malesuada. Vivamus efficitur ipsum tellus, quis posuere mi maximus vitae. Quisque tortor odio, feugiat eget sagittisvel, pretium ut metus. Duis et commodo arcu, in vestibulum tellus. In sollicitudin nisi mi, pharetra gravida ex semper ut.Donec nibh sapien, hendrerit quis varius eget, malesuada vitae turpis. Lorem.',
    'Cursus Porttitor Tincidunt',
    55,
    93
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AAAK-10',
    'Vestibulum lacinia arcu in massa pharetra, id mattis risus rhoncus.Cras vulputate porttitor ligula. Nam semper diam suscipit elementum sodales. Proin sit amet massa eu lorem commodo ullamcorper.Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin.',
    'Ac Volutpat Risusphasellus',
    69,
    46
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AAA2-8',
    'Massa pharetra, id mattis risus rhoncus.Cras vulputate porttitor ligula. Nam semper diam suscipit elementum sodales. Proin sit amet massa eu lorem commodo ullamcorper.Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus.',
    'Cursus Porttitor Tincidunt',
    53,
    48
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AACZ-77',
    'Ullamcorper.Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex.',
    'Suscipit Elementum Sodales',
    9,
    86
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AAAF-5',
    'Id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsumprimis.',
    'Eu Lorem Commodo',
    73,
    52
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AABA-26',
    'Et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique.',
    'Risusphasellus Vitae Ligula',
    8,
    54
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AABL-37',
    'Iaculis aliquam. Vestibulum lacinia arcu in massa pharetra, id mattis risus rhoncus.Cras vulputate porttitor ligula. Nam semper diam suscipit elementum sodales. Proin sit amet massa eu lorem commodo ullamcorper.Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec. Donec convallis sollicitudin elementum. Nulla facilisi. In posuere blandit leoeget malesuada.',
    'In Massa Pharetra',
    92,
    89
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AADC-80',
    'Id mattis risus rhoncus.Cras vulputate porttitor ligula. Nam semper diam suscipit elementum sodales. Proin sit amet massa eu lorem commodo ullamcorper.Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut id nulla ac sapien suscipit tristique ac volutpat risus.Phasellus vitae ligula commodo, dictum lorem sit amet, imperdiet ex. Etiam cursus porttitor tincidunt. Vestibulum ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec. Donec convallis sollicitudin elementum. Nulla facilisi. In posuere blandit.',
    'Sit Amet Imperdiet',
    16,
    42
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AAAC-2',
    'Donec convallis sollicitudin elementum. Nulla facilisi.',
    'Sodales Proin Sit',
    56,
    87
);

insert into products (
    name,
    description,
    sku,
    unit,
    unit_price
) values (
    'M-AADQ-94',
    'Ante ipsumprimis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vulputate placerat pellentesque. Proin viverra lacinialectus, quis consectetur mi venenatis nec. Donec convallis sollicitudin elementum. Nulla facilisi. In posuere blandit.',
    'Faucibus Orci Luctus',
    90,
    76
);

commit;
-- load data
 
insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Gricelda',
    'Luebbers',
    'gricelda.luebbers@aaab.com',
    'Tanquecitos',
    'United States',
    'MALE',
    sysdate() - interval 99 day,
    'Pellentesque Proin Viverra',
    'Rhoncuscras Vulputate Porttito'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Dean',
    'Bollich',
    'dean.bollich@aaac.com',
    'Sugarloaf',
    'United States',
    'FEMALE',
    sysdate() - interval 4 day,
    'Mi Venenatis Nec',
    'Tincidunt Vestibulum Ante'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Milo',
    'Manoni',
    'milo.manoni@aaad.com',
    'Dale City',
    'United States',
    'MALE',
    sysdate() - interval 68 day,
    'Consectetur Mi Venenatis',
    'Suscipit Tristique Ac'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Laurice',
    'Karl',
    'laurice.karl@aaae.com',
    'Grosvenor',
    'United States',
    'FEMALE',
    sysdate() - interval 52 day,
    'Etiam Cursus Porttitor',
    'Risusphasellus Vitae Ligula'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'August',
    'Rupel',
    'august.rupel@aaaf.com',
    'Riverside',
    'United States',
    'MALE',
    sysdate() - interval 60 day,
    'Placerat Pellentesque Proin',
    'Placerat Pellentesque Proin'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Salome',
    'Guisti',
    'salome.guisti@aaag.com',
    'Ridgeley',
    'United States',
    'FEMALE',
    sysdate() - interval 31 day,
    'In Massa Pharetra',
    'Pellentesque Proin Viverra'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Lovie',
    'Ritacco',
    'lovie.ritacco@aaah.com',
    'Ashley Heights',
    'United States',
    'MALE',
    sysdate() - interval 47 day,
    'Luctus Et Ultrices',
    'Sollicitudin Elementum Nulla'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Chaya',
    'Greczkowski',
    'chaya.greczkowski@aaai.com',
    'Monfort Heights',
    'United States',
    'FEMALE',
    sysdate() - interval 11 day,
    'Massa Eu Lorem',
    'Id Nulla Ac'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Twila',
    'Coolbeth',
    'twila.coolbeth@aaaj.com',
    'Point Marion',
    'United States',
    'MALE',
    sysdate() - interval 20 day,
    'Ante Ipsumprimis In',
    'Nulla Ac Sapien'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Carlotta',
    'Achenbach',
    'carlotta.achenbach@aaak.com',
    'Eldon',
    'United States',
    'FEMALE',
    sysdate() - interval 59 day,
    'Nulla Placerat Iaculis',
    'Semper Diam Suscipit'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Jeraldine',
    'Audet',
    'jeraldine.audet@aaal.com',
    'Greendale',
    'United States',
    'MALE',
    sysdate() - interval 58 day,
    'Risus Rhoncuscras Vulputate',
    'Faucibus Ut Id'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'August',
    'Arouri',
    'august.arouri@aaam.com',
    'Ammon',
    'United States',
    'FEMALE',
    sysdate() - interval 76 day,
    'Diam Suscipit Elementum',
    'Convallis Sollicitudin Element'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Ward',
    'Stepney',
    'ward.stepney@aaan.com',
    'Wallsburg',
    'United States',
    'MALE',
    sysdate() - interval 27 day,
    'Diam Suscipit Elementum',
    'Quis Consectetur Mi'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Ayana',
    'Barkhurst',
    'ayana.barkhurst@aaao.com',
    'De Pue',
    'United States',
    'FEMALE',
    sysdate() - interval 12 day,
    'Sollicitudin Elementum Nulla',
    'Arcu In Massa'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Luana',
    'Berends',
    'luana.berends@aaap.com',
    'Prompton',
    'United States',
    'MALE',
    sysdate() - interval 78 day,
    'Vulputate Porttitor Ligula',
    'Risus Rhoncuscras Vulputate'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Lecia',
    'Alvino',
    'lecia.alvino@aaaq.com',
    'New Rockford',
    'United States',
    'FEMALE',
    sysdate() - interval 83 day,
    'Pharetra Id Mattis',
    'Et Ultrices Posuere'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Joleen',
    'Himmelmann',
    'joleen.himmelmann@aaar.com',
    'Tygh Valley',
    'United States',
    'MALE',
    sysdate() - interval 64 day,
    'Ipsum Primis In',
    'Fames Ac Ante'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Monty',
    'Kinnamon',
    'monty.kinnamon@aaas.com',
    'Lookout',
    'United States',
    'FEMALE',
    sysdate() - interval 19 day,
    'Id Mattis Risus',
    'Nam Semper Diam'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Dania',
    'Grizzard',
    'dania.grizzard@aaat.com',
    'Hermiston',
    'United States',
    'MALE',
    sysdate() - interval 48 day,
    'Et Ultrices Posuere',
    'Lacinialectus Quis Consectetur'
);

insert into customers (
    first_name,
    last_name,
    email,
    city,
    country,
    gender,
    date_of_birth,
    phone,
    postal_code
) values (
    'Inez',
    'Yamnitz',
    'inez.yamnitz@aaau.com',
    'Mendota Heights',
    'United States',
    'FEMALE',
    sysdate() - interval 84 day,
    'Mi Venenatis Nec',
    'Iaculis Aliquam Vestibulum'
);

commit;
-- load data
 
insert into channels (
    name
) values (
    'DIRECT'
);

insert into channels (
    name
) values (
    'ONLINE'
);

insert into channels (
    name
) values (
    'PHONE'
);

commit;
-- load data
 
insert into promotions (
    name,
    code,
    date_begin,
    date_end,
    discount_percentage
) values (
    'Mac Prevention',
    'Nam',
    sysdate() - interval 31 day,
    sysdate() - interval 14 day,
    39
);

insert into promotions (
    name,
    code,
    date_begin,
    date_end,
    discount_percentage
) values (
    'Personal Information Security Review',
    'Imperdiet',
    sysdate() - interval 6 day,
    sysdate() - interval 25 day,
    65
);

insert into promotions (
    name,
    code,
    date_begin,
    date_end,
    discount_percentage
) values (
    'Employee Automation',
    'Orci',
    sysdate() - interval 39 day,
    sysdate() - interval 39 day,
    31
);

insert into promotions (
    name,
    code,
    date_begin,
    date_end,
    discount_percentage
) values (
    'Deadlock Detection Review',
    'Ex',
    sysdate() - interval 6 day,
    sysdate() - interval 11 day,
    67
);

commit;
-- load data
 
insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 29 day,
    81,
    54
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 7 day,
    14,
    27
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 29 day,
    65,
    60
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 1 day,
    77,
    63
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 23 day,
    60,
    47
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 31 day,
    38,
    1
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 68 day,
    70,
    92
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 30 day,
    44,
    65
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 20 day,
    96,
    91
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 29 day,
    38,
    21
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 84 day,
    71,
    23
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 29 day,
    47,
    24
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 24 day,
    43,
    47
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 84 day,
    1,
    67
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 6 day,
    12,
    44
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 49 day,
    14,
    9
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 23 day,
    58,
    79
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 91 day,
    79,
    25
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 82 day,
    81,
    35
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 95 day,
    18,
    77
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 84 day,
    45,
    57
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 80 day,
    30,
    96
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 38 day,
    58,
    99
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 63 day,
    50,
    33
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 38 day,
    51,
    99
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 12 day,
    48,
    66
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 78 day,
    84,
    28
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 98 day,
    2,
    8
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 21 day,
    45,
    44
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 3 day,
    40,
    99
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 86 day,
    47,
    81
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 85 day,
    36,
    17
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 69 day,
    63,
    78
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 68 day,
    6,
    9
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 27 day,
    6,
    26
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 10 day,
    64,
    6
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 62 day,
    50,
    77
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 86 day,
    88,
    95
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 20 day,
    20,
    42
);

insert into sales (
    product_id,
    customer_id,
    promotion_id,
    channel_id,
    date_of_sale,
    quantity,
    unit_price
) values (
    1,
    1,
    1,
    1,
    sysdate() - interval 15 day,
    88,
    92
);

commit;

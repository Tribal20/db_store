drop procedure "p_add_new_user"
/

drop procedure "p_output_category"
/

drop procedure "p_search_product"
/

alter table "discount"
   drop constraint FK_DISCOUNT_REFERENCE_STORE
/

alter table "discount"
   drop constraint FK_DISCOUNT_REFERENCE_PRODUCT
/

alter table "order"
   drop constraint FK_ORDER_REFERENCE_PRODUCT
/

alter table "order"
   drop constraint FK_ORDER_REFERENCE_USERS
/

alter table "order"
   drop constraint FK_ORDER_REFERENCE_STORE
/

alter table "product"
   drop constraint FK_PRODUCT_REFERENCE_CATEGORY
/

alter table "rating"
   drop constraint FK_RATING_REFERENCE_USERS
/

alter table "rating"
   drop constraint FK_RATING_REFERENCE_PRODUCT
/

alter table "store"
   drop constraint FK_STORE_REFERENCE_CITY
/

alter table "unit_product"
   drop constraint FK_UNIT_PRO_REFERENCE_PRODUCT
/

alter table "unit_product"
   drop constraint FK_UNIT_PRO_REFERENCE_STORE
/

alter table "unit_product"
   drop constraint FK_UNIT_PRO_REFERENCE_STATUS
/

drop table "category" cascade constraints
/

drop table "city" cascade constraints
/

drop table "discount" cascade constraints
/

drop table "order" cascade constraints
/

drop table "product" cascade constraints
/

drop table "rating" cascade constraints
/

drop table "status" cascade constraints
/

drop table "store" cascade constraints
/

drop table "unit_product" cascade constraints
/

drop table "users" cascade constraints
/

/*==============================================================*/
/* Table: "category"                                            */
/*==============================================================*/
create table "category" 
(
   "id_category"        INTEGER              not null,
   "name_category"      VARCHAR2(4000 BYTE),
   "id_parent_category" INTEGER,
   "add_date"           DATE,
   "order_by_category"  INTEGER,
   "is_delete"          INTEGER,
   constraint PK_CATEGORY primary key ("id_category")
)
/

/*==============================================================*/
/* Table: "city"                                                */
/*==============================================================*/
create table "city" 
(
   "id_city"            INTEGER              not null,
   "name_city"          VARCHAR2(4000 BYTE),
   "coeff_city"         NUMBER,
   constraint PK_CITY primary key ("id_city")
)
/

/*==============================================================*/
/* Table: "discount"                                            */
/*==============================================================*/
create table "discount" 
(
   "id_discount"        INTEGER              not null,
   "id_store"           INTEGER,
   "id_product"         INTEGER,
   "discount"           NUMBER,
   "add_date"           DATE,
   "date_start"         DATE,
   "date_end"           DATE,
   constraint PK_DISCOUNT primary key ("id_discount")
)
/

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table "order" 
(
   "id_order"           INTEGER              not null,
   "id_user"            INTEGER,
   "id_store"           INTEGER,
   "id_product"         INTEGER,
   "sum_order"          NUMBER,
   "add_date"           DATE,
   constraint PK_ORDER primary key ("id_order")
)
/

/*==============================================================*/
/* Table: "product"                                             */
/*==============================================================*/
create table "product" 
(
   "id_product"         INTEGER              not null,
   "name_product"       VARCHAR2(4000 BYTE),
   "id_category"        INTEGER,
   "info_product"       VARCHAR2(4000 BYTE),
   "price_product"      NUMBER,
   "coeff_product"      NUMBER,
   "add_date"           DATE,
   "is_delete"          INTEGER,
   constraint PK_PRODUCT primary key ("id_product")
)
/

/*==============================================================*/
/* Table: "rating"                                              */
/*==============================================================*/
create table "rating" 
(
   "id_rating"          INTEGER              not null,
   "id_user"            INTEGER,
   "id_product"         INTEGER,
   "value_rating"       NUMBER,
   "comment_rating"     VARCHAR2(4000 BYTE),
   "add_date"           DATE,
   constraint PK_RATING primary key ("id_rating")
)
/

/*==============================================================*/
/* Table: "status"                                              */
/*==============================================================*/
create table "status" 
(
   "id_status"          INTEGER              not null,
   "name_status"        VARCHAR2(4000 BYTE),
   constraint PK_STATUS primary key ("id_status")
)
/

/*==============================================================*/
/* Table: "store"                                               */
/*==============================================================*/
create table "store" 
(
   "id_store"           INTEGER              not null,
   "name_store"         VARCHAR2(4000 BYTE),
   "id_city"            INTEGER,
   "adress_store"       VARCHAR2(4000 BYTE),
   constraint PK_STORE primary key ("id_store")
)
/

/*==============================================================*/
/* Table: "unit_product"                                        */
/*==============================================================*/
create table "unit_product" 
(
   "id_unit_product"    INTEGER              not null,
   "id_product"         INTEGER,
   "id_store"           INTEGER,
   "id_status"          INTEGER,
   constraint PK_UNIT_PRODUCT primary key ("id_unit_product")
)
/

/*==============================================================*/
/* Table: "users"                                               */
/*==============================================================*/
create table "users" 
(
   "id_user"            INTEGER              not null,
   "name_user"          VARCHAR2(4000 BYTE),
   "patroname_user"     VARCHAR2(4000 BYTE),
   "surname_user"       VARCHAR2(4000 BYTE),
   "login_user"         VARCHAR2(4000 BYTE),
   "pass_user"          VARCHAR2(4000 BYTE),
   "email_user"         VARCHAR2(4000 BYTE),
   "date_reg_user"      DATE,
   "date_birth_user"    DATE,
   "loyalty_user"       INTEGER,
   "phone_user"         VARCHAR2(4000 BYTE),
   constraint PK_USERS primary key ("id_user")
)
/

alter table "discount"
   add constraint FK_DISCOUNT_REFERENCE_STORE foreign key ("id_store")
      references "store" ("id_store")
/

alter table "discount"
   add constraint FK_DISCOUNT_REFERENCE_PRODUCT foreign key ("id_product")
      references "product" ("id_product")
/

alter table "order"
   add constraint FK_ORDER_REFERENCE_PRODUCT foreign key ("id_product")
      references "product" ("id_product")
/

alter table "order"
   add constraint FK_ORDER_REFERENCE_USERS foreign key ("id_user")
      references "users" ("id_user")
/

alter table "order"
   add constraint FK_ORDER_REFERENCE_STORE foreign key ("id_store")
      references "store" ("id_store")
/

alter table "product"
   add constraint FK_PRODUCT_REFERENCE_CATEGORY foreign key ("id_category")
      references "category" ("id_category")
/

alter table "rating"
   add constraint FK_RATING_REFERENCE_USERS foreign key ("id_user")
      references "users" ("id_user")
/

alter table "rating"
   add constraint FK_RATING_REFERENCE_PRODUCT foreign key ("id_product")
      references "product" ("id_product")
/

alter table "store"
   add constraint FK_STORE_REFERENCE_CITY foreign key ("id_city")
      references "city" ("id_city")
/

alter table "unit_product"
   add constraint FK_UNIT_PRO_REFERENCE_PRODUCT foreign key ("id_product")
      references "product" ("id_product")
/

alter table "unit_product"
   add constraint FK_UNIT_PRO_REFERENCE_STORE foreign key ("id_store")
      references "store" ("id_store")
/

alter table "unit_product"
   add constraint FK_UNIT_PRO_REFERENCE_STATUS foreign key ("id_status")
      references "status" ("id_status")
/


create or replace procedure registration (
                                          in_name_user IN varchar2,
                                          in_patroname_user IN varchar2,
                                          in_surname_user IN varchar2,
                                          in_login_user IN varchar2,
                                          in_pass_user IN VARCHAR2,
                                          in_email_user IN varchar2,
                                          in_date_birth_user IN DATE,
                                          in_phone_user IN INTEGER,
                                          out_id_user OUT INTEGER)
                                          
IS

l_id_user INTEGER;

begin

insert into users (name_user, patroname_user, surname_user, login_user, pass_user, email_user, date_reg_user, date_birth_user)
values (in_name_user, in_patroname_user, in_surname_user, in_login_user, in_pass_user, in_email_user, SYSDATE, in_date_birth_user)
returning id_user into l_id_user;
out_id_user := l_id_user;
end;
/


create or replace procedure output_category(refcur out sys_refcursor)
IS
begin

 Open refcur for
Select *
From category
START with id_category in (SELECT id_category
FROM category)
connect by prior id_parent_category = id_category
ORDER BY order_by_category ;

close refcur;
end;
/


create or replace procedure search (in_string IN varchar2, in_city IN INTEGER, refcur  out sys_refcursor)
IS

begin
open refcur for
SELECT pro.name_product, pro.info_product, pro.price_product*pro.coeff_product*c.coeff_city as price, s.name_store, count(*) cnt
FROM category cat
JOIN product pro ON cat.id_category = pro.id_category
JOIN unit_product up ON up.id_product = pro.id_product
JOIN store s ON s.id_store = up.id_store
JOIN city c ON c.id_city = s.id_city
             AND s.id_city = in_city
JOIN status stat ON up.id_status = stat.id_status
                    AND id_status not in( 'Зарезервирован', 'Продан')             
WHERE trim(lower(cat.name_category)) LIke trim(lower(in_string)) Or
      trim(lower(pro.name_product)) LIke trim(lower(in_string))
group by pro.name_product, pro.info_product, pro.price_product*pro.coeff_product*c.coeff_city, s.name_store;

close refcur;

end;
/


CREATE TABLE user_account(
    id bigint primary key  auto_increment,
    email varchar(255) UNIQUE not null,
    password_hash varchar(255) not null,
    created_at datetime NOT NULL,
    update_at datetime NOT NULL
);
CREATE TABLE item (
    id bigint primary key  auto_increment,
    title varchar(255) not null,
    notes text,
    seller_id bigint,
    price_in_cents integer,
    created_at datetime NOT NULL,
    update_at datetime NOT NULL,
    FOREIGN key(seller_id) REFERENCES user_account(id) on delete cascade
);

CREATE TABLE purchase(
    id bigint primary key  auto_increment,
    buyer_id bigint,
    item_id bigint,
    price_in_cents integer,
    title varchar(255) not null,
    created_at datetime NOT NULL,
    update_at datetime NOT NULL,
    FOREIGN key(buyer_id) REFERENCES user_account(id),
    FOREIGN key(item_id) REFERENCES item(id)
);

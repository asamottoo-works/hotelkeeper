CREATE SCHEMA users;

-- システム登録に必要なユーザーの一意情報及びAuthに関わるデータを集める。
-- ユーザー自身に付随する情報(実名/住所等)はuser_informationsに纏める
CREATE TABLE users.users (
    id SERIAL NOT NULL PRIMARY KEY,
    email varchar(1024) NOT NULL UNIQUE,
    password char(60) NOT NULL,
    created_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE users.user_informations (
    user_id SERIAL REFERENCES users.users(id),
    fullname varchar(1024) NOT NULL,
    nickname varchar(1024) DEFAULT NULL,
    address varchar(1024) NOT NULL,
    created_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_user SERIAL REFERENCES users.users(id),
    updated_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_user SERIAL REFERENCES users.users(id)
);

CREATE TABLE users.deleted_users (
    user_id SERIAL REFERENCES users.users(id),
    created_datetime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_user SERIAL REFERENCES users.users(id)
);

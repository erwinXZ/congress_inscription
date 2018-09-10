CREATE TABLE roles
(
    id serial NOT NULL,
    name character varying(30) NOT NULL,
    status character DEFAULT 'A', --A:active,I:Inactive
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone,
    created_by integer NOT NULL,
    modified_by integer,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id serial NOT NULL,
    document character varying(30) NOT NULL,
    firstname character varying(60) NOT NULL,
    lastname character varying(60) NOT NULL,
    username character varying(30) NOT NULL,
    password character varying(60) NOT NULL,
    email character varying(60),
    address character varying(60),
    mobile character varying(15),
    phone character varying(15),
    last_access timestamp without time zone,
    last_ip character varying(15),
    last_change_password timestamp without time zone,
    remember_token character varying(100),
    status character DEFAULT 'A', --A:active,I:Inactive
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone,
    created_by integer NOT NULL,
    modified_by integer,
    role_id integer NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE participants (
    id serial,
    name character varying(180) NOT NULL,
    document character varying(15) NOT NULL,
    email character varying(90) NOT NULL,
    mobile numeric(8,0),
    city character varying(60),
    country character varying(30),
    occupation character varying(180),
    university character varying(180),
    career character varying(180),
    type character DEFAULT 'P',
    printed character DEFAULT 'N',
    status character DEFAULT 'A',
    created timestamp without time zone NOT NULL,
    modified timestamp without time zone,
    created_by integer NOT NULL,
    modified_by integer,
    PRIMARY KEY (id)
);

CREATE TABLE logs_accesses
(
    id serial NOT NULL,
    ip varchar(15) NOT NULL,
    income_date timestamp NOT NULL,
    departure_date timestamp,
    additional_data text,
    user_id integer NOT NULL REFERENCES users(id),
    PRIMARY KEY (id)
);


INSERT INTO roles (id, name, created, created_by)
VALUES (1, 'Administrador', NOW(), 1);
INSERT INTO roles (id, name, created, created_by)
VALUES (2, 'Credenciales', NOW(), 1);


INSERT INTO users(document, firstname, lastname, username, password, email, address, mobile, phone, status,
    created, created_by, role_id)
VALUES('12517815', 'Erwin', 'Mendez', 'admin', '$2y$10$6uoyuCVNIjwxtKxnICtc6ObCRzy/Hi6srCQkMA3PBg0BFoG3IS53u', 'erwinXYZ1@gmail.com', 'Junin 71', 78695140, '46440980', 'A', now(), 0, 1)
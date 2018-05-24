------------------------------
-- Archivo de base de datos --
------------------------------
DROP TABLE IF EXISTS usuarios CASCADE;
CREATE TABLE usuarios (
    id         BIGSERIAL     PRIMARY KEY
  , dni        VARCHAR(9)    NOT NULL UNIQUE
  , nombre     VARCHAR(255)  NOT NULL
  , password   varchar(255)  NOT NULL
);

DROP TABLE IF EXISTS reservas CASCADE;
CREATE TABLE reservas (
    id         BIGSERIAL    PRIMARY KEY
  , instante   timestamp(0) NOT NULL
  , usuario_id bigint       NOT NULL REFERENCES usuarios (id)
                              ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO usuarios (dni, nombre, password) VALUES
    ('20073539J','Manuel Alejandro', crypt('manu', gen_salt('bf',11)))
  , ('40123212E','Rocio', crypt('rocio', gen_salt('bf',11)))
  , ('40123212F','Pepe', crypt('pepe', gen_salt('bf',11)))
;

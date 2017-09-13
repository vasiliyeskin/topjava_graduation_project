DROP TABLE users IF EXISTS;
DROP TABLE restaurants IF EXISTS;
DROP TABLE dishes IF EXISTS;
DROP TABLE votes IF EXISTS;

CREATE SEQUENCE GLOBAL_SEQ AS INTEGER START WITH 100000;

CREATE TABLE users
(
  id               INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
  firstname        VARCHAR(255)            NOT NULL,
  lasttname        VARCHAR(255)            NOT NULL,
  email            VARCHAR(255)            NOT NULL,
  password         VARCHAR(255)            NOT NULL,
  registered       TIMESTAMP DEFAULT now() NOT NULL,
  active           BOOLEAN DEFAULT TRUE    NOT NULL
);
CREATE UNIQUE INDEX users_unique_email_idx ON USERS (email);

CREATE TABLE user_roles
(
  user_id INTEGER NOT NULL,
  role    VARCHAR(255),
  CONSTRAINT user_roles_idx UNIQUE (user_id, role),
  FOREIGN KEY (user_id) REFERENCES USERS (id) ON DELETE CASCADE
);

CREATE TABLE restaurants
(
  id               INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
  title            VARCHAR(255)            NOT NULL,
  address          VARCHAR(255)            NOT NULL,
  email            VARCHAR(255)            NOT NULL,
  site             VARCHAR(255)            NOT NULL
);
CREATE UNIQUE INDEX restaurants_unique_email_idx ON restaurants (email);

CREATE TABLE dishes
(
  id               INTEGER GENERATED BY DEFAULT AS SEQUENCE GLOBAL_SEQ PRIMARY KEY,
  name             VARCHAR(255)            NOT NULL,
  datelunch        DATE                    NOT NULL,
  price            INTEGER                 NOT NULL,
  FOREIGN KEY      (restaurant_id) REFERENCES restaurants (id) ON DELETE CASCADE
);

CREATE TABLE votes
(
  datelunch        DATE  DEFAULT now()     NOT NULL,
  user_id          INTEGER                 NOT NULL,
  restaurant_id    INTEGER                 NOT NULL
)
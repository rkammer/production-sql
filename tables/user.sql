CREATE TABLE user(
    user_name            VARCHAR(50)  NOT NULL,
    email                VARCHAR(100) NOT NULL,
    first_name           VARCHAR(50)  NOT NULL,
    middle_name          VARCHAR(50),
    last_name            VARCHAR(50)  NOT NULL,
    suffix               VARCHAR(50),
    address              VARCHAR(100),
    city                 VARCHAR(100),
    state_code           CHAR(2),
    phone                VARCHAR(20),
    website              VARCHAR(100),
    picture_path         VARCHAR(120),
    created              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_user_user_name PRIMARY KEY (user_name),
    CONSTRAINT uc_user_email     UNIQUE (email),
    CONSTRAINT fk_user_state     FOREIGN KEY (state_code) REFERENCES state (CODE)
) ENGINE = InnoDB;
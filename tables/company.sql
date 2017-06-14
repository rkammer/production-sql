CREATE TABLE company(
    id         INTEGER     NOT NULL AUTO_INCREMENT,
    name       VARCHAR(50) NOT NULL,
    logo_path  VARCHAR(120),
    created    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(30),
    updated    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by VARCHAR(30),
    status     VARCHAR(30),
    CONSTRAINT pk_company_id PRIMARY KEY (id)
);
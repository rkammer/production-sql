CREATE TABLE company_contact(
    company_id           INTEGER,
    contact_id           INTEGER,
    created              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    created_by           VARCHAR(30),
    updated              TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_by           VARCHAR(30),
    status               VARCHAR(30),
    CONSTRAINT pk_company_contact PRIMARY KEY (company_id, contact_id),
    CONSTRAINT fk_company_contact_company FOREIGN KEY (company_id) REFERENCES company (id),
    CONSTRAINT fk_company_contact_contact FOREIGN KEY (contact_id) REFERENCES contact (id)
);
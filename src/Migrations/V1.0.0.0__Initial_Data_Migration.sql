CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL,
    CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId")
);

CREATE TABLE "Contacts" (
    "Id" uuid NOT NULL,
    "Title" text NULL,
    "FullName" text NULL,
    "Address" text NULL,
    "City" text NULL,
    "State" text NULL,
    "PostalCode" text NULL,
    "Country" text NULL,
    "PhoneNumber" text NULL,
    "Email" text NULL,
    CONSTRAINT "PK_Contacts" PRIMARY KEY ("Id")
);

CREATE TABLE "Accounts" (
    "Id" uuid NOT NULL,
    "UserId" uuid NOT NULL,
    "Name" text NULL,
    "AccountStatus" integer NOT NULL,
    "AccountClassification" integer NOT NULL,
    "CreatedDate" timestamp NOT NULL,
    "PrimaryContactId" uuid NOT NULL,
    "BillingContactId" uuid NULL,
    "OperationsContactId" uuid NULL,
    "SecurityContactId" uuid NULL,
    CONSTRAINT "PK_Accounts" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_Accounts_Contacts_BillingContactId" FOREIGN KEY ("BillingContactId") REFERENCES "Contacts" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Accounts_Contacts_OperationsContactId" FOREIGN KEY ("OperationsContactId") REFERENCES "Contacts" ("Id") ON DELETE RESTRICT,
    CONSTRAINT "FK_Accounts_Contacts_PrimaryContactId" FOREIGN KEY ("PrimaryContactId") REFERENCES "Contacts" ("Id") ON DELETE CASCADE,
    CONSTRAINT "FK_Accounts_Contacts_SecurityContactId" FOREIGN KEY ("SecurityContactId") REFERENCES "Contacts" ("Id") ON DELETE RESTRICT
);

CREATE INDEX "IX_Accounts_BillingContactId" ON "Accounts" ("BillingContactId");

CREATE INDEX "IX_Accounts_OperationsContactId" ON "Accounts" ("OperationsContactId");

CREATE INDEX "IX_Accounts_PrimaryContactId" ON "Accounts" ("PrimaryContactId");

CREATE INDEX "IX_Accounts_SecurityContactId" ON "Accounts" ("SecurityContactId");

INSERT INTO "__EFMigrationsHistory" ("MigrationId", "ProductVersion")
VALUES ('20180912195118_CombinedInitialMigration', '2.1.2-rtm-30932');


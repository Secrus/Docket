CREATE TABLE guilds ();
CREATE TABLE scripts ();
CREATE TABLE _migrations ();
ALTER TABLE guilds ADD COLUMN guild_id NUMERIC;
ALTER TABLE guilds ADD COLUMN log_channel NUMERIC;
ALTER TABLE scripts ADD COLUMN name TEXT;
ALTER TABLE scripts ADD COLUMN guild_id NUMERIC;
ALTER TABLE scripts ADD COLUMN script_type SMALLINT;
ALTER TABLE scripts ADD COLUMN code TEXT;
ALTER TABLE _migrations ADD COLUMN id_ INTEGER;
ALTER TABLE guilds ALTER COLUMN guild_id SET NOT NULL;
ALTER TABLE scripts ALTER COLUMN name SET NOT NULL;
ALTER TABLE scripts ALTER COLUMN guild_id SET NOT NULL;
ALTER TABLE scripts ALTER COLUMN script_type SET NOT NULL;
ALTER TABLE scripts ALTER COLUMN code SET NOT NULL;
ALTER TABLE _migrations ALTER COLUMN id_ SET NOT NULL;
CREATE INDEX _hash_index_scripts__script_type ON scripts USING HASH ( ( script_type ) );
ALTER TABLE guilds ADD CONSTRAINT _guilds_guild_id_primary_key PRIMARY KEY ( guild_id );
ALTER TABLE scripts ADD CONSTRAINT _scripts_name_guild_id_primary_key PRIMARY KEY ( name , guild_id );
ALTER TABLE _migrations ADD CONSTRAINT __migrations_id__primary_key PRIMARY KEY ( id_ );
ALTER TABLE scripts ADD CONSTRAINT guild_fq FOREIGN KEY ( guild_id ) REFERENCES guilds ( guild_id ) MATCH SIMPLE ON DELETE CASCADE ON UPDATE CASCADE;
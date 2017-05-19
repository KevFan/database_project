-- Create tournaments table
CREATE TABLE ygo_tournaments
(
	tourn_id NUMBER(3,0) CONSTRAINT tournaments_tournamnent_id_pk PRIMARY KEY,
	tourn_name VARCHAR2(100) CONSTRAINT tourn_name_nn NOT NULL,
	tourn_date DATE DEFAULT SYSDATE,
	location VARCHAR2(100) CONSTRAINT location_nn NOT NULL,
	entry_fee NUMBER(4,2) 
);


-- Creates spell_types table
CREATE TABLE ygo_spell_types
(
	spell_type_id NUMBER(3,0) CONSTRAINT spell_types_spell_type_id_pk PRIMARY KEY, 
	spell_type_name VARCHAR2(30) CONSTRAINT spell_type_name_nn NOT NULL,
	CONSTRAINT spell_types_name_uk UNIQUE (spell_type_name) 
);

-- Creates trap_types table
CREATE TABLE ygo_trap_types
(
	trap_type_id NUMBER(3,0) CONSTRAINT trap_types_trap_type_id_pk PRIMARY KEY,
	trap_type_name VARCHAR2(30) CONSTRAINT trap_type_name_nn NOT NULL,
	CONSTRAINT trap_types_name_uk UNIQUE (trap_type_name)
);

-- Creates monster_categorys table
CREATE TABLE ygo_monster_categorys
(
	m_cate_id NUMBER(3,0) CONSTRAINT monster_categorys_mate_id_pk PRIMARY KEY,
	m_cate_name VARCHAR2(30) CONSTRAINT m_cate_name_nn NOT NULL,
	CONSTRAINT monster_categorys_name_uk UNIQUE (m_cate_name)
);

-- Creates monster_attributes table
CREATE TABLE ygo_monster_attributes
(
	m_att_id NUMBER(3,0) CONSTRAINT monster_attributes_m_att_id_pk PRIMARY KEY,
	m_att_name VARCHAR2(30) CONSTRAINT m_att_name_nn NOT NULL,
	CONSTRAINT monster_attributes_name_uk UNIQUE (m_att_name)
);

-- Creates monster_types table
CREATE TABLE ygo_monster_types
(
	m_type_id NUMBER(3,0) CONSTRAINT monster_types_m_type_id_pk PRIMARY KEY,
	m_type_name VARCHAR2(30) CONSTRAINT m_type_name_nn NOT NULL,
	CONSTRAINT monster_types_name_uk UNIQUE (m_type_name)
);

-- Creates main_decks table
CREATE TABLE ygo_main_decks
(
	main_deck_id NUMBER(3,0) CONSTRAINT main_decks_main_deck_id_pk PRIMARY KEY
);

-- Creates extra_decks table
CREATE TABLE ygo_extra_decks
(
	extra_deck_id NUMBER(3,0) CONSTRAINT extra_decks_extra_deck_id_pk PRIMARY KEY
);

-- Creates side_decks table
CREATE TABLE ygo_side_decks
(
	side_deck_id NUMBER(3,0) CONSTRAINT side_decks_side_deck_id_pk PRIMARY KEY
);

-- Creates deck_lists table
CREATE TABLE ygo_deck_lists
(
	list_id NUMBER(3,0) CONSTRAINT deck_lists_list_id_pk PRIMARY KEY,
	list_name VARCHAR2 (50),
	main_deck_id NUMBER(3,0) CONSTRAINT dl_main_deck_id_nn NOT NULL,
	extra_deck_id NUMBER(3,0) CONSTRAINT extra_decks_extra_deck_id_fk REFERENCES ygo_extra_decks(extra_deck_id) ON DELETE SET NULL,
	side_deck_id NUMBER(3,0) CONSTRAINT side_decks_side_deck_id_fk REFERENCES ygo_side_decks(side_deck_id) ON DELETE SET NULL,
	CONSTRAINT deck_lists_decks_uk UNIQUE (main_deck_id, extra_deck_id, side_deck_id),
	CONSTRAINT main_decks_main_deck_id_fk FOREIGN KEY (main_deck_id) REFERENCES ygo_main_decks(main_deck_id)
);

-- Creates players table
CREATE TABLE ygo_players
(
	player_id NUMBER(3,0) CONSTRAINT players_player_id_pk PRIMARY KEY,
	first_name VARCHAR(30) CONSTRAINT first_name_nn NOT NULL,
	last_name VARCHAR(30) CONSTRAINT last_name_nn NOT NULL,
	list_id NUMBER(3,0) CONSTRAINT list_id_nn NOT NULL,
	CONSTRAINT deck_lists_list_id_fk FOREIGN KEY (list_id) REFERENCES ygo_deck_lists(list_id),
	CONSTRAINT players_list_id_uk UNIQUE (list_id)
);

--Create player_listing table
CREATE TABLE ygo_player_listings
(
	tourn_id NUMBER(3,0) CONSTRAINT player_listing_tourn_id_fk REFERENCES ygo_tournaments(tourn_id) ON DELETE CASCADE,
	player_id NUMBER(3,0) CONSTRAINT player_listing_player_id_fk REFERENCES ygo_players(player_id) ON DELETE CASCADE,
	CONSTRAINT player_listing_pk PRIMARY KEY (tourn_id, player_id)
);

-- Create single cards table
CREATE TABLE ygo_cards
(
	card_id NUMBER(8,0) CONSTRAINT cards_card_id_pk PRIMARY KEY,
	card_name VARCHAR2(50) CONSTRAINT card_name_nn NOT NULL,
	card_description VARCHAR2(800) CONSTRAINT card_description_nn NOT NULL,
	card_type VARCHAR2(10) CONSTRAINT card_type_nn NOT NULL,
	legality NUMBER(1) CONSTRAINT card_legality_nn NOT NULL,
	spell_type_id NUMBER(3,0) CONSTRAINT spells_spell_type_id_fk REFERENCES ygo_spell_types(spell_type_id),
	trap_type_id NUMBER(3,0) CONSTRAINT traps_trap_type_id_fk REFERENCES ygo_trap_types(trap_type_id),
	attack NUMBER(4,0),
	defense NUMBER(4,0),
	is_effect NUMBER(1,0) CONSTRAINT monster_is_effect_ck CHECK (is_effect = 1 OR is_effect = 0),
	m_level NUMBER(2,0) CONSTRAINT monster_level_ck CHECK (m_level <= 12 AND m_level > 0),
	m_att_id NUMBER(3,0) CONSTRAINT monsters_m_att_id_fk REFERENCES ygo_monster_attributes(m_att_id),
	m_cate_id NUMBER(3,0) CONSTRAINT monsters_m_cate_id_fk REFERENCES ygo_monster_categorys(m_cate_id),
	m_type_id NUMBER(3,0) CONSTRAINT monsters_m_type_id_fk REFERENCES ygo_monster_types(m_type_id),
	CONSTRAINT cards_name_uk UNIQUE (card_name),
	CONSTRAINT cards_legality_ck CHECK (legality <= 3 AND legality >= 0),
	CONSTRAINT card_type_ck CHECK 
	(
		(card_type = 'monster' AND attack IS NOT NULL AND defense IS NOT NULL AND is_effect IS NOT NULL 
			AND m_level IS NOT NULL AND m_att_id IS NOT NULL AND m_cate_id IS NOT NULL AND m_type_id IS NOT NULL)
		OR 
		(card_type = 'spell' AND spell_type_id IS NOT NULL)
		OR 
		(card_type = 'trap' AND trap_type_id IS NOT NULL)
	)
);

-- Creates main_cards table
CREATE TABLE ygo_main_cards
(
	main_deck_id NUMBER(3,0) CONSTRAINT main_cards_main_deck_id_fk REFERENCES ygo_main_decks(main_deck_id) ON DELETE CASCADE,
	card_id NUMBER(8,0) CONSTRAINT main_cards_card_id_fk REFERENCES ygo_cards(card_id) ON DELETE CASCADE,
	no_of_copies NUMBER(1,0) CONSTRAINT main_cards_copies_nn NOT NULL,
	CONSTRAINT main_cards_main_card_pk PRIMARY KEY (main_deck_id, card_id),
	CONSTRAINT main_cards_copies_ck CHECK (no_of_copies <= 3 AND no_of_copies > 0)
);

-- Creates extra_cards table
CREATE TABLE ygo_extra_cards
(
	extra_deck_id NUMBER(3,0) CONSTRAINT extra_cards_extra_deck_id_fk REFERENCES ygo_extra_decks(extra_deck_id) ON DELETE CASCADE,
	card_id NUMBER(8,0) CONSTRAINT side_cards_card_id_fk REFERENCES ygo_cards(card_id) ON DELETE CASCADE,
	no_of_copies NUMBER(1,0) CONSTRAINT extra_cards_copies_nn NOT NULL,
	CONSTRAINT extra_cards_extra_card_pk PRIMARY KEY (extra_deck_id, card_id),
	CONSTRAINT extra_cards_copies_ck CHECK (no_of_copies <= 3 AND no_of_copies > 0)
);

-- Creates side_cards table
CREATE TABLE ygo_side_cards
(
	side_deck_id NUMBER(3,0) CONSTRAINT side_cards_side_deck_id_fk  REFERENCES ygo_side_decks(side_deck_id) ON DELETE CASCADE,
	card_id NUMBER(8,0) CONSTRAINT cards_card_id_fk REFERENCES ygo_cards(card_id) ON DELETE CASCADE,
	no_of_copies NUMBER(1,0) CONSTRAINT side_cards_copies_nn NOT NULL, 
	CONSTRAINT side_cards_side_card_pk PRIMARY KEY (side_deck_id, card_id),
	CONSTRAINT side_cards_copies_ck CHECK (no_of_copies <= 3 AND no_of_copies > 0)
);


-- Sequnce for auto incrementing tournament id
CREATE SEQUENCE ygo_tournaments_seq
  START WITH 1;

-- Sequnce for auto incrementing player id
CREATE SEQUENCE ygo_players_seq
  START WITH 1;

-- Sequnce for auto incrementing card id
CREATE SEQUENCE ygo_cards_seq
  START WITH 1;


-- Trigger for that use's next number from associated sequence for tourn_id
CREATE OR REPLACE TRIGGER tournaments_on_insert
  before insert on YGO_TOURNAMENTS
  for each row  
begin   
  if :new.tourn_id is null then 
    select ygo_tournaments_seq.nextval into :new.tourn_id from dual; 
  end if; 
end; 
/


-- Trigger for that use's next number from associated sequence for player_id
CREATE OR REPLACE TRIGGER players_on_insert
  before insert on YGO_players
  for each row  
begin   
  if :new.player_id is null then 
    select ygo_players_seq.nextval into :new.player_id from dual; 
  end if; 
end; 
/


-- Trigger for that use's next number from associated sequence for card_id
CREATE OR REPLACE TRIGGER cards_on_insert
  before insert on ygo_cards
  for each row  
begin   
  if :new.card_id is null then 
    select ygo_cards_seq.nextval into :new.card_id from dual; 
  end if; 
end; 
/


-- Trigger determining if the no of copies for a card exceeds the legality (i.e. can only have 1, 2 or not at all) before inserting in main_card 
CREATE OR REPLACE TRIGGER main_card_legality_b_insert 
BEFORE INSERT OR UPDATE ON ygo_main_cards
REFERENCING NEW AS New
FOR EACH ROW
DECLARE
  max_copies NUMBER(1);
BEGIN
  SELECT legality INTO max_copies
  FROM ygo_cards
  WHERE card_id = :new.card_id;

   IF :new.no_of_copies > max_copies AND max_copies = 0 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS FORBIDDEN AND BANNED. THIS CARD CANT BE PLAYED IN GAMES');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 1 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS LIMITED. ONLY 1 COPY CAN BE IN A DECK');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 2 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS SEMI-LIMITED. ONLY 2 COPY CAN BE IN A DECK');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 3 THEN
       RAISE_APPLICATION_ERROR(-20000,'MAX COPIES ALLOWED IS 3. PLEASE RECHECK STATEMENT');
  END IF;
END;
/


-- Trigger determining if the no of copies for a card exceeds the legality (i.e. can only have 1, 2 or not at all) before inserting in extra_card 
CREATE OR REPLACE TRIGGER extra_card_legality_b_insert 
BEFORE INSERT OR UPDATE ON ygo_extra_cards
REFERENCING NEW AS New
FOR EACH ROW
DECLARE
  max_copies NUMBER(1);
BEGIN
  SELECT legality INTO max_copies
  FROM ygo_cards
  WHERE card_id = :new.card_id;

   IF :new.no_of_copies > max_copies AND max_copies = 0 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS FORBIDDEN AND BANNED. THIS CARD CANT BE PLAYED IN GAMES');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 1 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS LIMITED. ONLY 1 COPY CAN BE IN A DECK');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 2 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS SEMI-LIMITED. ONLY 2 COPY CAN BE IN A DECK');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 3 THEN
       RAISE_APPLICATION_ERROR(-20000,'MAX COPIES ALLOWED IS 3. PLEASE RECHECK STATEMENT');
  END IF;
END;
/


-- Trigger determining if the no of copies for a card exceeds the legality (i.e. can only have 1, 2 or not at all) before inserting in side_card 
CREATE OR REPLACE TRIGGER side_card_legality_b_insert 
BEFORE INSERT OR UPDATE ON ygo_side_cards
REFERENCING NEW AS New
FOR EACH ROW
DECLARE
  max_copies NUMBER(1);
BEGIN
  SELECT legality INTO max_copies
  FROM ygo_cards
  WHERE card_id = :new.card_id;

   IF :new.no_of_copies > max_copies AND max_copies = 0 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS FORBIDDEN AND BANNED. THIS CARD CANT BE PLAYED IN GAMES');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 1 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS LIMITED. ONLY 1 COPY CAN BE IN A DECK');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 2 THEN
       RAISE_APPLICATION_ERROR(-20000,'THIS CARD IS SEMI-LIMITED. ONLY 2 COPY CAN BE IN A DECK');
   ELSIF :new.no_of_copies > max_copies AND max_copies = 3 THEN
       RAISE_APPLICATION_ERROR(-20000,'MAX COPIES ALLOWED IS 3. PLEASE RECHECK STATEMENT');
  END IF;
END;
/
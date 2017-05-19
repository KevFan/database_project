-- Selects known tournaments from the database, order by date in descending order

SELECT 
	t.tourn_id AS "TOURNAMENT ID",
	t.tourn_name AS "TOURNAMENT NAME",
	t.tourn_date AS "DATE",
	t.location,
	t.entry_fee AS "ENTRY PRICE"
FROM ygo_tournaments t
ORDER BY "DATE" DESC;



-- Selects known players from the database and the the associated deck list ordered by player last name

SELECT 
	p.* , 
	dl.main_deck_id, 
	dl.extra_deck_id, 
	dl.side_deck_id
FROM ygo_players p
LEFT JOIN ygo_deck_lists dl
	ON p.list_id = dl.list_id
ORDER BY p.last_name;

-- Select known yu-gi-oh cards from the database 

SELECT 
	c.card_id AS "CARD ID",
	c.card_name AS "CARD NAME",
	c.card_description AS "DESCRIPTION",
	c.card_type AS "CARD TYPE",
	REPLACE(REPLACE(REPLACE(REPLACE(c.legality, '0', 'Fobbidden'), '1' , 'Limited'), '2', 'Semi-Limited'), '3', 'Unlimted') AS "LEGALITY",
	REPLACE(REPLACE(c.is_effect, '0', 'false'), '1' , 'true') AS "HAS EFFECT",
	c.m_level AS "MONSTER LEVEL",
	ma.m_att_name AS "MONSTER ATTRIBUTE",
	mc.m_cate_name AS "MONSTER CATEGORY",
	mt.m_type_name AS "MONSTER TYPE",
	st.spell_type_name AS "SPELL TYPE",
	tt.trap_type_name AS "TRAP TYPE"
FROM ygo_cards c
LEFT JOIN ygo_monster_attributes ma
	ON ma.m_att_id = c.m_att_id
LEFT JOIN ygo_monster_categorys mc
	ON mc.m_cate_id = c.m_cate_id
LEFT JOIN ygo_monster_types mt 
	ON mt.m_type_id = c.m_type_id
LEFT JOIN ygo_spell_types st
	ON st.spell_type_id = c.spell_type_id
LEFT JOIN ygo_trap_types tt
	ON tt.trap_type_id = c.trap_type_id;


-- Selects the ban list where cards either are forbidden, limited or semi-limited

SELECT 
	c.card_id AS "CARD ID",
	c.card_name AS "CARD NAME",
	c.card_description AS "DESCRIPTION",
	c.card_type AS "CARD TYPE",
	REPLACE(REPLACE(REPLACE(REPLACE(c.legality, '0', 'Fobbidden'), '1' , 'Limited'), '2', 'Semi-Limited'), '3', 'Unlimted') AS "LEGALITY",
	REPLACE(REPLACE(c.is_effect, '0', 'false'), '1' , 'true') AS "HAS EFFECT"
FROM ygo_cards c
WHERE "LEGALITY" < 3


-- Shows all player ids who entered the tournament 1

SELECT 
	pl.tourn_id AS "TOURNAMENT ID",
	pl.player_id AS "PLAYER ID",
	p.first_name AS "FIRST NAME",
	p.last_name AS "LAST NAME",    
	p.list_id AS "LIST ID"
FROM ygo_player_listings pl
LEFT JOIN ygo_players p
	ON p.player_id = pl.player_id
WHERE tourn_id = 1;


-- Selects all known deck lists from the database and shows the ids of the main deck, extra deck and side deck if any
SELECT * FROM ygo_deck_lists


-- Selects all known spell types that describe a spell card
SELECT * FROM ygo_spell_types



-- Selects all known trap types that describe a trap card
SELECT * FROM ygo_trap_types


-- Selects all known monster attributes that describe a monster card

SELECT 
	ma.m_att_id AS "MONSTER ATTRIBUTE ID",
	ma.m_att_name AS "ATTRIBUTE NAME"
FROM ygo_monster_attributes ma



-- Selects all known monster categorys that describe a monster card

SELECT 
	ct.m_cate_id AS "MONSTER CATEGORY ID",
	ct.m_cate_name AS "CATEGORY NAME"
FROM ygo_monster_categorys ct


-- Selects all known monster types that describe a monster card

SELECT 
	mt.m_type_id AS "MONSTER TYPE ID",
	mt.m_type_name AS "TYPE NAME"
FROM ygo_monster_types mt



-- Selects all cards in main deck 1 with description for each type of card
-- and ordered by card type

SELECT 
	mc.main_deck_id AS "MAIN DECK ID", 
	c.card_name AS "CARD NAME", 
	c.card_description AS "CARD DESCRIPTION", 
	c.card_type AS "CARD TYPE",
	c.attack AS "ATTACK", 
	c.defense AS "DEFENSE", 
	c.is_effect AS "HAS EFFECT", 
	c.m_level AS "LEVEL",
	tt.trap_type_name AS "TRAP TYPE", 
	st.spell_type_name AS "SPELL TYPE"
FROM ygo_main_cards mc
LEFT JOIN ygo_cards c
	ON mc.card_id = c.card_id
LEFT JOIN ygo_spell_types st
	ON c.spell_type_id = st.spell_type_id
LEFT JOIN ygo_trap_types tt
	ON c.trap_type_id = tt.trap_type_id
WHERE main_deck_id = 1
ORDER BY c.card_type


-- Selects all cards in side deck 1 with description for each type of card

SELECT 
	sc.side_deck_id AS "SIDE DECK ID", 
	c.card_name AS "CARD NAME", 
	c.card_description AS "CARD DESCRIPTION", 
	c.card_type AS "CARD TYPE",
	c.attack AS "ATTACK", 
	c.defense AS "DEFENSE", 
	c.is_effect AS "HAS EFFECT", 
	c.m_level AS "LEVEL",
	tt.trap_type_name AS "TRAP TYPE", 
	st.spell_type_name AS "SPELL TYPE"
FROM ygo_side_cards sc
LEFT JOIN ygo_cards c
	ON sc.card_id = c.card_id
LEFT JOIN ygo_spell_types st
	ON c.spell_type_id = st.spell_type_id
LEFT JOIN ygo_trap_types tt
	ON c.trap_type_id = tt.trap_type_id
WHERE side_deck_id = 1


-- Selects all cards in extra deck 1 with description for each type of card

SELECT 
	ec.extra_deck_id AS "EXTRA CARD ID", 
	c.card_name AS "CARD NAME", 
	c.card_description AS "CARD DESCRIPTION",
	c.card_type AS "CARD TYPE", 
	c.attack AS "ATTACK", 
	c.defense AS "DEFENSE", 
	c.is_effect AS "HAS EFFECT", 
	c.m_level AS "LEVEL",
	ma.m_att_name AS "MONSTER ATTRIBUTE",
	mc.m_cate_name AS "MONSTER CATEGORY",
	mt.m_type_name AS "MONSTER TYPE"
FROM ygo_extra_cards ec
LEFT JOIN ygo_cards c
	ON ec.card_id = c.card_id
LEFT JOIN ygo_monster_attributes ma
	ON ma.m_att_id = c.m_att_id
LEFT JOIN ygo_monster_categorys mc
	ON mc.m_cate_id = c.m_cate_id
LEFT JOIN ygo_monster_types mt
	ON mt.m_type_id = c.m_type_id
WHERE extra_deck_id = 1


-- Counts all the no of copies of each card in main_cards table with main deck id 1 to give the deck size

select SUM(no_of_copies) AS "MAIN DECK 1 SIZE" 
FROM ygo_main_cards mc
WHERE mc.main_deck_id = 1;



-- Selects the all cards in deck list 1 as one big long list

SELECT 
	REPLACE(dl.list_id, '1', 'MAIN DECK') AS "LIST",
	mc.card_id AS "CARD ID",
	mc.no_of_copies AS "COPIES",
	c.card_name AS "CARD NAME", 
	c.card_description AS "CARD DESCRIPTION",
	c.card_type AS "CARD TYPE", 
	REPLACE(REPLACE(REPLACE(REPLACE(c.legality, '0', 'Fobbidden'), '1' , 'Limited'), '2', 'Semi-Limited'), '3', 'Unlimted') AS "LEGALITY",
	c.attack AS "ATTACK", 
	c.defense AS "DEFENSE", 
	REPLACE(REPLACE(c.is_effect, '0', 'false'), '1' , 'true') AS "HAS EFFECT",
	c.m_level AS "LEVEL",
	ma.m_att_name AS "MONSTER ATTRIBUTE",
	mca.m_cate_name AS "MONSTER CATEGORY",
	mt.m_type_name AS "MONSTER TYPE"
FROM ygo_deck_lists dl
INNER JOIN ygo_main_cards mc
	ON mc.main_deck_id = dl.main_deck_id
LEFT JOIN ygo_cards c
	ON mc.card_id = c.card_id
LEFT JOIN ygo_monster_attributes ma
	ON ma.m_att_id = c.m_att_id
LEFT JOIN ygo_monster_categorys mca
	ON mca.m_cate_id = c.m_cate_id
LEFT JOIN ygo_monster_types mt
	ON mt.m_type_id = c.m_type_id
WHERE list_id = 1

UNION

SELECT
	REPLACE(dl.list_id, '1', 'EXTRA DECK') AS "LIST",
	ec.card_id AS "CARD ID",
	ec.no_of_copies AS "COPIES",
	c.card_name AS "CARD NAME", 
	c.card_description AS "CARD DESCRIPTION",
	c.card_type AS "CARD TYPE", 
	REPLACE(REPLACE(REPLACE(REPLACE(c.legality, '0', 'Fobbidden'), '1' , 'Limited'), '2', 'Semi-Limited'), '3', 'Unlimted') AS "LEGALITY",
	c.attack AS "ATTACK", 
	c.defense AS "DEFENSE", 
	REPLACE(REPLACE(c.is_effect, '0', 'false'), '1' , 'true') AS "HAS EFFECT",
	c.m_level AS "LEVEL",
	ma.m_att_name AS "MONSTER ATTRIBUTE",
	mca.m_cate_name AS "MONSTER CATEGORY",
	mt.m_type_name AS "MONSTER TYPE"
FROM ygo_deck_lists dl
INNER JOIN ygo_extra_cards ec
	ON ec.extra_deck_id = dl.extra_deck_id
LEFT JOIN ygo_cards c
	ON ec.card_id = c.card_id
LEFT JOIN ygo_monster_attributes ma
	ON ma.m_att_id = c.m_att_id
LEFT JOIN ygo_monster_categorys mca
	ON mca.m_cate_id = c.m_cate_id
LEFT JOIN ygo_monster_types mt
	ON mt.m_type_id = c.m_type_id
WHERE list_id = 1

UNION 

SELECT
	REPLACE(dl.list_id, '1', 'SIDE DECK') AS "LIST",
	sc.card_id AS "CARD ID",
	sc.no_of_copies AS "COPIES",
	c.card_name AS "CARD NAME", 
	c.card_description AS "CARD DESCRIPTION",
	c.card_type AS "CARD TYPE", 
	REPLACE(REPLACE(REPLACE(REPLACE(c.legality, '0', 'Fobbidden'), '1' , 'Limited'), '2', 'Semi-Limited'), '3', 'Unlimted') AS "LEGALITY",
	c.attack AS "ATTACK", 
	c.defense AS "DEFENSE", 
	REPLACE(REPLACE(c.is_effect, '0', 'false'), '1' , 'true') AS "HAS EFFECT",
	c.m_level AS "LEVEL",
	ma.m_att_name AS "MONSTER ATTRIBUTE",
	mca.m_cate_name AS "MONSTER CATEGORY",
	mt.m_type_name AS "MONSTER TYPE"
FROM ygo_deck_lists dl
INNER JOIN ygo_side_cards sc
	ON sc.side_deck_id = dl.side_deck_id
LEFT JOIN ygo_cards c
	ON sc.card_id = c.card_id
LEFT JOIN ygo_monster_attributes ma
	ON ma.m_att_id = c.m_att_id
LEFT JOIN ygo_monster_categorys mca
	ON mca.m_cate_id = c.m_cate_id
LEFT JOIN ygo_monster_types mt
	ON mt.m_type_id = c.m_type_id
WHERE list_id = 1

ORDER BY "CARD ID"


-- Select all tournaments that player 1 entered

SELECT 
	t.*,
	pl.player_id,
	p.first_name || ' ' || p.last_name AS "PLAYER NAME"
FROM ygo_tournaments t
INNER JOIN ygo_player_listings pl
	ON t.tourn_id = pl.tourn_id
INNER JOIN ygo_players p
	ON p.player_id = pl.player_id
WHERE pl.player_id = 1


-- Returns the number of players that entered each tournament

SELECT 
	tourn_id, 
	COUNT(*) AS "Total number of players"
FROM ygo_player_listings
GROUP BY tourn_id;
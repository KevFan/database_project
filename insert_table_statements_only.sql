-- Populate tournaments table
INSERT ALL
	INTO ygo_tournaments (tourn_name, tourn_date, location) VALUES ('Locals', TO_DATE('24/01/2016', 'DD/MM/YYYY'), 'Waterford')
	INTO ygo_tournaments (tourn_name, tourn_date, location, entry_fee) VALUES ('Regional Qualifiers', TO_DATE('30/08/2016', 'DD/MM/YYYY'), 'Kilkenny', 5.50)
	INTO ygo_tournaments (tourn_name, tourn_date, location) VALUES ('Locals', TO_DATE('16/11/2016', 'DD/MM/YYYY'), 'Dublin')
	INTO ygo_tournaments (tourn_name, tourn_date, location, entry_fee) VALUES ('Regional Finals', TO_DATE('11/01/2017', 'DD/MM/YYYY'), 'Kilkenny', 5)
	INTO ygo_tournaments (tourn_name, tourn_date, location, entry_fee) VALUES ('National Qualifiers', TO_DATE('16/02/2017', 'DD/MM/YYYY'), 'Limerick', 10)
	INTO ygo_tournaments (tourn_name, tourn_date, location, entry_fee) VALUES ('National Finals', TO_DATE('15/04/2017', 'DD/MM/YYYY'), 'Limerick', 10)
SELECT * FROM dual;

-- Populate spell types table
INSERT ALL
	INTO ygo_spell_types (spell_type_id, spell_type_name) VALUES (1, 'Quick Spell')
	INTO ygo_spell_types (spell_type_id, spell_type_name) VALUES (2, 'Normal')
	INTO ygo_spell_types (spell_type_id, spell_type_name) VALUES (3, 'Continuous')
	INTO ygo_spell_types (spell_type_id, spell_type_name) VALUES (4, 'Equip')
	INTO ygo_spell_types (spell_type_id, spell_type_name) VALUES (5, 'Field')
	INTO ygo_spell_types (spell_type_id, spell_type_name) VALUES (6, 'Ritual')
SELECT * FROM dual;

-- Populate trap type table
INSERT ALL
	INTO ygo_trap_types (trap_type_id, trap_type_name) VALUES (1, 'Counter')
	INTO ygo_trap_types (trap_type_id, trap_type_name) VALUES (2, 'Continuous')
	INTO ygo_trap_types (trap_type_id, trap_type_name) VALUES (3, 'Normal')
	INTO ygo_trap_types (trap_type_id, trap_type_name) VALUES (4, 'Equip')
	INTO ygo_trap_types (trap_type_id, trap_type_name) VALUES (5, 'Field')
SELECT * FROM dual;

-- Populate monster attributes table
INSERT ALL
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (1, 'Light')
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (2, 'Dark')
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (3, 'Earth')
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (4, 'Fire')
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (5, 'Water')
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (6, 'Wind')
	INTO ygo_monster_attributes (m_att_id, m_att_name) VALUES (7, 'Divine')
SELECT * FROM dual;

-- Populate monster categorys table
INSERT ALL
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (1, 'Normal')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (2, 'Union')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (3, 'Spirit')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (4, 'Flip')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (5, 'Gemini')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (6, 'Ritual')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (7, 'Tuner')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (8, 'Fusion')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (9, 'Synchro')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (10, 'Xyz')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (11, 'Pendulum')
	INTO ygo_monster_categorys (m_cate_id, m_cate_name) VALUES (12, 'Link')
SELECT * FROM dual;

-- Populate monster types table
INSERT ALL
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (1, 'Dragon')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (2, 'Aqua')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (3, 'Beast')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (4, 'Beast-Warrior')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (5, 'Creator God')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (6, 'Cyverse')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (7, 'Dinosaur')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (8, 'Divine-Beast')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (9, 'Fairy')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (10, 'Fiend')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (11, 'Pendulum')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (12, 'Fish')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (13, 'Insect')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (14, 'Machine')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (15, 'Plant')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (16, 'Psychic')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (17, 'Pyro')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (18, 'Reptile')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (19, 'Rock')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (20, 'Sea Serpent')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (21, 'Spell Caster')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (22, 'Thunder')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (23, 'Warrior')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (24, 'Winged Beast')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (25, 'Wyrm')
	INTO ygo_monster_types (m_type_id, m_type_name) VALUES (26, 'Zombie')
SELECT * FROM dual;

-- Populate main decks table
INSERT ALL
	INTO ygo_main_decks (main_deck_id) VALUES (1)
	INTO ygo_main_decks (main_deck_id) VALUES (2)
	INTO ygo_main_decks (main_deck_id) VALUES (3)
	INTO ygo_main_decks (main_deck_id) VALUES (4)
	INTO ygo_main_decks (main_deck_id) VALUES (5)
	INTO ygo_main_decks (main_deck_id) VALUES (6)
SELECT * FROM dual;

-- Populate extra decks table
INSERT ALL
	INTO ygo_extra_decks (extra_deck_id) VALUES (1)
	INTO ygo_extra_decks (extra_deck_id) VALUES (2)
	INTO ygo_extra_decks (extra_deck_id) VALUES (3)
	INTO ygo_extra_decks (extra_deck_id) VALUES (4)
	INTO ygo_extra_decks (extra_deck_id) VALUES (5)
SELECT * FROM dual;

-- Populate side decks table
INSERT ALL
	INTO ygo_side_decks (side_deck_id) VALUES (1)
	INTO ygo_side_decks (side_deck_id) VALUES (2)
	INTO ygo_side_decks (side_deck_id) VALUES (3)
SELECT * FROM dual;


-- Populate deck list table
INSERT ALL
	INTO ygo_deck_lists (list_id, list_name, main_deck_id, extra_deck_id, side_deck_id) VALUES (1, 'Chaos Dragons', 1, 1, 1)
	INTO ygo_deck_lists (list_id, list_name, main_deck_id, extra_deck_id) VALUES (2, 'Exodia', 2, 2)
	INTO ygo_deck_lists (list_id, main_deck_id, extra_deck_id) VALUES (3, 3, 3)
	INTO ygo_deck_lists (list_id, main_deck_id, extra_deck_id) VALUES (4, 4, 4)
	INTO ygo_deck_lists (list_id, main_deck_id, side_deck_id) VALUES (5, 5, 2)
	INTO ygo_deck_lists (list_id, main_deck_id, extra_deck_id, side_deck_id) VALUES (6, 6, 5, 3)
SELECT * FROM dual;


-- Populate players table
INSERT ALL
	INTO ygo_players (first_name, last_name, list_id) VALUES ('Kevin', 'Fan', 1)
	INTO ygo_players (first_name, last_name, list_id) VALUES ('Yugi', 'Moto', 2)
	INTO ygo_players (first_name, last_name, list_id) VALUES ('Seto', 'Kaiba', 3)
	INTO ygo_players (first_name, last_name, list_id) VALUES ('Joey', 'Wheeler', 4)
	INTO ygo_players (first_name, last_name, list_id) VALUES ('Atem', 'Yami', 5)
	INTO ygo_players (first_name, last_name, list_id) VALUES ('Maximillion', 'Pegasus', 6)
SELECT * FROM dual;

-- Populate player listings table
INSERT ALL
	INTO ygo_player_listings (tourn_id, player_id) VALUES (1, 1)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (1, 2)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (1, 3)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (1, 4)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (2, 1)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (2, 2)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (2, 5)
	INTO ygo_player_listings (tourn_id, player_id) VALUES (2, 6)
SELECT * FROM dual;


-- Populate cards table
INSERT ALL
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id, 
		m_type_id) VALUES ('Blue Eyes White Dragon', 'This legendary dragon is a powerful engine of destruction. 
		Virtually invincible, very few have faced this awesome creature and lived to tell the tale.', 'monster', 0, 
		3000, 2500, 0, 8, 1, 1, 1)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id,
	 m_type_id) VALUES ('Dark Magician', 'The ultimate wizard in terms of attack and defense.', 'monster', 1, 2500, 2000, 0, 
	 7, 2, 1, 21)
	INTO ygo_cards (card_name, card_description, card_type, legality, spell_type_id) VALUES ('A Hero Lives', 'If you control no 
		face-up monsters: Pay half your LP; Special Summon 1 Level 4 or lower "Elemental HERO" monster from your Deck.', 
		'spell', 2, 2)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id, 
		m_type_id) VALUES ('Masked HERO Dark Law', 'Must be Special Summoned with "Mask Change" and cannot be Special 
		Summoned by other ways. Any card sent to your opponents Graveyard is banished instead. Once per turn, if your opponent 
		adds a card(s) from their Deck to their hand (except during the Draw Phase or the Damage Step): You can banish 1 random 
		card from your opponents hand.', 'monster', 3, 2400, 1800, 1, 7, 2, 8, 23)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id, 
		m_type_id) VALUES ('Number 39: Utopia', '2 Level 4 monsters. When any players monster declares an attack: You can 
		detach 1 Xyz Material from this card; negate the attack. When this card is targeted for an attack, while it has no Xyz 
		Materials: Destroy this card.', 'monster', 2, 2500, 2000, 1, 4, 1, 10, 2)
	INTO ygo_cards (card_name, card_description, card_type, legality, trap_type_id) VALUES ('Fiendish Chain', 'Activate this 
		card by targeting 1 Effect Monster on the field; negate the effects of that face-up monster while it is on the field, 
		also that face-up monster cannot attack. When it is destroyed, destroy this card.' , 'trap', 2, 2)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id, 
		m_type_id) VALUES ('Obelisk the Tormentor', 'Requires 3 Tributes to Normal Summon (cannot be Normal Set). This cards 
		Normal Summon cannot be negated. When Normal Summoned, cards and effects cannot be activated. Once per turn, during the 
		End Phase, if this card was Special Summoned: Send it to the Graveyard. You can Tribute 2 monsters; destroy all monsters 
		your opponent controls. This card cannot declare an attack the turn this effect is activated.', 'monster', 3, 4000, 4000, 1, 
		10, 7, 1, 8)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id, 
		m_type_id) VALUES ('Red-Eyes B. Dragon', 'A ferocious dragon with a deadly attack.', 'monster', 3, 2400, 2000, 0, 
		7, 2, 1, 1)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id, 
		m_type_id) VALUES ('Relinquished', 'You can Ritual Summon this card with "Black Illusion Ritual". Once per turn: 
		You can target 1 monster your opponent controls; equip that target to this card. (You can only equip 1 monster at a 
		time to this card with this effect.) This cards ATK and DEF become equal to that equipped monsters. If this card would 
		be destroyed by battle, destroy that equipped monster instead. While equipped with that monster, any battle damage you 
		take from battles involving this card inflicts equal effect damage to your opponent.', 'monster', 3, 0, 0, 1, 
		1, 2, 6, 21)
	INTO ygo_cards (card_name, card_description, card_type, legality, trap_type_id) VALUES ('Solemn Warning', 'When a 
		monster(s) would be Summoned, OR when a Spell/Trap Card, or monster effect, is activated that includes an effect that 
		Special Summons a monster(s): Pay 2000 LP; negate the Summon or activation, and if you do, destroy that card.' , 'trap', 2, 1)
	INTO ygo_cards (card_name, card_description, card_type, legality, trap_type_id) VALUES ('Trap Hole', 'When your opponent 
		Normal or Flip Summons 1 monster with 1000 or more ATK: Target that monster; destroy that target.', 'trap', 3,  3)
	INTO ygo_cards (card_name, card_description, card_type, legality, spell_type_id) VALUES ('Change of Heart', 'Target 1 
		monster your opponent controls; take control of it until the End Phase.', 'spell', 3, 2)
	INTO ygo_cards (card_name, card_description, card_type, legality, spell_type_id) VALUES ('Mystical Space Typhoon', 'Target 1 
		Spell/Trap Card on the field; destroy that target.', 'spell', 2, 1)
	INTO ygo_cards (card_name, card_description, card_type, legality, spell_type_id) VALUES ('Solidarity', 'If you have only 
		original Type of monster in your Graveyard, all monsters you control with the same Type gain 800 ATK.', 'spell', 2, 3)
	INTO ygo_cards (card_name, card_description, card_type, legality, spell_type_id) VALUES ('Black Pendant', 'The equipped 
		monster gains 500 ATK. When this card is sent from the field to the Graveyard: Inflict 500 damage to your opponent.', 
		'spell', 3, 4)
	INTO ygo_cards (card_name, card_description, card_type, legality, spell_type_id) VALUES ('Skyscraper', 'When an 
		"Elemental HERO" monster attacks, if its ATK is lower than the ATK of the attack target, the attacking monster gains 
		1000 ATK during damage calculation only.', 'spell', 1, 5)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id,
		m_type_id) VALUES ('Exodia the Forbidden One', 'If you have "Right Leg of the Forbidden One", "Left Leg of the Forbidden One", 
		"Right Arm of the Forbidden One" and "Left Arm of the Forbidden One" in addition to this card in your hand, you win the Duel.', 'monster', 
		3, 1000, 1000, 1, 3, 2, 1, 21)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id,
		m_type_id) VALUES ('Left Arm of the Forbidden One', 'A forbidden left arm sealed by magic. Whosoever breaks this seal will know infinite power.',
		'monster', 3, 200, 300, 0, 1, 2, 1, 21)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id,
		m_type_id) VALUES ('Left Leg of the Forbidden One', 'A forbidden left leg sealed by magic. Whosoever breaks this seal will know infinite power.',
		'monster', 3, 200, 300, 0, 1, 2, 1, 21)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id,
		m_type_id) VALUES ('Right Arm of the Forbidden One', 'A forbidden right arm sealed by magic. Whosoever breaks this seal will know infinite power.',
		'monster', 3, 200, 300, 0, 1, 2, 1, 21)
	INTO ygo_cards (card_name, card_description, card_type, legality, attack, defense, is_effect, m_level, m_att_id, m_cate_id,
		m_type_id) VALUES ('Right Leg of the Forbidden One', 'A forbidden right leg sealed by magic. Whosoever breaks this seal will know infinite power.',
		'monster', 3, 200, 300, 0, 1, 2, 1, 21)
SELECT * FROM dual;

-- Populate main cards table
INSERT ALL
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 17, 3)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 3, 2)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 2, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 6, 2)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 7, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 8, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (1, 9, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 10, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 11, 2)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 12, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 13, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 14, 2)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 15, 1)
	INTO ygo_main_cards (main_deck_id, card_id, no_of_copies) VALUES (2, 16, 1)
SELECT * FROM dual;

-- Populate extra cards table
INSERT ALL
	INTO ygo_extra_cards (extra_deck_id, card_id, no_of_copies) VALUES (1, 4, 1)
	INTO ygo_extra_cards (extra_deck_id, card_id, no_of_copies) VALUES (1, 5, 2)
SELECT * FROM dual;

-- Populate side cards table
INSERT ALL
	INTO ygo_side_cards (side_deck_id, card_id, no_of_copies) VALUES (1, 17, 1)
	INTO ygo_side_cards (side_deck_id, card_id, no_of_copies) VALUES (1, 18, 1)
	INTO ygo_side_cards (side_deck_id, card_id, no_of_copies) VALUES (1, 19, 1)
	INTO ygo_side_cards (side_deck_id, card_id, no_of_copies) VALUES (1, 20, 1)
	INTO ygo_side_cards (side_deck_id, card_id, no_of_copies) VALUES (1, 21, 1)
SELECT * FROM dual;
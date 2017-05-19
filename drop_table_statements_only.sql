--Drop all tables if they exist
DROP TABLE ygo_side_cards;
DROP TABLE ygo_extra_cards;
DROP TABLE ygo_main_cards;
DROP TABLE ygo_cards;
DROP TABLE ygo_player_listings;
DROP TABLE ygo_players;
DROP TABLE ygo_deck_lists;
DROP TABLE ygo_side_decks;
DROP TABLE ygo_extra_decks;
DROP TABLE ygo_main_decks;
DROP TABLE ygo_monster_types;
DROP TABLE ygo_monster_categorys;
DROP TABLE ygo_monster_attributes;
DROP TABLE ygo_trap_types;
DROP TABLE ygo_spell_types;
DROP TABLE ygo_tournaments;

-- Drop sequences if they exist
DROP SEQUENCE ygo_tournaments_seq;
DROP SEQUENCE ygo_players_seq;
DROP SEQUENCE ygo_cards_seq;

-- Note: Created triggers are not implicity dropped as they should be dropped also when the associated table is dropped

character_type(hero) --> [hero].
character_type(enemy) --> [enemy].

character_subtype(hero, Subtype) --> [Subtype], { member(Subtype, [wizard, mage, elf]) }.
character_subtype(enemy, Subtype) --> [Subtype], { member(Subtype, [darkwizard, demon, basilisk]) }.

sequence(Sequence) --> [Sequence], { integer(Sequence), Sequence > 0 }.

movement_direction(hero, away, no_weapon) --> [away]. 
movement_direction(hero, towards, has_weapon) --> [towards]. 
movement_direction(enemy, towards, no_weapon) --> [towards]. 

health(very_weak) --> [very_weak].
health(weak) --> [weak].
health(normal) --> [normal].
health(strong) --> [strong].
health(very_strong) --> [very_strong].


weapon(hero, Weapon) --> [Weapon], { member(Weapon, [has_weapon, no_weapon]) }.
weapon(enemy, no_weapon) --> [no_weapon].

movement_style(stealthy) --> [stealthy].
movement_style(smoothly) --> [smoothly].
movement_style(jerky) --> [jerky].

character_description -->
    character_type(CharacterType),
    character_subtype(CharacterType, Subtype),
    sequence(Sequence),
    movement_direction(CharacterType, Direction, Weapon),
    health(Health),
    weapon(CharacterType, Weapon),
    movement_style(Style).

use std::collections::HashMap;

#[derive(Debug)]
pub enum Category {
    Ones,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];

pub fn score(dice: Dice, category: Category) -> u8 {
    let mut sorted_dice = dice.to_vec();
    sorted_dice.sort_unstable();

    let mut groups = HashMap::new();
    for &d in &sorted_dice {
        *groups.entry(d).or_insert(0) += 1;
    }

    let count = |x: u8| dice.iter().filter(|&&d| d == x).count() as u8;

    match category {
        Category::Ones => 1 * count(1),
        Category::Twos => 2 * count(2),
        Category::Threes => 3 * count(3),
        Category::Fours => 4 * count(4),
        Category::Fives => 5 * count(5),
        Category::Sixes => 6 * count(6),
        Category::FullHouse => {
            if groups.len() == 2 && groups.values().any(|&count| count == 3) {
                sorted_dice.iter().sum::<u8>()
            } else {
                0
            }
        }
        Category::FourOfAKind => {
            if let Some((&value,_)) = groups.iter().find(|(_, &count)| count >= 4) {
                4 * value
            } else {
                0
            }
        }
        Category::LittleStraight => {
            if sorted_dice == [1, 2, 3, 4, 5] {
                30
            } else {
                0
            }
        }
        Category::BigStraight => {
            if sorted_dice == [2, 3, 4, 5, 6] {
                30
            } else {
                0
            }
        }
        Category::Choice => sorted_dice.iter().sum::<u8>(),
        Category::Yacht => {
            if groups.len() == 1 {
                50
            } else {
                0
            }
        }
    }
}
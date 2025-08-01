use std::ops::BitAnd;

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub enum Allergen {
    Eggs = 1,
    Peanuts = 2,
    Shellfish = 4,
    Strawberries = 8,
    Tomatoes = 16,
    Chocolate = 32,
    Pollen = 64,
    Cats = 128,
}

pub struct Allergies {
    score: u32
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        Allergies { score }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.score.bitand(*allergen as u32) != 0
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        use Allergen::*;
        [Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats]
            .iter()
            .filter(|&allergen| self.is_allergic_to(allergen))
            .cloned()
            .collect()
    }
}
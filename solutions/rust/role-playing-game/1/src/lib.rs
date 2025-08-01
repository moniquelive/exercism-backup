pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health > 0 {
            return None;
        }
        Some(Player {
            health: 100,
            mana: if self.level >= 10 { Some(100) } else { None },
            level: self.level,
        })
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        match self.mana {
            None => {
                self.health = self.health.checked_sub(mana_cost).unwrap_or(0);
                0
            }
            Some(m) => {
                if m < mana_cost {
                    return 0;
                }
                self.mana = Some(m - mana_cost);
                mana_cost * 2
            }
        }
    }
}

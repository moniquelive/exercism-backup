use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut magazine_map = HashMap::new();
    for word in magazine.iter() {
        let counter = magazine_map.entry(word).or_insert(0);
        *counter += 1;
    }
    let mut note_map = HashMap::new();
    for word in note.iter() {
        let counter = note_map.entry(word).or_insert(0);
        *counter += 1;
    }
    for (word, count) in &note_map {
        match magazine_map.get(word) {
            None => return false,
            Some(c) => {
                if c < count {
                    return false;
                }
            }
        }
    }
    true
}

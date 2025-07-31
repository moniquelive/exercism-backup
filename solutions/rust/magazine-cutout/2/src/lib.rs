use std::collections::HashMap;

pub fn can_construct_note(magazine: &[&str], note: &[&str]) -> bool {
    let mut hash_map = HashMap::new();

    for word in magazine.iter() {
        let counter = hash_map.entry(word).or_insert(0);
        *counter += 1;
    }
    for word in note.iter() {
        let counter = hash_map.entry(word).or_insert(0);
        *counter -= 1;
    }
    return hash_map.iter().all(|(_, &v)| v >= 0);
}

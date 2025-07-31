#include <algorithm>
#include "grade_school.h"

using namespace grade_school;

const roster_t &school::roster() const {
    return roster_;
}

void school::add(std::string_view name, int grade) {
    auto &students = roster_[grade];
    students.insert(
            std::upper_bound(students.begin(), students.end(), name),
            std::string(name)
    );
}

students_t school::grade(int grade) const {
    auto it = roster_.find(grade);
    if (it == roster_.end()) {
        return {};
    }
    return it->second;
}

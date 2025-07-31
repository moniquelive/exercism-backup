#include <algorithm>
#include "grade_school.h"


using namespace grade_school;

grade_school::roster_t school::roster() const {
    return roster_;
}

void school::add(const char *string, int i) {
    roster_[i].push_back(string);
    std::sort(roster_[i].begin(), roster_[i].end());
}

grade_school::students_t school::grade(int i) const {
    roster_t r = roster_;
    return r[i];
}

#if !defined(GRADE_SCHOOL_H)
#define GRADE_SCHOOL_H

#include <map>
#include <string>
#include <vector>

namespace grade_school {
    typedef std::vector<std::string> students_t;
    typedef std::map<int, students_t> roster_t;

    class school {

        roster_t roster_;
    public:
        roster_t roster() const;

        void add(const char *string, int i);

        students_t grade(int i) const;
    };  // namespace grade_school
}

#endif // GRADE_SCHOOL_H
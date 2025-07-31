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
        const roster_t& roster() const;

        void add(const std::string_view& name, int grade);

        students_t grade(int grade) const;
    };  // namespace grade_school
}

#endif // GRADE_SCHOOL_H
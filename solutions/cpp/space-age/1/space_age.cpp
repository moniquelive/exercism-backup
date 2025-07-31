#include "space_age.h"

namespace space_age {
    enum Factors : uint64_t {
        earth = 31557600,
        mercury = 24084670,
        venus = 61519726,
        mars = 188081580,
        jupiter = 1186261500,
        saturn = 2944749800,
        uranus = 8401684600,
        neptune = 16479132000,
    };

    static const double factor = 1e8;

    uint64_t space_age::seconds() const { return age_; }
    double space_age::on_earth() const { return static_cast<double>(seconds()) / earth; }
    double space_age::on_mercury() const { return on_earth() / mercury * factor; }
    double space_age::on_venus() const { return on_earth() / venus * factor; }
    double space_age::on_mars() const { return on_earth() / mars * factor; }
    double space_age::on_jupiter() const { return on_earth() / jupiter * factor; }
    double space_age::on_saturn() const { return on_earth() / saturn * factor; }
    double space_age::on_uranus() const { return on_earth() / uranus * factor; }
    double space_age::on_neptune() const { return on_earth() / neptune * factor; }
}  // namespace space_age

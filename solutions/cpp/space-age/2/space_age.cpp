#include "space_age.h"

namespace space_age {
    constexpr int one_earth_year_in_seconds = 31557600;
    constexpr double one_mercury_year_in_earth_years = 0.24084670;
    constexpr double one_venus_year_in_earth_years = 0.61519726;
    constexpr double one_mars_year_in_earth_years = 1.88081580;
    constexpr double one_jupiter_year_in_earth_years = 11.86261500;
    constexpr double one_saturn_year_in_earth_years = 29.44749800;
    constexpr double one_uranus_year_in_earth_years = 84.01684600;
    constexpr double one_neptune_year_in_earth_years = 164.79132000;

    space_age::space_age(std::int64_t age_in_seconds) : age_in_seconds_(age_in_seconds) {}

    std::int64_t space_age::seconds() const { return age_in_seconds_; }

    double space_age::on_earth() const { return static_cast<double>(seconds()) / one_earth_year_in_seconds; }
    double space_age::on_mercury() const { return on_earth() / one_mercury_year_in_earth_years; }
    double space_age::on_venus() const { return on_earth() / one_venus_year_in_earth_years; }
    double space_age::on_mars() const { return on_earth() / one_mars_year_in_earth_years; }
    double space_age::on_jupiter() const { return on_earth() / one_jupiter_year_in_earth_years; }
    double space_age::on_saturn() const { return on_earth() / one_saturn_year_in_earth_years; }
    double space_age::on_uranus() const { return on_earth() / one_uranus_year_in_earth_years; }
    double space_age::on_neptune() const { return on_earth() / one_neptune_year_in_earth_years; }
}  // namespace space_age

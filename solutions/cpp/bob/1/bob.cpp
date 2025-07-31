#include "bob.h"
#include "stdafx.h"

// util fn's
static bool my_isupper (const char& c)          { return isalpha(c) ? isupper(c) : true; }
static bool all_upper_p(const std::string& str) { return boost::algorithm::all(str, my_isupper); }
static bool all_space_p(const std::string& str) { return boost::algorithm::all(str, isspace); }
static bool any_alpha_p(const std::string& str) { return boost::algorithm::any_of(str, isalpha); }
static bool question_p (const std::string& str) { return boost::algorithm::ends_with(str, "?"); }

// meet Bob
struct Bob {
  Bob(const char* const greeting) : greeting_(greeting) {}

  const char* reply() const {
    if (indifferent())   { return FINE; }
    else if (shouting()) { return CHILL; }
    else if (question()) { return SURE; }
    else                   return WHATEVA;
  }

  bool shouting() const    { return any_alpha_p(greeting_) && all_upper_p(greeting_); }
  bool indifferent() const { return all_space_p(greeting_); }
  bool question() const    { return question_p(greeting_); }

private:

  static const char* const FINE;
  static const char* const CHILL;
  static const char* const SURE;
  static const char* const WHATEVA;

  const char* const greeting_;
};

// statics
const char* const Bob::FINE    = "Fine. Be that way!";
const char* const Bob::CHILL   = "Whoa, chill out!";
const char* const Bob::SURE    = "Sure.";
const char* const Bob::WHATEVA = "Whatever.";

// the export
const char* bob::hey(const char* const greet) { return Bob(greet).reply(); }
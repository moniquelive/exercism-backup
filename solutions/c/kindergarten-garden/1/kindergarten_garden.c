#include "kindergarten_garden.h"

#include <assert.h>

static plant_t plant(char c) {
   switch (c) {
      case 'C': return CLOVER;
      case 'G': return GRASS;
      case 'R': return RADISHES;
      case 'V': return VIOLETS;
   }
   return -1;
}

plants_t plants(const char* diagram, const char* student) {
   char* p = (char*)diagram;
   while (p && *p != '\n') p++;
   assert(p); p++; assert(p);

   const int index = 2 * (student[0] - 'A');
   const plants_t result = {
      .plants = {
         plant(diagram[index]),
         plant(diagram[index+1]),
         plant(*(p+index)),
         plant(*(p+index+1)),
      }
   };
   return result;
}

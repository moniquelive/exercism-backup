#include "luhn.h"

#include <string.h>

static void copy_no_space(char *to, const char *from) {
   do { if (*from != ' ') { *to++ = *from; } } while(*from++);
}

static void copy_no_digits(char *to, const char *from) {
   do { if (*from < '0' || *from > '9') { *to++ = *from; } } while(*from++);
}

bool luhn(const char *num) {
   char nospace[strlen(num)+1];
   char nodigits[strlen(num)+1];

   copy_no_space(nospace, num);
   if (strlen(nospace) < 2) return false;

   copy_no_digits(nodigits, nospace);
   if (strlen(nodigits) > 0) return false;

	 int sum = 0;
	 for (int i = strlen(nospace)-1; i >= 0; i-=2) {
	    int odd = nospace[i] - '0';
	    int even = 2 * (i < 1 ? 0 : nospace[i-1] - '0');
	    if (even > 9) even -= 9;
	    sum += even + odd;
   }
   return sum % 10 == 0;
}

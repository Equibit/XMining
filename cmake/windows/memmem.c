#include <string.h>

const void *memmem(const void *haystack, size_t haystacklen, const void *needle, size_t needlelen)
{
    // Sanity check
    if (needlelen > haystacklen) return NULL;

    // Void is useless -- we must treat our data as bytes (== unsigned chars)
    typedef const unsigned char* p;

    // We'll stop searching at the last possible position for a match,
    // which is haystack[ haystacklen - needlelen + 1 ]
    haystacklen -= needlelen - 1;

    while (haystacklen)
    {
        // Find the first byte in a potential match
        p z = (p)memchr((p)haystack, *(p)needle, haystacklen);
        if (!z) return NULL;

        // Is there enough space for there to actually be a match?
        ptrdiff_t delta = z - (p)haystack;
        ptrdiff_t remaining = (ptrdiff_t)haystacklen - delta;
        if (remaining < 1) return NULL;

        // Advance our pointer and update the amount of haystack remaining
        haystacklen -= delta;
        haystack = z;

        // Did we find a match?
        if (!memcmp(haystack, needle, needlelen)) return haystack;

        // Ready for next loop
        haystack = (p)haystack + 1;
        haystacklen -= 1;
    }
    return NULL;
}

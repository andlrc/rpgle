#ifndef _RPGLE_H
#define _RPGLE_H 1
struct parameter_t {
	char *name;
};
typedef struct parameter_s parameter_t;

struct dcl_pi_s {
	char *name;
	parameter_t **parameters;
};
typedef struct dcl_pi_s dcl_pi_t;
#endif

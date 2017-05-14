#ifndef _RPGLE_H
#define _RPGLE_H 1

#ifdef DEBUG
#define PUTS(x, y) printf(*y != '\0' ? "%s: %s\n" : "%s\n", x, y);
#else
#define PUTS(x, y)
#endif

enum value_type_e {
	VALUE_TYPE_STR,
	VALUE_TYPE_INUM,
	VALUE_TYPE_DNUM
};
union value_type_u {
	char *str;
	int inum;
	double dnum;
};
struct value_s {
	enum value_type_e type;
	union value_type_u value;
};
typedef struct value_s value_t;

enum identtype_e {
	IDENTTYPE_CHAR,
	IDENTTYPE_VARCHAR,
	IDENTTYPE_UCS,
	IDENTTYPE_VARUCS,
	IDENTTYPE_GRAPH,
	IDENTTYPE_IND,
	IDENTTYPE_PACKED,
	IDENTTYPE_ZONED,
	IDENTTYPE_BINDEC,
	IDENTTYPE_INT,
	IDENTTYPE_UNS,
	IDENTTYPE_FLOAT,
	IDENTTYPE_DATE,
	IDENTTYPE_TIME,
	IDENTTYPE_TIMESTAMP,
	IDENTTYPE_POINTER,
	IDENTTYPE_OBJECT
};
struct identtype_s {
	enum identtype_e type;
	union value_type_u arg1;
	union value_type_u arg2;
};
typedef struct identtype_s identtype_t;

struct parameter_s {
	char *name;
	identtype_t *identtype;
};
typedef struct parameter_s parameter_t;

struct dclpi_s {
	char *name;
	parameter_t **parameters;
};
typedef struct dclpi_s dclpi_t;

enum identtype_e lookup_identtype(char *);

struct dclc_s {
	char *name;
	enum value_type_e value_type;
	union value_type_u value;
};
typedef struct dclc_s dclc_t;

#endif

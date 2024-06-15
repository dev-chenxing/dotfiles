/* user and group to drop privileges to */
static const char *user  = "chenxing";
static const char *group = "users";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "black",     /* after initialization */
	[INPUT] =  "#756956",   /* during input */
	[FAILED] = "#90413A",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

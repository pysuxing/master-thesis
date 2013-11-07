typedef struct {
    int in_number;           /* number of input data */
    vector* in;              /* pointers to input data */
    vector out;              /* output data */
    vp_t vp_type;            /* vector primitive type */
    void* vp;                /* vector primitive struct */
} task;

typedef struct {
    int intype;                 /* input type */
    int outtype;                /* output type */
    void* op;                   /* pointer to scalar function */
} map_struct;

...                             /* other vector primitive struct */

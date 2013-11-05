typedef struct {
    int in_number;           /* number of input data */
    void** in;               /* pointers to input data */
    size_t* in_length;       /* pointers to input data length */
    int* in_type;            /* pointers to input element type */
    void* out;               /* output data */
    size_t outlen;           /* output length */
    int outtype;             /* outtype element type */
    vp_t vp_type;            /* vector primitive type */
    void* vp;                /* vector primitive struct */
} task_t;

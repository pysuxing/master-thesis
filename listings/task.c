struct {
    int input_number;           /* number of input data */
    void** input;               /* pointers to input data */
    size_t* input_length;       /* pointers to input data length */
    int* input_type;            /* pointers to input element type */
    void* out;                  /* output data */
    size_t outlen;              /* output length */
    int outtype;                /* outtype element type */
    vector_primitive_t vp_type; /* vector primitive type */
    void* vp;                   /* vector primitive struct */
}


int add(int a, int b) {
    return a + b;
}

typedef struct {
    int num;
    int abc;
} Name;

typedef int A;

typedef struct Something {
    int num;
    int abc;
} Name2;

struct Person {
    int num;
};

#define BC(a, b)\
    a\
    b
#define ABC(a, b)\
    ab
#ifndef MIN
# define MIN(X, Y) ((X) < (Y) ? (X) : (Y))
#endif
#ifndef MAX
# define MAX(X, Y) ((X) > (Y) ? (X) : (Y))
#endif

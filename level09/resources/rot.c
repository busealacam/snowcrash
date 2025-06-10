#include <stdio.h>

int main (int ac, char **av) {
    int i = 0;
    while (av[1][i] != '\0') {
        putchar (av[1][i] - i);
        i++;
    }
    putchar('\n');
    return 0;
}
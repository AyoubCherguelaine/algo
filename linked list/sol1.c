#include<math.h>

int convert(List L){
    List p=L;
    int pow=0, value=0;
    while(p!= null){
        value+= val(p)*(pow(2,pow));
        p = suiv(p)
    }
    return value
}

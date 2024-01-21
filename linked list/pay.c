

void delete(list p , list q){
    p.suiv = q.suiv;
    free(q);
}

int main(){

    //pays list
    list p,should_be_deleted;
    p = pays;
    while( p<>null){
        ch  = Pay(p);
        len = Longueur(ch);
        if(ch[len-1]== 'e'){
            should_be_deleted=p;
            p=p.suiv;
            delete(p,should_be_deleted);
            continue;
        }
        p=p.suiv;
    } 

}

void delete_mallion(list L ,list index){
    list p,q;
    if (index ==0){
        L = L.suiv
    }else{
        p=l
        q=l
        for(int i =0,i<index,i++) //>
        {
            q=p
            p=p.suiv
        }
        q.suiv = p.suiv
        free(p)
    }

}

void delete(list p , list q){
    p.suiv = q.suiv
    free(q)
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
            delete(p,should_be_deleted)
            continue;
        }
        p=p.suiv
    } 

}
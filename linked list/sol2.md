procedure extract_word(ch:str,index:int,word:*str,last_index:*int)
variable 
    max_len, i, save : int
debut
    max_len = length(ch)
    i= index
    save=0
    last_index = i
    tq i<>max_len:
        si i<>0:
            si ch[i-1] == ' ' et ch[i] != ' ':
                save =1
        sinon:
            si ch[i] != ' ':
                save = 1
        si ch[i] != ' ' et save == 1:
            word = word + ch[i]
        si ch[i] == ' ' et save == 1:
            last_index = i-1
            i = max_len
        i=i+1

fin

    



function convertion(l:list):entier
variable
    p:list
    pow, value : entier

debut

p<-l
pow<-0

tq p <> nul:
    value <- value + p.value*(2^pow)
    p<- p.suiv

return value
fin


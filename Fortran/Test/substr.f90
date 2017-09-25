program substr
character(LEN=100)::str,both
character(LEN=1)::space
integer::counter,j, syCounter, syllable
logical::IsVowel, IsDigit
counter = 0
syCounter = 0
j = 0
str = "The Bailey real regal potato "
do 200 i = 1, len_trim(str), 1
    if(str(i:i) == ' ')then
        counter = counter +1
        syCounter = syCounter + syllable(str(j:i),(i-j))
        !call IsNumber(str(j:i),(i-j))
        j = i+1
    end if
200 continue
!print*,str(j:)
print*,syCounter
end program substr

integer function syllable(word, length)
character(LEN=length)::word
integer::counter, length,i
counter = 0
!print*, word;
do 10 i = 1,length,1
    if((i == 1).and.(IsVowel(word(i:i))==1))then
        counter = counter + 1
    else if((i > 1).and.(IsVowel(word(i:i))==1).and.(IsVowel(word((i-1):(i-1)))==0))then
        counter = counter + 1
    else 
        continue
    end if
10 continue
if(word(length:length)=='e')then
    counter = counter -1
end if
if(counter < 1)then
    counter = counter +1
!print*, counter
end if
return
end function syllable
integer function IsVowel(c)
implicit none
logical::tf
!Subroutine to test if a character is a vowel. Necessary because the if
!statements in the previous subroutine got too long.
character(LEN=1)::c
tf = ((c=='a').or.(c=='e').or.(c=='i').or.(c=='o').or.(c=='u').or.(c=='y'))
return
end function IsVowel
integer function IsPunct(c)
implicit none
logical::tf
character(LEN=1)::c
tf=((c=='.').or.(c==':').or.(c==';').or.(c=='?').or.(c=='!'))
return
end function IsPunct
integer function IsDigit(c)
implicit none
logical::tf
character(LEN=1)::c
tf=((c=='0').or.(c=='1').or.(c=='2').or.(c=='3').or.(c=='4').or.(c=='5').or.(c=='6').or.(c=='7').or.(c=='8').or.(c=='9'))
return
end function IsDigit
subroutine IsNumber(word,length)
character(LEN=length)::word
integer::length, i
do 10 i = 1,length,1
    if(.not.(IsDigit(word(i:i))==1))then
        print*, "Number not found"
        tf = 0
        return
    else if((IsDigit(word(i:i)) == 1).or.(IsPunct(word(i:i))==1).and.(i == length))then
        print*, "Number has been found!"
        tf = 1
    end if
10 continue
return
end subroutine IsNumber

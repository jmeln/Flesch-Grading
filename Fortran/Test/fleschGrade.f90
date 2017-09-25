!Author: Jarrett melnick
program fleschGrade
character,dimension(:), allocatable::long_string
integer::filesize

interface
subroutine read_file(string,filesize)
character,dimension(:),allocatable::string
integer::filesize
end subroutine read_file
end interface
call read_file(long_string,filesize)
print*,long_string

print*,"Read",filesize,"characters."
end program fleschGrade

subroutine read_file(string,filesize)
!Subroutine to read the file. Copied from class.
character,dimension(:),allocatable::string
integer::counter
integer::filesize
character(LEN=1)::input

inquire(file="KJV.txt",size=filesize)
open(unit=5,status="old",access="direct",form="unformatted",recl=1,file="KJV.txt")
allocate(string(filesize))

counter=1
100 read(5,rec=counter,err=200)input
    string(counter:counter)=input
    counter=counter+1
    goto 100
200 continue
counter=counter-1
close(5)
end subroutine read_file
subroutine SyllableCounter(word)
!Subroutine to count the syllables of a word. takes a word and returns the
!number of syllables

end subroutine SyllableCounter
subroutine Flesch(wordCount, sentenceCount, syllableCount)
!Calculates the flesch index and grade. Takes the word count, sentence count,
!and syllable count. The function prints the flesch index and grade.
INTEGER::wordCount, sentenceCount, syllableCount
REAL::a, b, fIndex, fGrade
!Make this function since it stays constant. Iw will at least provide a starting
!point until i can figure out how the hell I'm going to separate the words. 
a = (syllableCount/wordCount)
b = (wordCount/sentenceCount)
fIndex = (206.835 - a*84.6 - b*1.015)
fGrade = (a*11.8 + b*0.39 - 15.59)
print '(f0.0)', fIndex
print '(f0.1)', fGrade
end subroutine Flesch
integer function IsVowel(c)
implicit none
logical::tf
character(LEN=1)::c
tf=((c=='a').or.(c=='e').or.(c=='i').or.(c=='o').or.(c=='u').or.(c=='y'))
return
end function IsVowel
integer function IsDigit(c)
implicit none
logical::tf
character(LEN=1)::c
tf=((c=='0').or.(c=='1').or.(c=='2').or.(c=='3').or.(c=='4').or.(c=='5').or.(c=='6').or.(c=='7').or.(c=='8').or.(c=='9'))
return
end function IsDigit
integer function IsNumber(word,length)
character(LEN=length)::word
integer::length, i
do 10 i = 1,length,1
    if(.not.(IsDigit(word(i:i))==1))then
        tf = 0
    else
        tf = 1
    end if
return
end function IsNumber


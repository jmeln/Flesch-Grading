 #Author: Jarrett Melnick
 #!/usr/bin/perl
 #Takes the filename via command line and removes unessecary characters.
 #The final array contains all valid words.
 sub syllable{
 #Pass in the word you want to count.
 #It will return an integer with the number of syllables.
 my $counter = 0;
     if($_[0] =~ m/e$/){
         $counter = $counter -1;
     }
     $string = $_[0];
     $string =~ tr/a|e|i|o|u|y/O/s;
     while($string =~ m/O/g){
         $counter = $counter + 1;
     }
     if($counter <= 0){
         $counter = 1;
         }
     return $counter;
 }
 sub FleschGrade($syllableCount, $wordCount, $sentenceCount){
 #Pass in the syllable count, word count, and sentence count in that order.
 #This function prints the Flesch Index and grade to the screen.
     #print "$wordCount, $sentenceCount, $syllableCount\n";
     my $a = ($syllableCount/$wordCount);
     my $b = ($wordCount/$sentenceCount);
     my $index = (206.835-($a*84.6)-($b*1.015));
     my $grade = (($a*11.8)+($b*0.39)-15.59);
     printf("The Flesch Index is %d.\n", $index);
     printf("The Flesch Grade is %.1f.\n", $grade);
 }

 open(FILE, $ARGV[0]) || die "Cannot open '$ARGV[0]' :$!";
 $inFile = join ' ', <FILE>;
 chomp $inFile;
 $sentenceCount = 0;
 while($inFile =~ m/\.|!|:|;|\?/g){
     $sentenceCount = $sentenceCount + 1;
 }
 $inFile =~ s/[\d\s\h+]/ /g;
 @words = ($inFile =~ /(\w+)/g);
 $wordCount = 0+@words;
 $syllableCount = 0;
 foreach(@words){
     $syllableCount = ($syllableCount + syllable($_));
 }
 &FleschGrade($syllableCount,$wordCount,$sentenceCount);
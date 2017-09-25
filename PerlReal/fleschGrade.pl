 #Author: Jarrett Melnick
  2 #!/usr/bin/perl
  3 #Takes the filename via command line and removes unessecary characters.
  4 #The final array contains all valid words.
  5 sub syllable{
  6 #Pass in the word you want to count.
  7 #It will return an integer with the number of syllables.
  8     my $counter = 0;
  9     if($_[0] =~ m/e$/){
 10         $counter = $counter -1;
 11     }
 12     $string = $_[0];
 13     $string =~ tr/a|e|i|o|u|y/O/s;
 14     while($string =~ m/O/g){
 15         $counter = $counter + 1;
 16     }
 17     if($counter <= 0){
 18         $counter = 1;
 19     }
 20     return $counter;
 21 }
 22 sub FleschGrade($syllableCount, $wordCount, $sentenceCount){
 23 #Pass in the syllable count, word count, and sentence count in that order.
 24 #This function prints the Flesch Index and grade to the screen.
 25     #print "$wordCount, $sentenceCount, $syllableCount\n";
 26     my $a = ($syllableCount/$wordCount);
 27     my $b = ($wordCount/$sentenceCount);
 28     my $index = (206.835-($a*84.6)-($b*1.015));
 29     my $grade = (($a*11.8)+($b*0.39)-15.59);
 30     printf("The Flesch Index is %d.\n", $index);
 31     printf("The Flesch Grade is %.1f.\n", $grade);
 32 }
 33
 34 open(FILE, $ARGV[0]) || die "Cannot open '$ARGV[0]' :$!";
 35 $inFile = join ' ', <FILE>;
 36 chomp $inFile;
 37 $sentenceCount = 0;
 38 while($inFile =~ m/\.|!|:|;|\?/g){
 39     $sentenceCount = $sentenceCount + 1;
 40 }
 41 $inFile =~ s/[\d\s\h+]/ /g;
 42 @words = ($inFile =~ /(\w+)/g);
 43 $wordCount = 0+@words;
 44 $syllableCount = 0;
 45 foreach(@words){
 46     $syllableCount = ($syllableCount + syllable($_));
 47 }
 48 &FleschGrade($syllableCount,$wordCount,$sentenceCount);
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class FleschGrading{
	public static void main(String[] args){
		int numWords = 0;
		int numSentences = 0;
		int numSyllables = 0;
		try{
			BufferedReader inFile = new BufferedReader(new FileReader(args[0]));
			String line;
			while((line = inFile.readLine()) != null){
				if(line.length() > 1){
					line = line.toLowerCase().trim().replaceAll(" +", " ");
					line += " ";
					int j = 0;
					for(int i = 0; i < line.length(); i++){
						if(line.charAt(i) == ' '){
							String test = line.substring(j, i);
							if((!(test.charAt(0) == ' ')) && !(IsNumber(test))){
								numWords++;
								numSyllables += SyllableCounter(test);
							}
							if(IsEndOfSentence(test)){
								numSentences++;
							}
							j = i+1;
						}
					}
				}
			}
			System.out.println(args[0]);
			FleschIndex(numWords, numSentences, numSyllables);
			System.out.println();
			inFile.close();
		}
		catch(IOException e){
			e.printStackTrace();
		}
	}
	private static boolean IsDigit(char c){
		char[] digits = {'0','1','2','3','4','5','6','7','8','9'};
		for(int i = 0; i < 10; i++){
			if(c == digits[i])
				return true;
		}
		return false;
	}
	private static boolean IsNumber(String str){
		for(int i = 0; i < str.length(); i++){
			if(!IsDigit(str.charAt(i)))
				return false;
		}
		return true;
	}
	private static boolean IsEndOfSentence(String str){
		char[] punctuation = {'.',':',';','?','!'};
			for(int i = 0; i < 5; i++){
				if(str.charAt(str.length()-1) == punctuation[i])
					return true;
			}
			return false;
	}
	private static int SyllableCounter(String str){
		int numSyll = 0;
		for(int i = 0; i < str.length(); i++){
			if(IsVowel(str.charAt(i)) && i != 0){
				if(!(IsVowel(str.charAt(i-1)))){
					numSyll++;
				}
			}
			if(IsVowel(str.charAt(i)) && i == 0){
				numSyll++;
			}
		}
		if(str.charAt(str.length()-1) == 'e')
			numSyll--;
		if(numSyll == 0)
			numSyll++;
		return numSyll;
	}
	private static boolean IsVowel(char c){
		char[] vowels = {'a','e','i','o','u','y'};
		for(int i = 0; i < 6; i++){
			if(c == vowels[i])
				return true;
		}
		return false;
	}
	private static void FleschIndex(int numW, int numSen, int numSyl){
		System.out.println(numW + " " + numSen + " " + numSyl);
		double a = ((double)numSyl/(double)numW);
		double b = ((double)numW/(double)numSen);
	
		double index = (206.835 - (84.6*a) - (1.015*b));
		double grade = ((11.8*a) + (0.39*b) - 15.59);

		System.out.println("The Flesch Readability Index for this document is: " + (int)index);
		System.out.printf("The Flesch-Kincaid Grade Level Index for this document is: %.1f", grade);
		System.out.println();
	}
}

#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <vector>
#include <iomanip>

using namespace std;

bool IsDigit(char c);
bool IsNumber(string str);
bool IsEndOfSentence(string str);
int SyllableCounter(string str);
bool IsVowel(char c);
void FleschIndex(int numW, int numSen, int numSyl);

int main(int argc, char *argv[]){
	string line;
	int numWords = 0;
	int numSentences = 0;
	int numSyllables = 0;
	ifstream myInput(argv[1]);
	if(myInput.is_open()){
		while(getline(myInput, line)){
			line.push_back(' ');
			vector<string> wordsInLine;
			int j = 0;
			for(int i = 0; i < line.size(); i++){
				if(line[i] == ' '){
					string test = line.substr(j, (i-j));
					if((!(test[0] == ' ')) && !(IsNumber(test))){
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
		cout << argv[1] << endl;
		FleschIndex(numWords, numSentences, numSyllables);
		cout << endl;
		myInput.close();
	}
	else
		cout << "Unable to open file";
}
bool IsDigit(char c){
	//Function to determine whether a selected char is a digit. Returns true if charicter is a digit from 0-9
	char digits[] = {'0' , '1', '2', '3', '4', '5', '6', '7', '8', '9'};
	for(int i = 0; i < 11; i++){
		if(c == digits[i])
			return true;
	}
	return false;
}
bool IsNumber(string str){
	//Function to determine wheter a selected string is a number. Returns true if the string is a number
	for(int i = 0; i < str.size(); i++){
		if(!IsDigit(str[i]))
			return false;
	}
	return true;
}
bool IsEndOfSentence(string str){
	//Function to recognize if the word is at the end of a sentence. Returns true if punctuation is found.
	char punctuation[] = {'.', ':',';','?','!'};
		for(int i = 0; i < 6; i++){
			if(str.back() == punctuation[i])
				return true;
		}
		return false;
}
int SyllableCounter(string str){
	//Function to count the number of syllables in a given word. Return the number of syllables found.
    int numSyll=0;
    for(int i = 0; i < str.size(); i++){
        if(IsVowel(str[i]) && i != 0){  //Ensures a the previous term is not a vowel
            if(!(IsVowel(str[i-1]))){
                numSyll++;
            }
        }	
        if(IsVowel(str[i]) && i == 0){
			numSyll++;
        }
    }
    if(str.back() == 'e') //Omits a syllable if the word ends in e
    	numSyll--;
    if(numSyll == 0) //All words must have 1 syllable. This ensures the function never returns a value of 0
    	numSyll++;
    return numSyll;
}
bool IsVowel(char c){
	//Function to determine if the given character c is a vowel for use in SyllableCounter(string str).
	tolower(c);
    char vowels [] = {'a','e','i','o','u','y'};
    for(int i = 0; i < 6; i++){
        if(c == vowels[i]){
            return true;
        }
    }
    return false;
}
void FleschIndex(int numW, int numSen, int numSyl){
	//Computes and prints out the Flesch Index/Grade for the given document. 
	cout << numW << " " << numSen << " " << numSyl << endl;
	double a = ((double)numSyl/(double)numW);
	double b = ((double)numW/(double)numSen);
	
	double index = (206.835 - (84.6*a) - (1.015*b));
	double grade = ((11.8*a) + (0.39*b) -15.59);
	cout << "The Flesch Readability Index for this document is: " << (int)index << endl;
	cout << fixed;
	cout << setprecision(1);
	cout << "The Flesch-Kincaid Grade Level Index for this document is: " << grade << endl;

}

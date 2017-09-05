#include <iostream>
#include <stdio.h>
#include <ctype.h>

using namespace std;

int SyllableCounter(string str);
bool IsVowel(char c);

int main(){
    cout << "What word would you like to test?" << endl;
    string testword;
    cin >> testword;

    cout << testword << " has " << SyllableCounter(testword) << " syllables!" << endl;
}

int SyllableCounter(string str){
	//cout << "SyllableCounter iterates..." << endl;
    int numSyll=0;
    for(int i = 0; i < str.size(); i++){
    	//cout << "	Testing Char " << str[i] << endl;
        if(IsVowel(str[i]) && i != 0){
            if(!(IsVowel(str[i-1]))){
            	//cout << "	SYLLABLE FOUND!" << endl;
                numSyll++;
            }
        }	
        if(IsVowel(str[i]) && i == 0){
        	//cout << "	SYLLABLE FOUND!" << endl;
			numSyll++;
        }
    }
    if(str.back() == 'e')
    	numSyll--;
    if(numSyll == 0)
    	numSyll++;
    return numSyll;
}
bool IsVowel(char c){
	tolower(c);
	//cout << "IsVowel iterates..." << endl;
    char vowels [] = {'a','e','i','o','u','y'};
    for(int i = 0; i < 6; i++){
        if(c == vowels[i]){
        	//cout << "	IsVowel returns true!" << endl;
            return true;
        }
    }
    //cout << "	IsVowel Returns false!" << endl;
    return false;
}

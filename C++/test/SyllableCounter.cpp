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
    int numSyll=0;
    for(int i = 0; i < str.size(); i++){
        if(IsVowel(str[i]) && i != 0){
            if(!(IsVowel(str[i-1]))){
                numSyll++;
            }
        }	
        if(IsVowel(str[i]) && i == 0){
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
    char vowels [] = {'a','e','i','o','u','y'};
    for(int i = 0; i < 6; i++){
        if(c == vowels[i]){
            return true;
        }
    }
    return false;
}

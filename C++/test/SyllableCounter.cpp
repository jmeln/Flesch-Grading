#include<iostream>

using namespace std;

private int SyllableCounter(string str);
bool IsVowel(char c);

int main(){
    cout << "What word would you like to test?" << endl;
    string testword;
    cin >> testword;
    
    cout << testword << endl;
}

private int SyllableCounter(string str){
    int numSyll=0;
    for(int i = 0; i < str.size(); i++){
        if(IsVowel(str[i]) && i-1 > -1){
            if(IsVowel(str[i]) && !(IsVowel(str[i-1])))
                numSyll++;
        }
    }
}
bool IsVowel(char c){
    char vowels [] = {'a','e','i','o','u','y'};
    for(int i = 0; i < 6; i++){
        if(c == vowels[i])
            return true;
    }
    return false;
}

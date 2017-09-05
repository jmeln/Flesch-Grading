#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <vector>

using namespace std;

//vector<string>* LineParser(string str);
bool IsDigit(char c);

int main(int argc, char *argv[]){
	string line;
	int numWords = 0;
	int numSentences = 0;
	ifstream myInput(argv[1]);
	if(myInput.is_open()){
		while(getline(myInput, line)){
			line.push_back(' ');
			vector<string> wordsInLine;
			int j = 0;
			for(int i = 0; i < line.size(); i++){
				if(line[i] == ' '){
					wordsInLine.push_back(line.substr(j, (i-j)));
					j = i+1;
				}
			}
			for(int i = 0; i < wordsInLine.size(); i++){
				cout << wordsInLine[i] << endl;
			}
			//cout << wordsInLine << endl;
		}
		myInput.close();
	}
	else
		cout << "Unable to open file";
}
/*vector<string>* LineParser(string str){
	vector<string> returnVector;
	int j = 0;
	for(int i = 0; i < str.size(); i++){
		if(str[i] == ' '){
			returnVector.push_back(str.substr(j,(i-1-j)));
			j = i+1;
		}
	}
	return returnVector;
}*/
bool IsDigit(char c){
	char digits[] = {'0' , '1', '2', '3', '4', '5', '6', '7', '8', '9'};
	for(int i = 0; i < 11; i++){
		if(c == digits[i])
			return true;
	}
	return false;
}

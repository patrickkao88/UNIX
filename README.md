# UNIX
Input the commands below:

<step1>
sh project.sh

<sample output>




<note>

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
<step2>
perl project2.pl

<sample output>
File's name:1.cpp

Sample code:
#include<iostream>
 using namespace std;
 int main()
 {
 	int floor[20][20];
 	int direction = 0;
 	int position[2] = { 0,0 };
 	bool pendown = false;
 	int choice;
 	cout << "Enter command(9 to end input:";
 	while (cin >> choice)
 	{
 		if (choice == 1)
 		{
 			pendown = false;
 		}
 		else if (choice == 2)
 		{
 			pendown = true;
 		}
 		else if (choice == 3)
 		{
 			(direction == 3) ? direction = 0 : direction++;
 		}
 		else if (choice == 4)
 		{
 			(direction == 0) ? direction = 3 : direction--;
 		}
 		else if (choice == 5)
 		{
 			int step;
 			cin >> step;
 			while (step > 0)
 			{
 				if (direction == 0 && position[1] < 20)
 					position[1]++;
 				else if (direction == 1 && position[0] < 20)
 					position[0]++;
 				else if (direction == 2 && position[1] >= 0)
 					position[1]--;
 				else if (direction == 3 && position[0] >= 0)
 					position[0]--;
 
 				if (pendown)
 				{
 					floor[position[0]][position[1]] = 1;
 				}
 				step--;
 			}
 		}
 		else if (choice == 6)
 		{
 			for (int i = 0; i < 20; i++)
 			{
 				for (int j = 0; j < 20; j++)
 				{
 					if (floor[i][j] == 1)
 						cout << "* ";
 					else
 						cout << "  ";
 				}
 				cout << endl;
 			}
 		}
 		else if (choice == 9)
 		{
 			break;
 		}
 		
 	}
 	system("pause");
 }
 
Total lines(Ignore annotation,tab,{,}):43
---------------------------------------------------------------------------------------------------------------
File's name:2.cpp

The copy percentage : 88.3720930232558 %
The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! 
Total lines(Ignore annotation,tab,{,}):42
---------------------------------------------------------------------------------------------------------------
File's name:3.cpp

The copy percentage : 74.4186046511628 %
The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! 
Total lines(Ignore annotation,tab,{,}):37
---------------------------------------------------------------------------------------------------------------
File's name:4.cpp

The copy percentage : 72.0930232558139 %
The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! 
Total lines(Ignore annotation,tab,{,}):35
---------------------------------------------------------------------------------------------------------------
File's name:5.cpp

The copy percentage : 81.3953488372093 %
The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! 
Total lines(Ignore annotation,tab,{,}):43
---------------------------------------------------------------------------------------------------------------
File's name:6.cpp

The copy percentage : 81.3953488372093 %
The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! 
Total lines(Ignore annotation,tab,{,}):43
---------------------------------------------------------------------------------------------------------------
File's name:notcopy.cpp

The copy percentage : 32.5581395348837 %
The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! 
Total lines(Ignore annotation,tab,{,}):14
---------------------------------------------------------------------------------------------------------------

<note>
To compiler and execute the project2.pl, and you will get the copy probability of all the .cpp files.
It will show the code of first file first, and then show the file's name,caculate the lines in the files( ignored annotation, tab , single "{", and single "}"), and print the copy probability.














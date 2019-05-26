#include<iostream>
using namespace std;
int main()
{
	int r[20][20];
	int  ejfiosjf = 0;
	int psefsff[2] = { 0,0 };
	bool pseffes = false;
	int cseffsefsfe;
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
		
		else if (choice == 9)
		{
			break;
		}
		
	}
	system("pause");
}


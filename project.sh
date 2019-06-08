#!/bin/bash
PATH=/home/leoc/bin:/home/leoc/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH
count=0              	#count ex times
prob=0
cif=9999
cwhile=9999
cfor=9999		#probability of copy
for entry in *.cpp ;do							#for files of .cpp
	READFILE=$entry
	
	if [ $count -eq 0 ]						#if is first time let it be sample
	then
		fif=$(cat $READFILE | grep -o "if" | wc -l)    		#first time if count
		fwhile=$(cat $READFILE | grep -o "while" | wc -l)  	#first while count
		ffor=$(cat $READFILE | grep -o "for" | wc -l)  		#first for
		echo "sample"
	else
		cif=$(cat $READFILE | grep -o "if" | wc -l)     	#other times
		cwhile=$(cat $READFILE | grep -o "while" | wc -l)
		cfor=$(cat $READFILE | grep -o "for" | wc -l)
	fi
	echo "檔名:$READFILE"
	echo "if:"
	cat $READFILE | grep -o "if" | wc -l   				#if 統計
	echo "while:"
	cat $READFILE | grep -o "while" | wc -l    			#while 統計
	echo "for:"
	cat $READFILE | grep -o "for" | wc -l    			#for 統計	
	grep  'int [^ijm][^=a][^i][^n]' $READFILE    			# 把for loop中的 int i,j 和int main() 去除
	grep  'bool [^ijm][^=a][^i][^n]' $READFILE   
	grep  'char [^ijm][^=a][^i][^n]' $READFILE  
        grep  'string [^ijm][^=a][^i][^n]' $READFILE            
	if [ $cif -eq $fif ]          					# 比對 如果跟第一次比 if 次數一樣 可能性+1
	then
		prob=`expr $prob + 1`
		
	fi
	if [ $cwhile = $fwhile ]
	then
		prob=`expr $prob + 1`
		
	fi
	if [ $cfor -eq $ffor ]
	then
		prob=`expr $prob + 1`
		
	fi
	if [ $prob -gt 1  ]   					#如果可能性比1大 就判定可能抄襲
	then
		if [ $count -ne 0 ]
		then		
			echo "這份作業很可能抄襲！！"
			echo "可能性：$prob"
		fi	
	fi
	count=`expr $count + 1`
	echo "第$count份"
	echo "............................................."
	prob=0
done

#!/usr/bin/perl -w

@file=glob "*.cpp";
$samplecounter=0;									#counting the lines in the first file
$filecounter=0;										#counting the .cpp file in the folder
while( $file[$filecounter] ){
	open(FILE, $file[$filecounter]) or die "Can't open file: $!\n";			#if there was error appeared during opening the file, it will print the message
	
	print "File's name:$file[$filecounter]\n\n";	
	if($filecounter==0){								#action of first file
		@sample=<FILE>;
		print "Standard code:\n@sample";
		
		foreach my $file_line (@sample) 
		{	
			if($file_line =~ /^\s*$/){					#remove \n in the file	
			}
			elsif($file_line =~ /[\S\s]*\/\/[\S\s]*/){			#remove annotation "//" in the file
				if($file_line =~ /[\S\s][\S\s]*\/\/[\S\s]*/){
					$file_line =~ s/\s*\/\/[\S\s]*//g;
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			elsif($file_line =~ /[\S\s]*\/\*[\S\s]*\*\//){			#remove annotation "/**/" in the file
				if($file_line =~ /[\S\s][\S\s]*\/\*[\S\s]*\*\//){
					$file_line =~ s/\s*\/\*[\S\s]*\*\/\s*//g;
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			elsif($file_line =~ /\{/){					#remove single "{"
				if($file_line =~ /\S\S*\{/ or $file_line =~ /\{\S\S*/){
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			elsif($file_line =~ /\}/){					#remove single "}"
				if($file_line =~ /\S\S*\}/ or $file_line =~ /\}\S\S*/){
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			else{							
				$file_line =~ s/\s*$//g;
				$file_line =~ s/^\s*//g;
				push(@standard,$file_line);
				$samplecounter++;
			}
		}
		print "Total lines(Ignore annotation,tab,{,}):$samplecounter\n---------------------------------------------------------------------------------------------------------------\n";

		$filecounter += 1;							
		close(FILE);
	}
	else{										#action of the others files
		@comparison=();								#init array
		$testcounter=0;								#init the counter
		$alike=0;
		@test=<FILE>;
		foreach my $file_line (@test) 
		{	
			if($file_line =~ /^\s*$/){					#remove \n in the file
			}
			elsif($file_line =~ /[\S\s]*\/\/[\S\s]*/){			#remove annotation "//" in the file
				if($file_line =~ /[\S\s][\S\s]*\/\/[\S\s]*/){
					$file_line =~ s/\s*\/\/[\S\s]*//g;
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			elsif($file_line =~ /[\S\s]*\/\*[\S\s]*\*\//){			#remove annotation "/**/" in the file
				if($file_line =~ /[\S\s][\S\s]*\/\*[\S\s]*\*\//){
					$file_line =~ s/\s*\/\*[\S\s]*\*\/\s*//g;
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			elsif($file_line =~ /\{/){
				if($file_line =~ /\S\S*\{/ or $file_line =~ /\{\S\S*/){	#remove single "{"
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			elsif($file_line =~ /\}/){
				if($file_line =~ /\S\S*\}/ or $file_line =~ /\}\S\S*/){	#remove single "}"
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			else{
				$file_line =~ s/\s*$//g;
				$file_line =~ s/^\s*//g;
				push(@comparison,$file_line);
				$testcounter++;
			}
		}

		for($i=0;$i<$testcounter;$i++){						#first file compare to the others files
			for($j=0;$j<$samplecounter;$j++){
				if($comparison[$i] eq $standard[$j]){
					$alike++;
				}
			}
		}
		$result=100*$alike/$samplecounter;
		print "The copy percentage : $result %\n";
		
		if($result >= 60 && $result < 80){
			print "The copy probability : PRETTY HIGH ! ! \n\n";
		}
		elsif($result >= 80){
			print "The copy probability : GOD DAMN HIGH ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! \n\n";
		}
		else{
			print "The copy probability : LET HIM PASS ! ! \n\n"
		}

		print "Total lines(Ignore annotation,tab,{,}):$testcounter\n---------------------------------------------------------------------------------------------------------------\n";
		$filecounter += 1;
		close(FILE);
	}

	
}








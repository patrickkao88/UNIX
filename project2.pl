#!/usr/bin/perl -w

@file=glob "*.cpp";
$samplecounter=0;
$filecounter=0;
while( $file[$filecounter] ){
	open(FILE, $file[$filecounter]) or die "Can't open file: $!\n";
	print "File's name:$file[$filecounter]\n\n";	
	if($filecounter==0){	
		@sample=<FILE>;
		print "Standard code:\n@sample";
		foreach my $file_line (@sample) 
		{	
			if($file_line =~ /^\s*$/){					#for \n	
			}
			elsif($file_line =~ /[\S\s]*\/\/[\S\s]*/){			#for //
				if($file_line =~ /[\S\s][\S\s]*\/\/[\S\s]*/){
					$file_line =~ s/\s*\/\/[\S\s]*//g;
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			elsif($file_line =~ /[\S\s]*\/\*[\S\s]*\*\//){			#for /**/
				if($file_line =~ /[\S\s][\S\s]*\/\*[\S\s]*\*\//){
					$file_line =~ s/\s*\/\*[\S\s]*\*\/\s*//g;
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			elsif($file_line =~ /\{/){
				if($file_line =~ /\S\S*\{/ or $file_line =~ /\{\S\S*/){
					push(@standard,$file_line);
					$samplecounter++;
				}
			}
			elsif($file_line =~ /\}/){
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
	else{
		@comparison=();
		$testcounter=0;
		$alike=0;
		@test=<FILE>;
		foreach my $file_line (@test) 
		{	
			if($file_line =~ /^\s*$/){					#for \n	
			}
			elsif($file_line =~ /[\S\s]*\/\/[\S\s]*/){			#for //
				if($file_line =~ /[\S\s][\S\s]*\/\/[\S\s]*/){
					$file_line =~ s/\s*\/\/[\S\s]*//g;
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			elsif($file_line =~ /[\S\s]*\/\*[\S\s]*\*\//){			#for /**/
				if($file_line =~ /[\S\s][\S\s]*\/\*[\S\s]*\*\//){
					$file_line =~ s/\s*\/\*[\S\s]*\*\/\s*//g;
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			elsif($file_line =~ /\{/){
				if($file_line =~ /\S\S*\{/ or $file_line =~ /\{\S\S*/){
					push(@comparison,$file_line);
					$testcounter++;
				}
			}
			elsif($file_line =~ /\}/){
				if($file_line =~ /\S\S*\}/ or $file_line =~ /\}\S\S*/){
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

		for($i=0;$i<$testcounter;$i++){
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








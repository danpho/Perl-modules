#use to trunck the last hidden symbol, like \n, and remove the redundent space at the beginning and end.
# Created by:			2017-10-22 10:33
# Last modified:	2018-08-22 15:41
# Filename:				tm.pm
# Copyright@Liaoyuan Wang (wly_ustc@hotmail.com)
package tm;

use strict;
use warnings;
use sys_perl;
use Term::ANSIColor;

#remove the spaces at the very beginning and end
sub trim 
{
  my ($sub_line)=@_;
  chomp($sub_line);
  $sub_line=~ s/^\s+|\s+$//g;
  return $sub_line;
}

#if file exists, in case of overwriting,
#backup file with timestamp
sub rename
{
  my ($sub_file)=@_;
  chomp($sub_file);$sub_file=~ s/^\s+|\s+$//g;
  $_=$sub_file;
  if(-e $sub_file)
  { my $sub_time=`date "+%F %T"`;$sub_time= ~s/\s+|:/_/g;
    use POSIX 'strftime';
    $sub_time= strftime '%Y%m%d%T',localtime;$sub_time=~ s/^\s+|\s+$//g;$sub_time=~ s/\s+|:/_/g;
    $_=~ s/\.dat/_$sub_time.dat/g;
    system("mv $sub_file $_");
    print colored("\n$sub_file","bold cyan")," exists. It has been rename to ",colored("$_.\n","bold magenta");
    print "\n$sub_file exists. It has been rename to $_.\n";
#    return $sub_file;
  }
}#end sub rename

sub first_indx
{
  my ($sub_value,@values)=@_;
  chomp($sub_value,@values);
  my $i=0; 
  while ($i<=$#values)
  {        
   if ($values[$i] ==  $sub_value) {return $i; exit;}
   else{$i++;next;}
  }#end  while ($i<=$#values)
  if($i>$#values){$i=-1;}
  return $i;
}


1;

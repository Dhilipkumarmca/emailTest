#!/usr/bin/perl

use strict;
use warnings;
use CGI;

my $ref=new CGI;

print "Content-type:text/html\n\n";
my $email=$ref->param("email");
#print "email:$email\n";
my $sub=$ref->param("sub");
#print "sub:$sub\n";
my $msg=$ref->param("msg");
#print "msg:$msg\n";

system("javac -cp /usr/lib/cgi-bin/emailjava/java/mail.jar:/usr/lib/cgi-bin/emailjava/java/activation.jar /usr/lib/cgi-bin/emailjava/java/SendEmail.java");
my $javaArgs = "-cp /usr/lib/cgi-bin/emailjava/java/mail.jar:/usr/lib/cgi-bin/emailjava/java/activation.jar:/usr/lib/cgi-bin/emailjava/java";
my $className = "SendEmail";
my $javaCmd = "java ".$javaArgs." ".$className." ".join(' ', ($email,$sub,$msg));
#my $javaCmd = "java ".$javaArgs." ".$className." ".join(' ', ("dhilipmcakumar\@gmail.com","hai","hello"));
my $res=`$javaCmd`;

chomp($res);

if($res eq "Done")
{
	print "Message sent successfully\n";
}
else
{
	print "Unable to send mail, please check your internet connection\n";
}


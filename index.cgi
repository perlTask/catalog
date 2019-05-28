#!/usr/bin/perl -w

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
use Data::Dumper;
use File::Basename qw(dirname);
use lib dirname(__FILE__);

$|=1;
ReadParse();
print "Content-type: text/html; charset=utf-8\n\n";
print Dumper(\%ENV);

unless (%in)
{
    open my $fh, "< index.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
}
else
{
     print Dumper(\%in);
}

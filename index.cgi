#!/usr/bin/perl -w

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
use Data::Dumper;
use File::Basename qw(dirname);
use lib dirname(__FILE__);
use App::Views::MainView;


$|=1;
ReadParse();
print "Content-type: text/html; charset=utf-8\n\n";
$url = $ENV{'REQUEST_URI'};

#print $url;

my @path = split('/', $url);
my $file_example = $path[-1];
my @file_arr = split('\?', $file_example);
my $file = $file_arr[0];
my $query = $file_arr[1];

print $file;

if ($file eq "genres.html")
{
    open my $fh, "< templates/genres.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
} elsif ($file eq "bookinfo.html")
{
    open my $fh, "< templates/bookinfo.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
} elsif ($file eq "authors.html")
{
    open my $fh, "< templates/authors.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
} elsif ($file eq "books.html")
{
    open my $fh, "< templates/books.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
} else {
    open my $fh, "< templates/404.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
}

# if ($file == "")
# {
#     open my $fh, "< templates/books.html";
#     local $/ = undef;
#     my $html = <$fh>;
#     close $fh;
#     print $html;
# }



#print $file;
#print $query;



print "<pre>";
print Dumper(\%ENV);
#print Dumper(@path);
#print $path[-1];
print "</pre>";



# unless (%in)
# {
#     open my $fh, "< index.html";
#     local $/ = undef;
#     my $html = <$fh>;
#     close $fh;
#     print $html;
# }
# else
# {
#      print Dumper(\%in);
# }

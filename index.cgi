#!/usr/bin/perl -w

#created by user6

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
use Data::Dumper;
use File::Basename qw(dirname);
use lib dirname(__FILE__);
use App::Views::MainView;
use App::Views::BooksView;
use App::Views::GenresView;
use App::Views::AuthorsView;


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
    my $genresView = new App::Views::GenresView->new();
    $genresView->generate();
} elsif ($file eq "bookinfo.html")
{
    open my $fh, "< templates/bookinfo.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
} elsif ($file eq "authors.html")
{
    my $authorsView = new App::Views::AuthorsView->new();
    $authorsView->generate();
} elsif ($file eq "")
{
    my $mainView = new App::Views::MainView->new();
    $mainView->generate();
} elsif ($file eq "books.html")
{
    my $booksView = new App::Views::BooksView->new();
    # if ($self->{'query'})
    # {
    #     Here will be query
    # }
    $booksView->generate();
} else {
    open my $fh, "< templates/404.html";
    local $/ = undef;
    my $html = <$fh>;
    close $fh;
    print $html;
}

print "<pre>";
print Dumper(\%ENV);
print "</pre>";
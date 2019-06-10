#!/usr/bin/perl -w

#created by user6

use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
use Data::Dumper;
use File::Basename qw(dirname);
use lib dirname(__FILE__);
use Scalar::Util qw(looks_like_number);
use App::Views::MainView;
use App::Views::BooksView;
use App::Views::GenresView;
use App::Views::AuthorsView;
use App::Views::BookInfoView;
use App::Views::Error404View;
use App::Controllers::MainController;


$|=1;
ReadParse();
print "Content-type: text/html; charset=utf-8\n\n";
$url = $ENV{'REQUEST_URI'};

#print $url;

my @path = split('/', $url);
my $file_example = $path[-1];
my @file_arr = split('\?', $file_example);
my $file = $file_arr[0];
#my $query = $file_arr[1];

# print $file;

if ($file eq "genres.html")
{
    my $genresController = new App::Controllers::MainController->new();
    my $genresView = new App::Views::GenresView->new();
    my $genresStatement = $genresController->getGenresController();
    $genresView->generate($genresStatement);
} elsif ($file eq "bookinfo.html" and $in{'id'} and looks_like_number($in{'id'}))
{
    my $bookInfoController = new App::Controllers::MainController->new();
    my $bookinfoView = new App::Views::BookInfoView->new();
    my $infoStatement = $bookInfoController->getBookInfoController($in{'id'});
    $bookinfoView->generate($infoStatement);
} elsif ($file eq "authors.html")
{
    my $authorsController = new App::Controllers::MainController->new();
    my $authorsView = new App::Views::AuthorsView->new();
    my $authorsStatement = $authorsController->getAuthorsController();
    $authorsView->generate($authorsStatement);
} elsif ($file eq "")
{
    my $mainView = new App::Views::MainView->new();
    $mainView->generate();
} elsif ($file eq "books.html")
{
    my $booksController = new App::Controllers::MainController->new();
    my $booksView = new App::Views::BooksView->new();
    if ($in{'author'} and looks_like_number($in{'author'}))
    {
        my $booksStatement = $booksController->getBooksController('author', $in{'author'});
        if ($booksStatement)
        {
            $booksView->generate($booksStatement);
        }
    }
    elsif ($in{'genre'} and looks_like_number($in{'genre'}))
    {
        my $booksStatement = $booksController->getBooksController('genre', $in{'genre'});
        if ($booksStatement)
        {
            $booksView->generate($booksStatement);
        }
    } else {
        my $booksStatement = $booksController->getBooksController();
        $booksView->generate($booksStatement);
    }
    
} else {
    my $Error404View = new App::Views::Error404View->new();
    $Error404View->generate();
}

# print "<pre>";
# print Dumper(\%ENV);
# print "</pre>";
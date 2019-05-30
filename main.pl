#!/usr/bin/perl

use DBI;
use App::Models::BooksModel;
my $obj = App::Models::BooksModel->new();
$obj->getAllBooks();
$obj->getBooksByGenre('2');
$obj->getBooksByAuthor('1');

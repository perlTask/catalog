#!/usr/bin/perl

use DBI;
use App::Models::BooksModel;
my $obj = App::Models::BooksModel->new();
$obj->selec();

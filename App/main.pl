#!/usr/bin/perl

use DBI;
use App::Model::BooksModel;
my $obj = App::Model::BooksModel->new();
$obj->selec();

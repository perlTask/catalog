#!/usr/bin/perl -w

#created by user6

package App::Controllers::MainController;

use strict;
use Data::Dumper;
# use App::Controllers::BooksController;
# use App::Controllers::AuthorsController;
# use App::Controllers::GenresController;
# use App::Controllers::BookInfoController;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class)
}

sub getBooksController
{
    my ($self, $query) = @_;
    # my $books = new App::Controllers::BooksController->new();
    if (!$query)
    {
        my $allBooks = $books->getAllBooks();
        return $allBooks;
    } elsif ($query[0] eq "genre")
    {
        my $booksByGenre = $books->getBooksByGenre($query[1]);
        return $booksByGenre;
    } elsif


}



return 1;
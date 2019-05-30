#!/usr/bin/perl -w

#created by user6

package App::Controllers::MainController;

use strict;
use Data::Dumper;
use App::Controllers::BooksController;
use App::statements;
# use App::Controllers::AuthorsController;
# use App::Controllers::GenresController;
# use App::Controllers::BookInfoController;

my $statements;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    $self->{'statements'} = new App::statements->new();
    return bless($self, $class)
}

sub getBooksController
{
    my ($self, $query) = @_;
    my $books = new App::Controllers::BooksController->new();

    if (!$query)
    {
        my @allBooks = $books->getAllBooks();
        print "<pre>";
        #print Dumper(@allBooks);
        print "</pre>";
        $self->{'statements'}->setData(\@allBooks);
        return $self->{'statements'};
    }
    # } elsif ($query[0] eq "genre")
    # {
    #     my $booksByGenre = $books->getBooksByGenre($query[1]);
    #     return $booksByGenre;
    # } elsif


}



return 1;
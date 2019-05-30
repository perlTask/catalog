#!/usr/bin/perl -w

package App::Controllers::BooksController;

use App::Models::BooksModel;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class)
}

sub getAllBooks
{
    my ($self) = @_;
    my $booksModel = new App::Models::BooksModel->new();
    my @allBooks = $booksModel->selec();
    return @allBooks;
}


return 1;
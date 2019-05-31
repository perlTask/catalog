#!/usr/bin/perl -w

#created by user10

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
    my $Model = new App::Models::BooksModel->new();
    my @arr = $Model->getAllBooks();
    return @arr;
}

sub getBooksByGenre
{
    my ($self, $key) = @_;
    my $Model = new App::Models::BooksModel->new();
    my @arr = $Model->getBooksByGenre($key);
    return @arr;
}

sub getBooksByAuthor
{
    my ($self, $key) = @_;
    my $Model = new App::Models::BooksModel->new();
    my @arr = $Model->getBooksByAuthor($key);
    return @arr;
}


return 1;

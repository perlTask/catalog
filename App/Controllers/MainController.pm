#!/usr/bin/perl -w

#created by user6

package App::Controllers::MainController;

use strict;
use Data::Dumper;
use App::Controllers::BooksController;
use App::statements;
use App::Controllers::GenresController;
use App::Controllers::AuthorsController;
use App::Controllers::BookInfoController;

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
    my ($self, $query, $id) = @_;
    my $books = new App::Controllers::BooksController->new();

    if (!$query)
    {
        my @allBooks = $books->getAllBooks();
        # print "<pre>";
        # print Dumper(@allBooks);
        # print "</pre>";
        $self->{'statements'}->setData(\@allBooks);
        #print $self->{'statements'}->getData();
        return $self->{'statements'};
    } elsif ($query eq "author")
    {
        my @booksByAuthor = $books->getBooksByAuthor($id);
        # print "<pre>";
        # print Dumper(@booksByAuthor);
        # print "</pre>";
        $self->{'statements'}->setData(\@booksByAuthor);
        return $self->{'statements'};
    }elsif ($query eq "genre")
    {
        my @booksByGenres = $books->getBooksByGenre($id);
        # print "<pre>";
        # print Dumper(@booksByAuthor);
        # print "</pre>";
        $self->{'statements'}->setData(\@booksByGenres);
        return $self->{'statements'};
    }
}

sub getGenresController
{
    my ($self, $query, $id) = @_;
    my $genresController = new App::Controllers::GenresController->new();
    my @genres = $genresController->getGenres();
    $self->{'statements'}->setData(\@genres);
    return $self->{'statements'};
}

sub getAuthorsController
{
    my ($self, $query, $id) = @_;
    my $authorsController = new App::Controllers::AuthorsController->new();
    my @authors = $authorsController->getAuthors();
    $self->{'statements'}->setData(\@authors);
    return $self->{'statements'};
}

sub getBookInfoController
{
    my ($self, $id) = @_;
    my $bookInfoController = new App::Controllers::BookInfoController->new();
    my @info = $bookInfoController->getBookInfo($id);
    $self->{'statements'}->setData(\@info);
    return $self->{'statements'};
}

return 1;
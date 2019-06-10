#!/usr/bin/perl

# created by user2

package App::Models::BooksModel;

use strict;
use vars qw(@ISA);
use App::Models::MainModel;
@ISA=qw(App::Models::MainModel);
#use Data::Dumper;

sub getAllBooks 
{
    my ($self) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT id, title, description, price FROM books');
    $sth->execute();
    my @DATA = ();
    while(my $row=$sth->fetchrow_hashref())
    {
        push @DATA, $row;
    }
    # print Dumper(\@DATA);
    $sth->finish();
    return @DATA;

}
sub getBooksByGenre 
{
    my ($self, $genre) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT b.id, title, description, price, genre FROM books b
        JOIN books_genres  ON (books_genres.bookID=b.id) 
        JOIN genres  ON (books_genres.genreID=genres.id)
        WHERE genres.id='.$genre.'');
    $sth->execute();
    my @DATA = ();
    while(my $row=$sth->fetchrow_hashref())
    {
        push @DATA, $row;
    }
    # print Dumper(\@DATA);
    $sth->finish();
    return @DATA;

}
sub getBooksByAuthor
{
    my ($self, $id_author) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT b.id, title, description, price, author FROM books b
        JOIN books_authors ON (books_authors.bookID=b.id) 
        JOIN authors ON (books_authors.authorID=authors.id)
        WHERE authors.id='.$id_author.'');
    $sth->execute();
    my @DATA = ();
    while(my $row=$sth->fetchrow_hashref())
    {
        push @DATA, $row;
    }
    # print Dumper(\@DATA);
    $sth->finish();
    return @DATA;
}
1;


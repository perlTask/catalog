#!/usr/bin/perl

package App::Models::BookInfoModel;

use strict;
use vars qw(@ISA);
use App::Models::MainModel;
@ISA=qw(App::Models::MainModel);
#use Data::Dumper;

sub getBookInfo 
{
    my ($self, $id) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT b.id, title , description, price, genre, author FROM books b 
        JOIN books_genres bg ON (bg.bookID=b.id) 
        JOIN genres g ON (bg.genreID=g.id)
        JOIN books_authors ba ON (ba.bookID=b.id)
        JOIN authors a ON (ba.authorID=a.id)
        WHERE (b.id='.$id.')' );
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


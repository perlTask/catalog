#!/usr/bin/perl

package App::Models::BooksModel;

use strict;
use vars qw(@ISA);
use App::Models::MainModel;
@ISA=qw(App::Models::MainModel);
#use Data::Dumper;

sub selec
{
    my ($self) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT * FROM books');
    $sth->execute();
    my @DATA = ();
    while(my $row=$sth->fetchrow_hashref())
    {
        push @DATA, $row;
    }
    #print Dumper(\@DATA);
     $sth->finish();
    return @DATA;
    
}
1;


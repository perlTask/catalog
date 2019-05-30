#!/usr/bin/perl

package App::Models::GenresModel;

use strict;
use vars qw(@ISA);
use App::Models::MainModel;
@ISA=qw(App::Models::MainModel);
#use Data::Dumper;

sub getGenres 
{
    my ($self) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT id, genre FROM genres');
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


#!/usr/bin/perl

package App::Models::AuthorsModel;

use strict;
use vars qw(@ISA);
use App::Models::MainModel;
@ISA=qw(App::Models::MainModel);
#use Data::Dumper;

sub getAuthors 
{
    my ($self) = @_;
    my $sth=$self->{'dbh'}->prepare('SELECT id, author FROM authors');
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


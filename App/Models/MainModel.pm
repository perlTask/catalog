#!/usr/bin/perl

# created by user2

package App::Models::MainModel;

use DBI;
use Data::Dumper;
use strict;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $dsn = 'dbi:mysql:host=localhost;dbname=user2';
    my $user='user2';
    my $password='user2';
    my $dbh=DBI->connect($dsn, $user, $password, { RaiseError =>1, AutoCommit =>0});
    my $self={'dbh' => $dbh};

    return bless($self, $class);
}
sub DESTROY
{
    my ($self) = @_;
    $self->{'dbh'}->disconnect();
}
1;


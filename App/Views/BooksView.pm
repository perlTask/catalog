#!/usr/bin/perl -w

#created by user6

package App::Views::BooksView;

use strict;
use Data::Dumper;
use App::Models::FSModel;

my $html;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class)
}

sub generate
{
    my ($self) = @_;
    my $file = new App::Models::FSModel->new();
    $self->{'html'} = $file->parse('templates/books.html');
    print $self->{'html'};
}


return 1;
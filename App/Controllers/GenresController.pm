#!/usr/bin/perl -w

#created by user10

package App::Controllers::GenresController;

use App::Models::GenresModel;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class)
}

sub getGenres
{
    my ($self) = @_;
    my $Model = new App::Models::GenresModel->new();
    my @arr = $Model->getGenres();
    return @arr;
}

return 1;

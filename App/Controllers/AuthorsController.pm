#!/usr/bin/perl -w

#created by user10

package App::Controllers::AuthorsController;

use App::Models::AuthorsModel;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class)
}

sub getAuthors
{
    my ($self) = @_;
    my $Model = new App::Models::AuthorsModel->new();
    my @arr = $Model->getAuthors();
    return @arr;
}

return 1;
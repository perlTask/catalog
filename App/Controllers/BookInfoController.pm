#!/usr/bin/perl -w

#created by user10

package App::Controllers::BookInfoController;

use App::Models::BookInfoModel;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};
    return bless($self, $class)
}

sub getBookInfo
{
    my ($self) = @_;
    my $Model = new App::Models::BookInfoModel->new();
    my @arr = $Model->getBookInfo();
    return @arr;
}

return 1;
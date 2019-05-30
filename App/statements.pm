#!/usr/bin/perl

package App::statements;

use strict;
use JSON;
use Data::Dumper;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self={};
    my $data;

    return bless($self, $class);
}
sub setData
{
  #1. json
  my ($self) = $_[0];
  $self->{'data'} = encode_json($_[1]);

  #2. ref
  #my ($self) = $_[0];
  #$self->{'data'} = $_[1];
  #printf "reftype 2:%s\n", $self->{'data'};
}

sub getData
{
  #1. json
  my ($self) = @_;
  return decode_json($self->{'data'});

  #2. ref
  #my ($self) = @_;
  #return $self->{'data'};
}

1;

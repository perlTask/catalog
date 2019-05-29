#!/usr/bin/perl -w

#created by user6

package App::Models::FSModel;

my $staticEls;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};

    return bless($self, $class)
}

sub parse
{
    my ($self, $filename) = @_;
    open my $fh, "< index.html";
    local $/ = undef;
    $self->{'staticEls'} = <$fh>;
    close $fh;

    if ($filename)
    {
        open my $fh, "< " . $filename;
        local $/ = undef;
        my $content = <$fh>;
        close $fh;
        #print $books;
        $self->{'staticEls'} =~ s/\%CONTENT\%/$content/;
        return $self->{'staticEls'};
    }
}




return 1;
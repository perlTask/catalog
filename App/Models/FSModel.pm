#!/usr/bin/perl -w

#created by user6

package App::Models::FSModel;

use Data::Dumper;

my $staticEls;

sub new
{
    my $class = ref($_[0]) || $_[0];
    my $self = {};

    return bless($self, $class)
}

sub parse
{
    my ($self, $filename, $data) = @_;
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
        $content_html = "";
        my @arr = $data->getData();
        #print Dumper(@arr);
        foreach $item (@arr)
        {
            print Dumper($item);
            #$content_html .= "<li>" . $item{'title'} . ": " . $item{'description'} . ", cost " . $item{'price'} . "\$</li>";
        }
        $content =~ s/\%BOOKS\%/$content_html/;
        print $books;
        $self->{'staticEls'} =~ s/\%CONTENT\%/$content/;
        return $self->{'staticEls'};
    }
}




return 1;
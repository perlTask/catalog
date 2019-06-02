#!/usr/bin/perl -w

#created by user6
#created by user10

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

    open my $fh, "< " . $filename;
    local $/ = undef;
    my $content = <$fh>;
    close $fh;
    $content_html = "";

    my @arr;
    if (defined $data)
    {
<<<<<<< HEAD
        @arr = @{$data->getData()};
        print Dumper(@arr);
    }else
    {
        $filename = "404.html";
    }

    if ($filename as "books.html")
    {
=======
        open my $fh, "< " . $filename;
        local $/ = undef;
        my $content = <$fh>;
        close $fh;
        $content_html = "";
        my @arr = @{$data->getData()};
        # print Dumper(@arr);
>>>>>>> a202aa055b5c8ed9318df469c114750d12d73c1a
        foreach $item (@arr)
        {
            # print "<pre>";
            # print Dumper(%{$item});
            # print "</pre>";
            $content_html .= "<li>" . $item->{'title'} . ": " . $item->{'description'} . ", cost " . $item->{'price'} . "\$</li>";
        }
    }elsif ($filename as "authors.html")
    {
        foreach $item (@arr)
        {
            print Dumper(%{$item});
            #$content_html .= "<li>" . $item->{'title'} . ": " . $item->{'description'} . ", cost " . $item->{'price'} . "\$</li>";
        }        
    }
    elsif ($filename as "genres.html")
    {
        foreach $item (@arr)
        {
            print Dumper(%{$item});
            #$content_html .= "<li>" . $item->{'title'} . ": " . $item->{'description'} . ", cost " . $item->{'price'} . "\$</li>";
        }        
    }
    elsif ($filename as "bookinfo.html")
    {
        foreach $item (@arr)
        {
            print Dumper(%{$item});
            #$content_html .= "<li>" . $item->{'title'} . ": " . $item->{'description'} . ", cost " . $item->{'price'} . "\$</li>";
        }        
    }
    else
    {
        $content =~ s/\%BOOKS\%/$content_html/;
        #print $books;
        $self->{'staticEls'} =~ s/\%CONTENT\%/$content/;
        return $self->{'staticEls'};
    }
    $content =~ s/\%BOOKS\%/$content_html/;
    #print $books;
    $self->{'staticEls'} =~ s/\%CONTENT\%/$content/;
    return $self->{'staticEls'};
}


return 1;
#!/usr/bin/perl -w

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
        @arr = @{$data->getData()};
        #print Dumper(@arr);
    }else
    {
        $filename = "404.html";
    }

    if ($filename eq "templates/books.html")
    {
        foreach $item (@arr)
        {
            $content_html .= '<article>
                                <h2>Title: '.$item->{'title'}. '</h2>
                                <div class="article-desc">
                                    <p>Price:'.$item->{'price'}.'</p>
                                </div>
                                <div class="text-right">
                                    <a href="bookinfo.html?id='.$item->{'id'}.'" class="button btn-red">Read more</a>
                                </div>
                            </article>';
        }
    }elsif ($filename eq "templates/authors.html")
    {
        foreach $item (@arr)
        {
            $content_html .= '<article>
                                <h3>'.$item->{'author'}. '</h3>
                                <div class="text-right">
                                    <a href="books.html?author='.$item->{'id'}.'" class="button btn-red">author`s books</a>
                                </div>
                            </article>';
        }        
    }
    elsif ($filename eq "templates/genres.html")
    {
        foreach $item (@arr)
        {
            $content_html .= '<article>
                                <h3>'.$item->{'genre'}. '</h3>
                                <div class="text-right">
                                    <a href="books.html?genre='.$item->{'id'}.'" class="button btn-red">genre`s books</a>
                                </div>
                            </article>';
        }        
    }
    elsif ($filename eq "templates/bookinfo.html")
    {
        foreach $item (@arr)
        {
            $content_html .= '<article>
                                <h2>Book name</h2>
                                <div class="article-desc">
                                    <p>Author:'.$item->{'author'}.'</p>
                                    <p>Genre:'.$item->{'genre'}.'</p>
                                    <p>Description:'.$item->{'description'}.'</p>
                                    <p>Price:'.$item->{'price'}.'</p>
                                </div>
                                <div class="text-right">
                                    <a href="#" class="button btn-red">BUY</a>
                                </div>
                            </article>';
        }        
    }
    else
    {
        $content_html = "Content not found!";
    }
    $content =~ s/\%LIST_TEMPL\%/$content_html/;
    $self->{'staticEls'} =~ s/\%CONTENT\%/$content/;
    return $self->{'staticEls'};
}


return 1;
package read;

use nginx;
use strict;
use warnings; 

sub handler {
    my $r = shift;

    $r->send_http_header("application/json");
    return OK if $r->header_only;

    unless(open FILE, '/tmp/'.$r->uri) {
        die "Unable to find mock $r->uri";
    }

    while(my $line = <FILE>) {
       $r->print($line);
    }

    close FILE;

    return OK;
}

1;
__END__

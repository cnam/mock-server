package read;

use nginx;
use strict;
use warnings; 

sub handler {
    my $r = shift;
    my $filename = '/tmp/test.json';

    $r->send_http_header("application/json");
    return OK if $r->header_only;

    unless(open FILE, $filename) {
     die "Unable to open $filename";
    }

    while(my $line = <FILE>) {
       $r->print($line);
    }

    close FILE;

    return OK;
}

1;
__END__

package write;

use nginx;
use strict;
use warnings; 

sub handler {
    my $r = shift;

    if ($r->has_request_body(\&post)) {
        return OK;
    }

    $r->send_http_header("application/json");

    return OK;
}

sub post {
    my $r = shift;
    my $filename = '/tmp/test.json';

    $r->send_http_header("application/json");

    unless(open FILE, '>'.$filename) {
       die "Unable to create $filename";
    }

    print FILE $r->request_body;

    close FILE;

    $r->print('{"success":true}');

    return OK;
}

1;
__END__



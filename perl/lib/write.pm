package write;

use nginx;
use strict;
use warnings;
use JSON;
use File::Path;
use File::Basename;

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
    my $json = $r->request_body;
    my $encoded_data = decode_json($json);
    my $filename = $encoded_data->{request}->{uri};
    my $data = $encoded_data->{response}->{body};
    my $dir = dirname($filename);

    $r->send_http_header("application/json");

    mkpath('/tmp/'.$dir);

    unless(open FILE, '>/tmp/'.$filename) {
       die "Unable to create $filename";
    }

    print FILE encode_json $data;

    close FILE;

    $r->print('{"success":true}');

    return OK;
}

1;
__END__

// Author: William Selby
// A simple tcp listener in perl
#!/usr/bin/perl

use strict;
use IO::Socket;

# Define port to listen on
my $port = 1234;

# Create a TCP socket
my $socket = IO::Socket::INET->new(
    LocalPort => $port,
    Proto => 'tcp',
    Listen => 5,
    Reuse => 1
) or die "Could not create socket: $!\n";

# Listen for connections
while(my $client = $socket->accept()) {
    # Read data from the client
    my $data = <$client>;
    chomp($data);

    # Process data
    my $response = process_data($data);
    
    # Send response back to the client
    print $client $response;
    
    # Close client connection
    close $client;
}

# Close socket
close($socket);

sub process_data {
    my $data = shift;

    # Do something with the data
    # ...

    return $data;
}

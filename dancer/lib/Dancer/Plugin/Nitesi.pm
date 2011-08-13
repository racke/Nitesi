package Dancer::Plugin::Nitesi;

use 5.0006;
use strict;
use warnings;

use Nitesi::Cart;
use Dancer::Plugin;

=head1 NAME

Dancer::Plugin::Nitesi

=head1 VERSION

Version 0.0001

=cut

our $VERSION = '0.0001';

=head1 SYNOPSIS

    use Dancer::Plugin::Nitesi;

    cart->add({sku => 'ABC', name => 'Foobar', quantity => 1, price => 42});
    cart->items();

=head1 CONFIGURATION

=cut

my %carts;

register cart => sub {
    my $name;

    if (@_) {
	$name = shift;
    }
    else {
	$name = '';
    }

    unless (exists $carts{$name}) {
	$carts{$name} = Nitesi::Cart->new();
    }

    return $carts{$name};
};

register_plugin;

1;
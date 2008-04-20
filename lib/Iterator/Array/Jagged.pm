
package Iterator::Array::Jagged;

use strict;
use warnings 'all';
our $VERSION = '0.03';


#==============================================================================
sub new
{
	my ($class, %args) = @_;
	
	my $s = bless {
		idx => [
			map { 0 } 0...scalar(@{$args{data}}) - 1
		],
		sizes => [
			map { scalar(@$_) - 1 } @{$args{data}}
		],
		data => $args{data},
		_max => scalar(@{$args{data}}),
		_is_finished => 0,
	}, $class;
	
	return $s;
}# end new()


#==============================================================================
sub _increment
{
	my ($s, $index) = @_;
	
	if( $s->{idx}->[ $index ] < $s->{sizes}->[ $index ] )
	{
		$s->{idx}->[ $index ]++;
	}
	else
	{
		$s->{idx}->[ $index ] = 0;
		if( $index + 1 < $s->{_max} )
		{
			$s->_increment( $index + 1 );
		}
		else
		{
			$s->{_is_finished} = 1;
		}# end if()
	}# end if()
}# end _increment()


#==============================================================================
sub next
{
	my ($s) = @_;
	
	return if $s->{_is_finished};
	
	# Calculate and return the current value:
	my @parts = ();
	for( 0...$s->{_max} - 1 )
	{
		my $part_idx = $s->{idx}->[ $_ ];
		push @parts, $s->{data}->[ $_ ]->[ $part_idx ];
	}# end for()
	
	$s->_increment( 0 );
	
	return @parts;
}# end next()

1; #return true:

__END__

=pod

=head1 NAME

Iterator::Array::Jagged - Iterate through multiple jagged arrays

=head1 SYNOPSIS

	use Iterator::Array::Jagged;
	
	# Build up a set of data:
	my @data = ();
	for my $var ( 1...3 )
	{
		my @set = ();
		for my $val ( 1...2 )
		{
			push @set, "var_$var=val_$val";
		}# end for()
		push @data, \@set;
	}# end for()
	
	my $iterator = Iterator::Array::Jagged->new( data => \@data );
	while( my @set = $iterator->next )
	{
		print "Next set: '" . join("&", @set) . "'\n";
	}# end while()

The above code prints the following:

	Next set: 'var1=val1&var2=val1&var3=val1'
	Next set: 'var1=val2&var2=val1&var3=val1'
	Next set: 'var1=val1&var2=val2&var3=val1'
	Next set: 'var1=val2&var2=val2&var3=val1'
	Next set: 'var1=val1&var2=val1&var3=val2'
	Next set: 'var1=val2&var2=val1&var3=val2'
	Next set: 'var1=val1&var2=val2&var3=val2'
	Next set: 'var1=val2&var2=val2&var3=val2'

=head1 DESCRIPTION

Iterator::Array::Jagged can permute through sets of "jagged" arrays - arrays of varying lengths.

Iterator::Array::Jagged works much like the odometer in an automobile.  Except that each set
of "numbers" can have any kind of data you want, and each set can contain 1 or more elements.

=head1 METHODS

=head2 new( %args )

Constructor.  C<%args> should included the element C<data> which contains the arrayref of arrayrefs
that you wish to iterate through.

=head2 next( )

Returns an array representing the next iteration of the permutation of your data set.  See the synopsis for an example.

=head1 BUGS

It's possible that some bugs have found their way into this release.

Use RT L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Iterator-Array-Jagged> to submit bug reports.

=head1 AUTHOR

John Drago L<mailto:jdrago_999@yahoo.com>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 John Drago, All rights reserved.

This software is free software.  It may be used and distributed under the
same terms as Perl itself.

=cut

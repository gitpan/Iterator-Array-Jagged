#!perl -w

use strict;
use warnings 'all';

use Test::More 'no_plan';
BEGIN { use_ok('Iterator::Array::Jagged') };

my @data = ();
for my $var ( 1...4 )
{
	my @var = ();
	for my $val ( 1...4 )
	{
		push @var, "var$var=$val";
	}# end for()
	push @data, \@var;
}# end for()

my @expected = get_expected();

my $iter = Iterator::Array::Jagged->new(
	data => \@data
);

my $count = 0;
while( my @set = $iter->next )
{
        is_deeply( \@set, $expected[$count++] );
}# end while()


my @got = ();
use Data::Dumper;


$count = 0;
Iterator::Array::Jagged->permute( sub {
  is_deeply( \@_, $expected[$count++] );
#  push @got, @_;
}, @data );
#is_deeply( \@got, \@expected );



$count = 0;
my $iter2 = Iterator::Array::Jagged->get_iterator( @data );
while( my @set = $iter2->() )
{
        is_deeply( \@set, $expected[$count++] );
}# end while()




sub get_expected
{
  return (
  [qw/ var1=1 var2=1 var3=1 var4=1/],
  [qw/ var1=2 var2=1 var3=1 var4=1/],
  [qw/ var1=3 var2=1 var3=1 var4=1/],
  [qw/ var1=4 var2=1 var3=1 var4=1/],
  [qw/ var1=1 var2=2 var3=1 var4=1/],
  [qw/ var1=2 var2=2 var3=1 var4=1/],
  [qw/ var1=3 var2=2 var3=1 var4=1/],
  [qw/ var1=4 var2=2 var3=1 var4=1/],
  [qw/ var1=1 var2=3 var3=1 var4=1/],
  [qw/ var1=2 var2=3 var3=1 var4=1/],
  [qw/ var1=3 var2=3 var3=1 var4=1/],
  [qw/ var1=4 var2=3 var3=1 var4=1/],
  [qw/ var1=1 var2=4 var3=1 var4=1/],
  [qw/ var1=2 var2=4 var3=1 var4=1/],
  [qw/ var1=3 var2=4 var3=1 var4=1/],
  [qw/ var1=4 var2=4 var3=1 var4=1/],
  [qw/ var1=1 var2=1 var3=2 var4=1/],
  [qw/ var1=2 var2=1 var3=2 var4=1/],
  [qw/ var1=3 var2=1 var3=2 var4=1/],
  [qw/ var1=4 var2=1 var3=2 var4=1/],
  [qw/ var1=1 var2=2 var3=2 var4=1/],
  [qw/ var1=2 var2=2 var3=2 var4=1/],
  [qw/ var1=3 var2=2 var3=2 var4=1/],
  [qw/ var1=4 var2=2 var3=2 var4=1/],
  [qw/ var1=1 var2=3 var3=2 var4=1/],
  [qw/ var1=2 var2=3 var3=2 var4=1/],
  [qw/ var1=3 var2=3 var3=2 var4=1/],
  [qw/ var1=4 var2=3 var3=2 var4=1/],
  [qw/ var1=1 var2=4 var3=2 var4=1/],
  [qw/ var1=2 var2=4 var3=2 var4=1/],
  [qw/ var1=3 var2=4 var3=2 var4=1/],
  [qw/ var1=4 var2=4 var3=2 var4=1/],
  [qw/ var1=1 var2=1 var3=3 var4=1/],
  [qw/ var1=2 var2=1 var3=3 var4=1/],
  [qw/ var1=3 var2=1 var3=3 var4=1/],
  [qw/ var1=4 var2=1 var3=3 var4=1/],
  [qw/ var1=1 var2=2 var3=3 var4=1/],
  [qw/ var1=2 var2=2 var3=3 var4=1/],
  [qw/ var1=3 var2=2 var3=3 var4=1/],
  [qw/ var1=4 var2=2 var3=3 var4=1/],
  [qw/ var1=1 var2=3 var3=3 var4=1/],
  [qw/ var1=2 var2=3 var3=3 var4=1/],
  [qw/ var1=3 var2=3 var3=3 var4=1/],
  [qw/ var1=4 var2=3 var3=3 var4=1/],
  [qw/ var1=1 var2=4 var3=3 var4=1/],
  [qw/ var1=2 var2=4 var3=3 var4=1/],
  [qw/ var1=3 var2=4 var3=3 var4=1/],
  [qw/ var1=4 var2=4 var3=3 var4=1/],
  [qw/ var1=1 var2=1 var3=4 var4=1/],
  [qw/ var1=2 var2=1 var3=4 var4=1/],
  [qw/ var1=3 var2=1 var3=4 var4=1/],
  [qw/ var1=4 var2=1 var3=4 var4=1/],
  [qw/ var1=1 var2=2 var3=4 var4=1/],
  [qw/ var1=2 var2=2 var3=4 var4=1/],
  [qw/ var1=3 var2=2 var3=4 var4=1/],
  [qw/ var1=4 var2=2 var3=4 var4=1/],
  [qw/ var1=1 var2=3 var3=4 var4=1/],
  [qw/ var1=2 var2=3 var3=4 var4=1/],
  [qw/ var1=3 var2=3 var3=4 var4=1/],
  [qw/ var1=4 var2=3 var3=4 var4=1/],
  [qw/ var1=1 var2=4 var3=4 var4=1/],
  [qw/ var1=2 var2=4 var3=4 var4=1/],
  [qw/ var1=3 var2=4 var3=4 var4=1/],
  [qw/ var1=4 var2=4 var3=4 var4=1/],
  [qw/ var1=1 var2=1 var3=1 var4=2/],
  [qw/ var1=2 var2=1 var3=1 var4=2/],
  [qw/ var1=3 var2=1 var3=1 var4=2/],
  [qw/ var1=4 var2=1 var3=1 var4=2/],
  [qw/ var1=1 var2=2 var3=1 var4=2/],
  [qw/ var1=2 var2=2 var3=1 var4=2/],
  [qw/ var1=3 var2=2 var3=1 var4=2/],
  [qw/ var1=4 var2=2 var3=1 var4=2/],
  [qw/ var1=1 var2=3 var3=1 var4=2/],
  [qw/ var1=2 var2=3 var3=1 var4=2/],
  [qw/ var1=3 var2=3 var3=1 var4=2/],
  [qw/ var1=4 var2=3 var3=1 var4=2/],
  [qw/ var1=1 var2=4 var3=1 var4=2/],
  [qw/ var1=2 var2=4 var3=1 var4=2/],
  [qw/ var1=3 var2=4 var3=1 var4=2/],
  [qw/ var1=4 var2=4 var3=1 var4=2/],
  [qw/ var1=1 var2=1 var3=2 var4=2/],
  [qw/ var1=2 var2=1 var3=2 var4=2/],
  [qw/ var1=3 var2=1 var3=2 var4=2/],
  [qw/ var1=4 var2=1 var3=2 var4=2/],
  [qw/ var1=1 var2=2 var3=2 var4=2/],
  [qw/ var1=2 var2=2 var3=2 var4=2/],
  [qw/ var1=3 var2=2 var3=2 var4=2/],
  [qw/ var1=4 var2=2 var3=2 var4=2/],
  [qw/ var1=1 var2=3 var3=2 var4=2/],
  [qw/ var1=2 var2=3 var3=2 var4=2/],
  [qw/ var1=3 var2=3 var3=2 var4=2/],
  [qw/ var1=4 var2=3 var3=2 var4=2/],
  [qw/ var1=1 var2=4 var3=2 var4=2/],
  [qw/ var1=2 var2=4 var3=2 var4=2/],
  [qw/ var1=3 var2=4 var3=2 var4=2/],
  [qw/ var1=4 var2=4 var3=2 var4=2/],
  [qw/ var1=1 var2=1 var3=3 var4=2/],
  [qw/ var1=2 var2=1 var3=3 var4=2/],
  [qw/ var1=3 var2=1 var3=3 var4=2/],
  [qw/ var1=4 var2=1 var3=3 var4=2/],
  [qw/ var1=1 var2=2 var3=3 var4=2/],
  [qw/ var1=2 var2=2 var3=3 var4=2/],
  [qw/ var1=3 var2=2 var3=3 var4=2/],
  [qw/ var1=4 var2=2 var3=3 var4=2/],
  [qw/ var1=1 var2=3 var3=3 var4=2/],
  [qw/ var1=2 var2=3 var3=3 var4=2/],
  [qw/ var1=3 var2=3 var3=3 var4=2/],
  [qw/ var1=4 var2=3 var3=3 var4=2/],
  [qw/ var1=1 var2=4 var3=3 var4=2/],
  [qw/ var1=2 var2=4 var3=3 var4=2/],
  [qw/ var1=3 var2=4 var3=3 var4=2/],
  [qw/ var1=4 var2=4 var3=3 var4=2/],
  [qw/ var1=1 var2=1 var3=4 var4=2/],
  [qw/ var1=2 var2=1 var3=4 var4=2/],
  [qw/ var1=3 var2=1 var3=4 var4=2/],
  [qw/ var1=4 var2=1 var3=4 var4=2/],
  [qw/ var1=1 var2=2 var3=4 var4=2/],
  [qw/ var1=2 var2=2 var3=4 var4=2/],
  [qw/ var1=3 var2=2 var3=4 var4=2/],
  [qw/ var1=4 var2=2 var3=4 var4=2/],
  [qw/ var1=1 var2=3 var3=4 var4=2/],
  [qw/ var1=2 var2=3 var3=4 var4=2/],
  [qw/ var1=3 var2=3 var3=4 var4=2/],
  [qw/ var1=4 var2=3 var3=4 var4=2/],
  [qw/ var1=1 var2=4 var3=4 var4=2/],
  [qw/ var1=2 var2=4 var3=4 var4=2/],
  [qw/ var1=3 var2=4 var3=4 var4=2/],
  [qw/ var1=4 var2=4 var3=4 var4=2/],
  [qw/ var1=1 var2=1 var3=1 var4=3/],
  [qw/ var1=2 var2=1 var3=1 var4=3/],
  [qw/ var1=3 var2=1 var3=1 var4=3/],
  [qw/ var1=4 var2=1 var3=1 var4=3/],
  [qw/ var1=1 var2=2 var3=1 var4=3/],
  [qw/ var1=2 var2=2 var3=1 var4=3/],
  [qw/ var1=3 var2=2 var3=1 var4=3/],
  [qw/ var1=4 var2=2 var3=1 var4=3/],
  [qw/ var1=1 var2=3 var3=1 var4=3/],
  [qw/ var1=2 var2=3 var3=1 var4=3/],
  [qw/ var1=3 var2=3 var3=1 var4=3/],
  [qw/ var1=4 var2=3 var3=1 var4=3/],
  [qw/ var1=1 var2=4 var3=1 var4=3/],
  [qw/ var1=2 var2=4 var3=1 var4=3/],
  [qw/ var1=3 var2=4 var3=1 var4=3/],
  [qw/ var1=4 var2=4 var3=1 var4=3/],
  [qw/ var1=1 var2=1 var3=2 var4=3/],
  [qw/ var1=2 var2=1 var3=2 var4=3/],
  [qw/ var1=3 var2=1 var3=2 var4=3/],
  [qw/ var1=4 var2=1 var3=2 var4=3/],
  [qw/ var1=1 var2=2 var3=2 var4=3/],
  [qw/ var1=2 var2=2 var3=2 var4=3/],
  [qw/ var1=3 var2=2 var3=2 var4=3/],
  [qw/ var1=4 var2=2 var3=2 var4=3/],
  [qw/ var1=1 var2=3 var3=2 var4=3/],
  [qw/ var1=2 var2=3 var3=2 var4=3/],
  [qw/ var1=3 var2=3 var3=2 var4=3/],
  [qw/ var1=4 var2=3 var3=2 var4=3/],
  [qw/ var1=1 var2=4 var3=2 var4=3/],
  [qw/ var1=2 var2=4 var3=2 var4=3/],
  [qw/ var1=3 var2=4 var3=2 var4=3/],
  [qw/ var1=4 var2=4 var3=2 var4=3/],
  [qw/ var1=1 var2=1 var3=3 var4=3/],
  [qw/ var1=2 var2=1 var3=3 var4=3/],
  [qw/ var1=3 var2=1 var3=3 var4=3/],
  [qw/ var1=4 var2=1 var3=3 var4=3/],
  [qw/ var1=1 var2=2 var3=3 var4=3/],
  [qw/ var1=2 var2=2 var3=3 var4=3/],
  [qw/ var1=3 var2=2 var3=3 var4=3/],
  [qw/ var1=4 var2=2 var3=3 var4=3/],
  [qw/ var1=1 var2=3 var3=3 var4=3/],
  [qw/ var1=2 var2=3 var3=3 var4=3/],
  [qw/ var1=3 var2=3 var3=3 var4=3/],
  [qw/ var1=4 var2=3 var3=3 var4=3/],
  [qw/ var1=1 var2=4 var3=3 var4=3/],
  [qw/ var1=2 var2=4 var3=3 var4=3/],
  [qw/ var1=3 var2=4 var3=3 var4=3/],
  [qw/ var1=4 var2=4 var3=3 var4=3/],
  [qw/ var1=1 var2=1 var3=4 var4=3/],
  [qw/ var1=2 var2=1 var3=4 var4=3/],
  [qw/ var1=3 var2=1 var3=4 var4=3/],
  [qw/ var1=4 var2=1 var3=4 var4=3/],
  [qw/ var1=1 var2=2 var3=4 var4=3/],
  [qw/ var1=2 var2=2 var3=4 var4=3/],
  [qw/ var1=3 var2=2 var3=4 var4=3/],
  [qw/ var1=4 var2=2 var3=4 var4=3/],
  [qw/ var1=1 var2=3 var3=4 var4=3/],
  [qw/ var1=2 var2=3 var3=4 var4=3/],
  [qw/ var1=3 var2=3 var3=4 var4=3/],
  [qw/ var1=4 var2=3 var3=4 var4=3/],
  [qw/ var1=1 var2=4 var3=4 var4=3/],
  [qw/ var1=2 var2=4 var3=4 var4=3/],
  [qw/ var1=3 var2=4 var3=4 var4=3/],
  [qw/ var1=4 var2=4 var3=4 var4=3/],
  [qw/ var1=1 var2=1 var3=1 var4=4/],
  [qw/ var1=2 var2=1 var3=1 var4=4/],
  [qw/ var1=3 var2=1 var3=1 var4=4/],
  [qw/ var1=4 var2=1 var3=1 var4=4/],
  [qw/ var1=1 var2=2 var3=1 var4=4/],
  [qw/ var1=2 var2=2 var3=1 var4=4/],
  [qw/ var1=3 var2=2 var3=1 var4=4/],
  [qw/ var1=4 var2=2 var3=1 var4=4/],
  [qw/ var1=1 var2=3 var3=1 var4=4/],
  [qw/ var1=2 var2=3 var3=1 var4=4/],
  [qw/ var1=3 var2=3 var3=1 var4=4/],
  [qw/ var1=4 var2=3 var3=1 var4=4/],
  [qw/ var1=1 var2=4 var3=1 var4=4/],
  [qw/ var1=2 var2=4 var3=1 var4=4/],
  [qw/ var1=3 var2=4 var3=1 var4=4/],
  [qw/ var1=4 var2=4 var3=1 var4=4/],
  [qw/ var1=1 var2=1 var3=2 var4=4/],
  [qw/ var1=2 var2=1 var3=2 var4=4/],
  [qw/ var1=3 var2=1 var3=2 var4=4/],
  [qw/ var1=4 var2=1 var3=2 var4=4/],
  [qw/ var1=1 var2=2 var3=2 var4=4/],
  [qw/ var1=2 var2=2 var3=2 var4=4/],
  [qw/ var1=3 var2=2 var3=2 var4=4/],
  [qw/ var1=4 var2=2 var3=2 var4=4/],
  [qw/ var1=1 var2=3 var3=2 var4=4/],
  [qw/ var1=2 var2=3 var3=2 var4=4/],
  [qw/ var1=3 var2=3 var3=2 var4=4/],
  [qw/ var1=4 var2=3 var3=2 var4=4/],
  [qw/ var1=1 var2=4 var3=2 var4=4/],
  [qw/ var1=2 var2=4 var3=2 var4=4/],
  [qw/ var1=3 var2=4 var3=2 var4=4/],
  [qw/ var1=4 var2=4 var3=2 var4=4/],
  [qw/ var1=1 var2=1 var3=3 var4=4/],
  [qw/ var1=2 var2=1 var3=3 var4=4/],
  [qw/ var1=3 var2=1 var3=3 var4=4/],
  [qw/ var1=4 var2=1 var3=3 var4=4/],
  [qw/ var1=1 var2=2 var3=3 var4=4/],
  [qw/ var1=2 var2=2 var3=3 var4=4/],
  [qw/ var1=3 var2=2 var3=3 var4=4/],
  [qw/ var1=4 var2=2 var3=3 var4=4/],
  [qw/ var1=1 var2=3 var3=3 var4=4/],
  [qw/ var1=2 var2=3 var3=3 var4=4/],
  [qw/ var1=3 var2=3 var3=3 var4=4/],
  [qw/ var1=4 var2=3 var3=3 var4=4/],
  [qw/ var1=1 var2=4 var3=3 var4=4/],
  [qw/ var1=2 var2=4 var3=3 var4=4/],
  [qw/ var1=3 var2=4 var3=3 var4=4/],
  [qw/ var1=4 var2=4 var3=3 var4=4/],
  [qw/ var1=1 var2=1 var3=4 var4=4/],
  [qw/ var1=2 var2=1 var3=4 var4=4/],
  [qw/ var1=3 var2=1 var3=4 var4=4/],
  [qw/ var1=4 var2=1 var3=4 var4=4/],
  [qw/ var1=1 var2=2 var3=4 var4=4/],
  [qw/ var1=2 var2=2 var3=4 var4=4/],
  [qw/ var1=3 var2=2 var3=4 var4=4/],
  [qw/ var1=4 var2=2 var3=4 var4=4/],
  [qw/ var1=1 var2=3 var3=4 var4=4/],
  [qw/ var1=2 var2=3 var3=4 var4=4/],
  [qw/ var1=3 var2=3 var3=4 var4=4/],
  [qw/ var1=4 var2=3 var3=4 var4=4/],
  [qw/ var1=1 var2=4 var3=4 var4=4/],
  [qw/ var1=2 var2=4 var3=4 var4=4/],
  [qw/ var1=3 var2=4 var3=4 var4=4/],
  [qw/ var1=4 var2=4 var3=4 var4=4/]
);
}# end get_expected()




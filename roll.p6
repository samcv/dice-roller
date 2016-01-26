#!/usr/bin/env perl6

use v6;
use lib 'lib';
use Dice::Roller;

sub show($dice) {
	say "Rolled '" ~ $dice.string ~ "'",
	    " and " ~ critmaybe($dice) ~ ": " ~ $dice,
       " totals=" ~ $dice.group-totals;
}

# whether something is a 'crit' or not is kind of dependent on the system,
# but we can test for "all rolled faces show the maximum".
sub critmaybe($dice) {
	given $dice {
		when .is-max { "crit!" }
		when .is-min { "fumbled!" }
		default { "got" }
	}
}

multi sub MAIN (Str $dice-string) {
	show(Dice::Roller.new($dice-string).roll);
}

multi sub MAIN () {
	show(Dice::Roller.new('4d6kh3').roll);
}


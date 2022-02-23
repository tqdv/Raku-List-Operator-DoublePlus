use v6;

unit module List::Operator::DoublePlus:auth<zef:tqdv>:ver<0.1.0>:api<1>;

our proto concat(|) is export(:sub) {*}
multi sub concat(@a, @b --> List) { |@a, |@b }
multi sub concat(Slip \a, Slip \b --> Slip) { slip(a, b) }
multi sub concat(Array \a, Array \b --> Array) { a.append: b }

our &infix:<++> is export(:DEFAULT :op :plusplus) = &concat;
our &infix:["\c[DOUBLE PLUS]"] is export(:DEFAULT :op :doubleplus)  = &concat;


=begin pod

=NAME List::Operator::DoublePlus

=head1 SYNOPSIS

  use List::Operator::DoublePlus;
  
  # Concatenate two lists together
  my @l  = @l1 ++ @l2;
  my @l' = @l1 ⧺ @l2;
  
  # The operator also works with Arrays and Slips

=head1 DESCRIPTION

Provides a C<++> operator to join or concatenate two lists together.
The operator C<⧺> is also exported as its Unicode counterpart.

The C<concat> subroutine that implements the operator's functionality
is exported on demand using the C<sub> tag.

This module is inspired by Aaron Sherman's C<Operator::Listcat> which defines an infix C<listcat> operator, as well as the infix C<⊕> (CIRCLED PLUS) Unicode alias.

=head1 FUNCTIONS

=defn infix:<++>
The operator form of C<&concat>.

=defn infix:<⧺>
The Unicode operator variant of C<++>.

=begin defn
concat

  multi sub concat(@a, @b --> List)
  multi sub concat(Slip \a, Slip \b --> Slip)
  multi sub concat(Array \a, Array \b --> Array)

Calls C<.Slip> (which calls C<.list>) on both arguments and applies the infix C<,> operator to join them into a list.

For Slips, it returns a new Slip instead of a List.

For Arrays, it calls C<.append> on the first parameter with the second parameter as its argument, and returns the combined array.

This subroutine also works for Seqs and any class that does PositionalBindFailover.

=end defn

=head1 EXPORTS

=defn :DEFAULT
Same as :op, it exports the ++ operator and its Unicode counterpart ⧺.

=defn :op
Exports the ++ operator and its Unicode counterpart ⧺.

=defn :sub
Exports the C<concat> subroutine which implements the operator's functionality.

=defn :plusplus
Only exports the C<++> operator.

=defn :doubleplus
Only exports the Unicode C<⧺> operator.

=head1 NOTES

The double plus was chosen as the list concatenation operator due to its similarity to the C<+> operator applied to lists in Python an other languages.
The C<++> operator is also used to concatenate lists in Elixir, Haskell, and Scala.
C<++> was chosen over the C<@> operator used in OCaml as I thought it would be too close to the C<@> sigil.
The Unicode counterpart ⧺ was inspired by this StackExchange question:
L<Is there a common symbol for concatenating two (finite) sequences?|https://math.stackexchange.com/questions/298648/is-there-a-common-symbol-for-concatenating-two-finite-sequences/3637741#3637741>

=AUTHOR Tilwa Qendov

=head1 LICENSE

Licensed under the L<Artistic License 2.0|LICENSE>.

=head1 SEE ALSO

=item C<Operator::Listcat>, the module this was inspired by.

=end pod

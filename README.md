_Generated from DoublePlus.rakumod, then manually edited._

NAME
====

List::Operator::DoublePlus

SYNOPSIS
========

    use List::Operator::DoublePlus;
    
    # Concatenate two lists together
    my @l  = @l1 ++ @l2;
    my @l' = @l1 ⧺ @l2;
    
    # The operator also works with Arrays and Slips

DESCRIPTION
===========

Provides a `++` operator to join or concatenate two lists together. The operator `⧺` is also exported as its Unicode counterpart.

The `concat` subroutine that implements the operator's functionality is exported on demand using the `sub` tag.

This module is inspired by Aaron Sherman's `Operator::Listcat` which defines an infix `listcat` operator, as well as the infix `⊕` (CIRCLED PLUS) Unicode alias.

FUNCTIONS
=========

**infix:<++>**

The operator form of `&concat`.

**infix:<⧺>**

The Unicode operator variant of `++`.

**concat**

multi sub concat(@a, @b --> List) multi sub concat(Slip \a, Slip \b --> Slip) multi sub concat(Array \a, Array \b --> Array)

Calls `.Slip` (which calls `.list`) on both arguments and applies the infix `,` operator to join them into a list.

For Slips, it returns a new Slip instead of a List.

For Arrays, it calls `.append` on the first parameter with the second parameter as its argument, and returns the combined array.

This subroutine also works for Seqs and any class that does PositionalBindFailover.

EXPORTS
=======

**:DEFAULT**

Same as :op, it exports the ++ operator and its Unicode counterpart ⧺.

**:op**

Exports the ++ operator and its Unicode counterpart ⧺.

**:sub**

Exports the `concat` subroutine which implements the operator's functionality.

**:plusplus**

Only exports the `++` operator.

**:doubleplus**

Only exports the Unicode `⧺` operator.

NOTES
=====

The double plus was chosen as the list concatenation operator due to its similarity to the `+` operator applied to lists in Python an other languages. The `++` operator is also used to concatenate lists in Elixir, Haskell, and Scala. `++` was chosen over the `@` operator used in OCaml as I thought it would be too close to the `@` sigil. The Unicode counterpart ⧺ was inspired by this StackExchange question: [Is there a common symbol for concatenating two (finite) sequences?](https://math.stackexchange.com/questions/298648/is-there-a-common-symbol-for-concatenating-two-finite-sequences/3637741#3637741)

AUTHOR
======

Tilwa Qendov

LICENSE
=======

Licensed under the [Artistic License 2.0](LICENSE).

SEE ALSO
========

  * `Operator::Listcat`, the module this was inspired by.


# -*- coding: utf-8 -*-
=begin rdoc
= Monkey Patches for RubyNEAT

== Synopsis

Not that other files here don't do monkey patching (they do),
but the monkey patches for the core of RubyNEAT are all in this
file.

== Approach

We have thought about whether or not we would bunch up sequence numbers
to be iterated remotely, or to just place each job in the queue to
be processed by the remote workers on a sequence basis. We have
decided to do the latter because of the more granularity this
buys us. Potentially, the same critter with different sequence
numbers can be evaluated simultaneously this way.

This will, of course, incur a lot more entries in the queue, but
overall we deem this to be a more efficient approach, as it will 
keep the remote workers simple, handling one sequence and
critter at a time, returning the results singly.

Alas, this also means more traffic for RubyNEAT itself to handle
on the return vectors, but this should not represent a significantly
higher impact. 

In the case where critters may have to interact, as in a coevolution
situation, then the sequence numbers would or could mediate the group
of critters that would interact.

=end

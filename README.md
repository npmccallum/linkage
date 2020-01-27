This is an example repository showing how to accomplish three types of linking
using Rust:

  * standard dynamic binary
  * static binary with the standard entry point
  * static binary with no entry point

Each binary (`dyn`, `ent` and `noe`) uses a library (`msg`) to define the
message printed to standard output, demonstrating the use of a library in
each context.

Building the `noe` binary currently requies [this patch to cargo][linkarg].

# The State of Rust

Rust is a great language for systems programming. But the usability of cargo
for low-level things isn't great.

1. You can't have a binary as a dependency. This means, for example, you
   can't build a BIOS as part of your VMM. [See this][bindep] for more
   information.

2. Building a static binary requires you to cross compile. This breaks all
   sorts of things that normally work by default. For example: linking
   against system libraries, using your binary as a dependency, putting
   the crate in a non-cross-compiled workspace and using rls.

3. Building a static binary without an entry point (that is, without any
   system stuff at all) requires you to [patch cargo][linkarg], use an
   unstable option and resort to non-portable linker flags. A potential
   solution for that [exists here][noentry]. But that effort appears to
   have stalled.

4. You can specify a cross-compilation target with `.cargo/config` but it
   doesn't work when you build as a dependency, as part of a workspace or
   even using `cargo build --manifest-path=...`.

5. As far as I can tell, it is impossible to create a static PIE binary,
   which has numerous security benefits.

[linkarg]: https://github.com/rust-lang/cargo/pull/7811
[bindep]: https://github.com/rust-lang/cargo/pull/7804
[noentry]: https://github.com/rust-lang/rfcs/pull/2735/files

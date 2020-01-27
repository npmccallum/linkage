all: dyn/target/debug/dyn ent/target/x86_64-unknown-linux-musl/debug/ent noe/target/debug/noe

clean:
	cargo clean --manifest-path=dyn/Cargo.toml
	cargo clean --manifest-path=ent/Cargo.toml
	cargo clean --manifest-path=noe/Cargo.toml

dyn/target/debug/dyn:
	cargo build --manifest-path=dyn/Cargo.toml
	file $@
	$@

ent/target/x86_64-unknown-linux-musl/debug/ent:
	cargo build --manifest-path=ent/Cargo.toml --target=x86_64-unknown-linux-musl
	file $@
	$@

noe/target/debug/noe:
	cargo build --manifest-path=noe/Cargo.toml -Z extra-link-arg
	file $@
	$@

.PHONY: all clean

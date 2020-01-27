

fn main() {
    cc::Build::new()
        .file("src/start.s")
        .compile("start");

    println!("cargo:rustc-bin-link-arg={}", "-Wl,--no-gc-sections");
    println!("cargo:rustc-bin-link-arg={}", "-nodefaultlibs");
    println!("cargo:rustc-bin-link-arg={}", "-nostdlib");
    println!("cargo:rustc-bin-link-arg={}", "-static");
}

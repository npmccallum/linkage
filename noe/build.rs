fn main() {
    cc::Build::new()
        .file("src/start.s")
        .compile("start");

    println!("cargo:rustc-bin-link-arg={}", "-nostdlib");
    println!("cargo:rustc-bin-link-arg={}", "-static");
}

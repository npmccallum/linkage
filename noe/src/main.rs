#![no_std]
#![no_main]

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
extern "C" fn get_msg() -> *const u8 {
    msg::message().as_bytes().as_ptr()
}

#[no_mangle]
extern "C" fn get_len() -> usize {
    msg::message().as_bytes().len()
}

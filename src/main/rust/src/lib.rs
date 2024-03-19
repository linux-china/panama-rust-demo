use std::process;
use std::ffi::CString;
use std::os::raw::c_char;

#[no_mangle]
pub extern "C" fn rust_get_pid() -> u32 {
    return process::id();
}

#[no_mangle]
pub extern "C" fn hello(name: *const c_char) {
    let c_str = unsafe {
        assert!(!name.is_null());
        CString::from_raw(name as *mut _)
    };
    let username = c_str.to_str().unwrap();
    println!("Hello, {}!", username);
}

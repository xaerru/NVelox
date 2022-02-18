use std::ffi::CString;
use libc::*;

extern "C" {
    fn nv_out_msg(_msg: *mut c_char) -> c_void;
}

#[no_mangle]
pub extern "C" fn nvelox_plugin_init() -> c_int {
    let c_string = CString::new("Hello from rust").expect("CString::new failed");
    let raw = c_string.into_raw();
    unsafe {
        nv_out_msg(raw);
        let _ = CString::from_raw(raw);
    }
    0
}

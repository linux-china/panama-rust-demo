package org.mvnsearch;

import org.rust.RustLib;

import java.lang.foreign.Arena;

public class RustLibWrapper {

    public static Integer getProcessId() {
        return RustLib.rust_get_pid();
    }

    public static void sayHello(String name) {
        try (var arena = Arena.ofConfined()) {
            var username = arena.allocateFrom(name);
            RustLib.hello(username);
        }
    }
}

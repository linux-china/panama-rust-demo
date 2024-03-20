package org.mvnsearch;

import org.rust.RustLib;

import java.lang.foreign.Arena;

public class PanamaMain {

    public static void main(String[] args) throws Throwable {
        System.out.println(RustLib.rust_get_pid());
        try (var arena = Arena.ofConfined()) {
            var username = arena.allocateFrom("Jackie");
            RustLib.hello(username);
        }
    }

}

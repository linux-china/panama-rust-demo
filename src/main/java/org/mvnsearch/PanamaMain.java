package org.mvnsearch;

import org.rust.RustLib;

import java.lang.foreign.Arena;

public class PanamaMain {

    public static void main(String[] args) throws Throwable {
        System.out.println(RustLib.rust_get_pid());
        var username = Arena.ofAuto().allocateFrom("Jackie");
        RustLib.hello(username);
    }

}

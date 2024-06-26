package org.mvnsearch;

import org.junit.jupiter.api.Test;
import org.rust.RustLib;

import java.lang.foreign.Arena;

public class RustLibTest {
    @Test
    public void testGetPid() {
        System.out.println(RustLib.rust_get_pid());
    }

    @Test
    public void testHello() {
        try (var arena = Arena.ofConfined()) {
            var username = arena.allocateFrom("Jackie");
            RustLib.hello(username);
        }
    }
}

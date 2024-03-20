package org.rust;

import org.graalvm.nativeimage.hosted.Feature;
import org.graalvm.nativeimage.hosted.RuntimeForeignAccess;

import java.lang.foreign.FunctionDescriptor;

import static java.lang.foreign.ValueLayout.ADDRESS;
import static java.lang.foreign.ValueLayout.JAVA_INT;

public class RustLibForeignRegistrationFeature implements Feature {
    public void duringSetup(Feature.DuringSetupAccess access) {
        RuntimeForeignAccess.registerForDowncall(FunctionDescriptor.of(JAVA_INT));
        RuntimeForeignAccess.registerForDowncall(FunctionDescriptor.ofVoid(ADDRESS));
    }
}
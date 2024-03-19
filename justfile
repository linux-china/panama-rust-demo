std_include := "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/"

# compile rust library
compile-rust:
  cd src/main/rust; cargo build
  cp src/main/rust/target/debug/libmyrustlibrary.dylib ./
  jextract --output target/classes -t org.rust -l myrustlibrary -I {{std_include}} --include-function rust_get_pid --include-function hello src/main/rust/lib.h
  rm -rf target/generated-sources/rust
  jextract --output target/generated-sources/rust -t org.rust --header-class-name RustLib -l myrustlibrary -I {{std_include}} --include-function rust_get_pid --include-function hello src/main/rust/lib.h

# build app
build: clean compile-rust
  mvn -DskipTests package

# clean with maven and cargo
clean:
  mvn clean
  cd src/main/rust; cargo clean

# run java main
run:
  java --enable-preview --enable-native-access=ALL-UNNAMED -cp .:target/classes  -Djava.library.path=.:/usr/local/lib org.mvnsearch.PanamaMain



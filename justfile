# compile rust library
compile-rust:
  cd src/main/rust; cargo build
  cp src/main/rust/target/debug/libmyrustlibrary.dylib ./
  jextract --output src/main/java -t org.rust --header-class-name RustLib -l myrustlibrary --include-function rust_get_pid --include-function hello src/main/rust/lib.h

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



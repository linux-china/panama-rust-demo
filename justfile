# compile rust library
compile-rust:
  cd src/main/rust; cargo build
  cp src/main/rust/target/debug/libmyrustlibrary.dylib ./
  jextract --output src/main/java -t org.rust --header-class-name RustLib -l myrustlibrary --include-function rust_get_pid --include-function hello src/main/rust/lib.h

# generate chdb FFI java code
chdb-generate:
  jextract --output src/main/java -t org.clickhouse --header-class-name ChdbLib -l prqlc_c --include-struct local_result --include-struct local_result_v2 --include-function query_stable --include-function free_result src/main/headers/chdb.h

# generate prqlc FFI java code
prqlc-generate:
  jextract --output src/main/java -t org.prql --header-class-name PrqlLib -l prqlc_c --include-struct Span --include-struct SourceLocation --include-struct Message --include-struct Options --include-struct CompileResult --include-function compile --include-function result_destroy src/main/headers/prqlc.h

# build app
build: clean compile-rust
  mvn -DskipTests package

# GraalVM native-image build for AMD64 only
native-build:
  mvn -DskipTests clean package native:compile

# clean with maven and cargo
clean:
  mvn clean
  cd src/main/rust; cargo clean

# run java main
run:
  java --enable-preview --enable-native-access=ALL-UNNAMED -cp .:target/classes  -Djava.library.path=.:/usr/local/lib org.mvnsearch.PanamaMain



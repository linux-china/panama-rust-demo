Java Panama Rust Demo
===================

      
# Requirements

* JDK 22
* jextract: https://github.com/openjdk/jextract
* Rust

# Install jextract

```shell
$ git clone https://github.com/openjdk/jextract.git
$ cd jextract
$ ./gradlew -Pjdk22_home=$HOME/.jbang/cache/jdks/22 -Pllvm_home=/Library/Developer/CommandLineTools/usr/ clean verify
$ cp -r build/jextract ~/tools/jextract
```

# References

* Welcome, GraalVM for JDK 22! https://medium.com/graalvm/welcome-graalvm-for-jdk-22-8a48849f054c
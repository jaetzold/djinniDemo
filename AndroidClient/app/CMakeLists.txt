# Sets the minimum version of CMake required to build the native
# library. You should either keep the default value or only pass a
# value of 3.4.0 or lower.

cmake_minimum_required(VERSION 3.4.1)

# Path to the djinni support code
set(support_dir src/djinni/support-lib/jni)
# Path to the generated code and our own c++ implementations
set(include_dirs src/djinni/generated/cpp/ src/djinni/generated/jni/ src/main/cpp/)

# Djinni support code that needs to be compiled
file(
  GLOB_RECURSE support_srcs
  ${support_dir}/*.cpp)
# Generated code and c++ implementations that need to be compiled
file(
  GLOB_RECURSE lib_srcs
  src/djinni/generated/cpp/*.cpp
  src/djinni/generated/jni/*.cpp
  src/main/cpp/*.cpp)

# All the implementation files that make up our library
set(complete_srcs ${support_srcs} ${lib_srcs})

# Define library referring to the sources above
add_library(native-lib SHARED ${complete_srcs})

# Define INCLUDE_DIRECTORIES property for native-lib
target_include_directories(
  native-lib
  PUBLIC
  ${include_dirs}
  ${support_dir})

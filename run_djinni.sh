#!/bin/bash

rm -r generated/*

"`dirname \"$0\"`"/djinni/src/run \
    --java-out generated/java/de/jaetzold/djinni \
    --java-package de.jaetzold.djinni \
    \
    --cpp-out generated/cpp/ \
    --cpp-optional-template std::experimental::optional \
    --cpp-optional-header "<experimental/optional>" \
    \
    --jni-out generated/jni/ \
    --ident-jni-class JNIFooBar \
    --ident-jni-file jni_foo_bar \
    \
    --objc-out generated/objc/ \
    --objcpp-out generated/objcpp/ \
    --objc-type-prefix SJ \
    \
    --idl idl/greeting.djinni


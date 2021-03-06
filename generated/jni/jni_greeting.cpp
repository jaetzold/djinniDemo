// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from greeting.djinni

#include "jni_greeting.hpp"  // my header
#include "Marshal.hpp"
#include "jni_greeting_color.hpp"

namespace djinni_generated {

JNIGreeting::JNIGreeting() = default;

JNIGreeting::~JNIGreeting() = default;

auto JNIGreeting::fromCpp(JNIEnv* jniEnv, const CppType& c) -> ::djinni::LocalRef<JniType> {
    const auto& data = ::djinni::JniClass<JNIGreeting>::get();
    auto r = ::djinni::LocalRef<JniType>{jniEnv->NewObject(data.clazz.get(), data.jconstructor,
                                                           ::djinni::get(::djinni::String::fromCpp(jniEnv, c.message)),
                                                           ::djinni::get(::djinni_generated::JNIGreetingColor::fromCpp(jniEnv, c.color)))};
    ::djinni::jniExceptionCheck(jniEnv);
    return r;
}

auto JNIGreeting::toCpp(JNIEnv* jniEnv, JniType j) -> CppType {
    ::djinni::JniLocalScope jscope(jniEnv, 3);
    assert(j != nullptr);
    const auto& data = ::djinni::JniClass<JNIGreeting>::get();
    return {::djinni::String::toCpp(jniEnv, (jstring)jniEnv->GetObjectField(j, data.field_message)),
            ::djinni_generated::JNIGreetingColor::toCpp(jniEnv, jniEnv->GetObjectField(j, data.field_color))};
}

}  // namespace djinni_generated

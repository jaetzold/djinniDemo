// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from greeting.djinni

#import "SJGreeting+Private.h"
#import "DJIMarshal+Private.h"
#import "SJGreetingColor+Private.h"
#include <cassert>

namespace djinni_generated {

auto Greeting::toCpp(ObjcType obj) -> CppType
{
    assert(obj);
    return {::djinni::String::toCpp(obj.message),
            ::djinni::Enum<::GreetingColor, SJGreetingColor>::toCpp(obj.color)};
}

auto Greeting::fromCpp(const CppType& cpp) -> ObjcType
{
    return [[SJGreeting alloc] initWithMessage:(::djinni::String::fromCpp(cpp.message))
                                         color:(::djinni::Enum<::GreetingColor, SJGreetingColor>::fromCpp(cpp.color))];
}

}  // namespace djinni_generated
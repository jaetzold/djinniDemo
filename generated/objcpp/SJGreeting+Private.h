// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from greeting.djinni

#import "SJGreeting.h"
#include "greeting.hpp"

static_assert(__has_feature(objc_arc), "Djinni requires ARC to be enabled for this file");

@class SJGreeting;

namespace djinni_generated {

struct Greeting
{
    using CppType = ::Greeting;
    using ObjcType = SJGreeting*;

    using Boxed = Greeting;

    static CppType toCpp(ObjcType objc);
    static ObjcType fromCpp(const CppType& cpp);
};

}  // namespace djinni_generated

// AUTOGENERATED FILE - DO NOT MODIFY!
// This file generated by Djinni from greeting.djinni

#pragma once

struct Greeting;

class GreetingDisplay {
public:
    virtual ~GreetingDisplay() {}

    virtual void display(const Greeting & greeting) = 0;
};
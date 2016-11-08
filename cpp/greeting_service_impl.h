//
// Created by Stephan Jaetzold on 11/8/16.
//

#pragma once

#include <memory>
#include <string>
#include "greeting_service.hpp"

class GreetingServiceImpl : public GreetingService {
public:
    GreetingServiceImpl(const std::shared_ptr<GreetingDisplay> &display);

    virtual void greet(const std::vector<std::string> &who) override;

private:
    std::shared_ptr<GreetingDisplay> m_display;
};

//
// Created by Stephan Jaetzold on 11/8/16.
//

#include "greeting_service_impl.h"
#include "greeting_color.hpp"
#include "greeting_display.hpp"
#include "greeting.hpp"
#include <stdlib.h>
#include <thread>

std::shared_ptr<GreetingService>
GreetingService::create_service(const std::shared_ptr<GreetingDisplay> &display) {
    return std::make_shared<GreetingServiceImpl>(display);
}

GreetingServiceImpl::GreetingServiceImpl(const std::shared_ptr<GreetingDisplay> &display) {
    this->m_display = display;
}

void GreetingServiceImpl::greet(const std::vector<std::string> &who) {
    for (auto addressee : who) {
        std::string message = "Hello, " + addressee + "!";
        GreetingColor color = rand() % 100 < 50 ? GreetingColor::RED : GreetingColor::BLUE;
        Greeting greeting = Greeting(message, color);
        this->m_display->display(greeting);
        std::this_thread::sleep_for(std::chrono::milliseconds(GreetingService::COOLDOWN_MS));
    }
}

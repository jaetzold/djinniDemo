//
//  ViewController.m
//  ObjCClient
//
//  Created by Stephan Jaetzold on 11/8/16.
//  Copyright (c) 2016 Stephan Jaetzold. All rights reserved.
//

#import "ViewController.h"
#import "SJGreetingService.h"
#import "SJGreetingDisplay.h"


@interface ViewController () <SJGreetingDisplay>

@end

@implementation ViewController {
    SJGreetingService *_greetingService;
    UILabel *_label;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupViews];

    _greetingService = [SJGreetingService createService:self];
    [[[NSThread alloc] initWithBlock:^{
        [_greetingService greet:@[@"World", @"Devoxx", @"Djinni", @"iOS"]];
    }] start];

}

- (void)setupViews {
    _label = [[UILabel alloc] init];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont boldSystemFontOfSize:32];
    _label.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:_label];
    [self.view addConstraints:[NSLayoutConstraint
            constraintsWithVisualFormat:@"|[_label]|"
                                options:(NSLayoutFormatOptions) 0 metrics:nil views:NSDictionaryOfVariableBindings(_label)]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view attribute:NSLayoutAttributeCenterY
                                                         multiplier:1 constant:0]];
}

- (void)display:(SJGreeting *)greeting {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *message = greeting.message;
        _label.text = message;
        SJGreetingColor color = greeting.color;
        switch (color) {
            case SJGreetingColorRED:
                _label.textColor = UIColor.redColor;
                break;
            case SJGreetingColorBLUE:
                _label.textColor = UIColor.blueColor;
                break;
        }
        [self fadeOutLabel:_label
                     delay:SJGreetingServiceCooldownMs / (1000.0 * 2)
                  duration:SJGreetingServiceCooldownMs / (1000.0 * 4)];
    });
}

- (void)fadeOutLabel:(UILabel *)label delay:(NSTimeInterval)delay duration:(NSTimeInterval)duration {
    label.alpha = 1;
    [UIView animateWithDuration:duration delay:delay
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         label.alpha = 0;
                     }
                     completion:nil];

}

@end
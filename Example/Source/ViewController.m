//
//  ViewController.m
//  Example
//
//  Created by Sibagatov Ildar on 21/07/16.
//  Copyright © 2016 SFÇD. All rights reserved.
//

#import "ViewController.h"
#import <SFProgressCircle/SFProgressCircle.h>

#define AnimationDuration 0.6

#define BlueColor [UIColor colorWithRed:0.f green:185.f/255.f blue:242.f/255.f alpha:1]
#define PurpleColor [UIColor colorWithRed:151.f/255.f green:88.f/255.f blue:254.f/255.f alpha:1]
#define YellowColor [UIColor colorWithRed:1.f green:234.f/255.f blue:57.f/255.f alpha:1]
#define GreenColor [UIColor colorWithRed:32.f/255.f green:218.f/255.f blue:145.f/255.f alpha:1]

@interface ViewController ()
{
    NSArray *themes;
    NSInteger cursor;
    
    CFTimeInterval startTime;
    NSNumber *fromNumber;
    NSNumber *toNumber;
}
@property (nonatomic) SFCircleGradientView *progressView;
@property (nonatomic) UILabel *titleLabel;
@property (nonatomic) UIButton *refreshButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _progressView = [[SFCircleGradientView alloc] initWithFrame:(CGRect){0, 0, 240, 240}];
    [_progressView setCenter:self.view.center];
    [_progressView setLineWidth:6];
    [_progressView setProgress:0];
    [_progressView setRoundedCorners:YES];
    [self.view addSubview:_progressView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:(CGRect){0, 0, 100, 30}];
    [_titleLabel setCenter:self.view.center];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:34]];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:_titleLabel];
    
    _refreshButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_refreshButton addTarget:self action:@selector(onRefresh) forControlEvents:UIControlEventTouchUpInside];
    [_refreshButton setTitle:@"Refresh" forState:UIControlStateNormal];
    [_refreshButton sizeToFit];
    [_refreshButton setCenter:(CGPoint) {self.view.center.x, CGRectGetMaxY(_progressView.frame) + 30}];
    [self.view addSubview:_refreshButton];
    
    cursor = -1;
    themes = @[ @[GreenColor, YellowColor],
                @[GreenColor, PurpleColor],
                @[PurpleColor, BlueColor],
                @[PurpleColor, YellowColor],
                @[BlueColor, YellowColor], ];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self onRefresh];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)onRefresh
{
    [_progressView setProgress:0];
    _titleLabel.text = @"";
    
    __weak __typeof(self)weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf) {
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            [strongSelf locateNewTheme];
        }
    });
}

- (void)locateNewTheme
{
    cursor++;
    if (cursor >= themes.count) {
        cursor = 0;
    }
    UIColor *startColor = [themes[cursor] firstObject];
    UIColor *endColor = [themes[cursor] lastObject];
    
    [_progressView setStartColor:startColor];
    [_progressView setEndColor:endColor];
    [_titleLabel setTextColor:startColor];
    
    CGFloat from = 0.f;
    CGFloat to = 1.f;
    [_progressView setProgress:to animateWithDuration:AnimationDuration];
    [self animateTitle:@(from) toNumber:@(to * 100)];
}

- (void)animateTitle:(NSNumber *)from toNumber:(NSNumber *)to
{
    fromNumber = from;
    toNumber = to;
    _titleLabel.text = [fromNumber stringValue];
    
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(animateNumber:)];
    startTime = CACurrentMediaTime();
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)animateNumber:(CADisplayLink *)link
{
    float dt = ([link timestamp] - startTime) / AnimationDuration;
    if (dt >= 1.0) {
        _titleLabel.text = [toNumber stringValue];
        [link removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        return;
    }
    float current = ([toNumber floatValue] - [fromNumber floatValue]) * dt + [fromNumber floatValue];
    _titleLabel.text = [NSString stringWithFormat:@"%li", (long)current];
}

@end

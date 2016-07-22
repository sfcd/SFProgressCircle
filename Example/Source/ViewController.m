//
//  ViewController.m
//  Example
//
//  Created by Sibagatov Ildar on 21/07/16.
//  Copyright © 2016 SFÇD. All rights reserved.
//

#import "ViewController.h"
#import <SFProgressCircle/SFProgressCircle.h>

static void * ProgressContext = &ProgressContext;

@interface ViewController ()

@property (nonatomic) SFCircleGradientView *progressView;
@property (nonatomic) UILabel *titleLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:252.f/255.f green:77.f/255.f blue:60.f/255.f alpha:1.f];
    
    _progressView = [[SFCircleGradientView alloc] initWithFrame:(CGRect){0, 0, 240, 240}];
    [_progressView setCenter:self.view.center];
    [_progressView setLineWidth:6];
    [_progressView setStartColor:[UIColor whiteColor]];
    [_progressView setEndColor:[[UIColor whiteColor] colorWithAlphaComponent:.0]];
    [_progressView setProgress:0];
    [_progressView setEndAngle:M_PI];
    [self.view addSubview:_progressView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:(CGRect){0, 0, 100, 30}];
    [_titleLabel setCenter:(CGPoint){
        self.view.center.x - CGRectGetWidth(_progressView.frame) / 4,
        self.view.center.y - CGRectGetHeight(_progressView.frame) / 4
    }];
    [_titleLabel setFont:[UIFont boldSystemFontOfSize:34]];
    [_titleLabel setTextColor:[[UIColor whiteColor] colorWithAlphaComponent:0.94]];
    [_titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:_titleLabel];
    
    [_progressView addObserver:self
                    forKeyPath:@"progress"
                       options:NSKeyValueObservingOptionInitial
                       context:ProgressContext];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_progressView setProgress:1 animateWithDuration:.8];
    });
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if (context == ProgressContext) {
        if ([keyPath isEqualToString:NSStringFromSelector(@selector(progress))]) {
            [_titleLabel setText:[NSString stringWithFormat:@"%.0f%%", [(SFCircleGradientView*)object progress] * 100]];
        }
    }
}

- (void)dealloc
{
    [self removeObserver:_progressView forKeyPath:@"progress"];
}

@end

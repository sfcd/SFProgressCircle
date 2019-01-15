//
// SFCircleGradientView.m
//
// The MIT License (MIT)
// Copyright (c) 2016 SFÇD
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#import "SFCircleGradientView.h"
#import "SFCircleGradientLayer.h"

@implementation SFCircleGradientView
{
    SFCircleGradientLayer *_gradientLayer;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView:[self frame]];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initView:CGRectNull];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView:frame];
    }
    return self;
}

- (void)initView:(CGRect)frame
{
    [self setBackgroundColor:[UIColor clearColor]];
    
    _gradientLayer = [self progressLayer];
    _gradientLayer.startColor = [UIColor blackColor];
    _gradientLayer.endColor = [UIColor greenColor];
    
    [self updateLayerData:frame];
    
    self.progress = 1;
    self.lineWidth = 3;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = MAX(0, MIN(1, progress));
    _gradientLayer.progress = progress;
}

- (void)setLineWidth:(CGFloat)value
{
    _lineWidth = value;
    [self updateLayerData:self.frame];
}

- (void)setStartColor:(UIColor *)startColor
{
    _startColor = startColor;
    _gradientLayer.startColor = startColor;
}

- (void)setEndColor:(UIColor *)endColor
{
    _endColor = endColor;
    _gradientLayer.endColor = endColor;
}

- (void)setStartAngle:(CGFloat)startAngle
{
    _startAngle = startAngle;
    _gradientLayer.startAngle = startAngle;
}

- (void)setEndAngle:(CGFloat)endAngle
{
    _endAngle = endAngle;
    _gradientLayer.endAngle = endAngle;
}

- (void)setRoundedCorners:(BOOL)roundedCorners
{
    _roundedCorners = roundedCorners;
    _gradientLayer.roundedCorners = roundedCorners;
}

- (void)updateLayerData:(CGRect)frame
{
    int numSegments = 16;
    CGFloat circleRadius = MIN(CGRectGetWidth(frame), CGRectGetHeight(frame))/2;
    CGFloat circleWidth = _lineWidth;

    _gradientLayer.frame = frame;
    _gradientLayer.numSegments = numSegments;
    _gradientLayer.circleRadius = circleRadius;
    _gradientLayer.circleWidth = circleWidth;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self updateLayerData:self.frame];
}

- (void)setProgress:(CGFloat)progress animateWithDuration:(NSTimeInterval)duration
{
    float currentValue = self.progress;
    self.progress = progress;
    self.progressLayer.progress = progress;
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"progress"];
    anim.fromValue = @(currentValue);
    anim.toValue = @(progress);
    anim.duration = duration;
    anim.repeatCount = 0;
    anim.autoreverses = NO;
    anim.removedOnCompletion = YES;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.progressLayer addAnimation:anim forKey:@"progress"];
}

- (void)abortAnimation
{
    [self.progressLayer removeAnimationForKey:@"progress"];
}

- (SFCircleGradientLayer*)progressLayer{
    SFCircleGradientLayer* layer = (SFCircleGradientLayer*) self.layer;
    layer.contentsScale = [UIScreen mainScreen].scale;
    return layer;
}

+ (Class)layerClass
{
    return [SFCircleGradientLayer class];
}

@end

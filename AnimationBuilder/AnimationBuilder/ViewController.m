//
//  ViewController.m
//  AnimationBuilder
//
//  Created by WeeTom on 14-5-23.
//  Copyright (c) 2014年 ___migndao___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) CGRect fromRect;
@property (assign, nonatomic) CGRect toRect;
@property (assign, nonatomic) BOOL isOpen;
@property (nonatomic, strong) UIImageView *popView;

@end

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"POP", @"POP");
        self.isOpen = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(popOut)];
    
    self.fromRect = CGRectMake(320-147, 64, 147, 160);
    self.toRect = CGRectMake(320, 64, 0, 0);
    self.popView = [[UIImageView alloc] initWithFrame:self.toRect];
    [self.popView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.popView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(alphaOut:)];
    self.popView.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}

- (void)alphaOut:(UITapGestureRecognizer *)tap
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    
    CGPoint point = [tap locationInView:self.view];
    
    springAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, point.x, point.y)];
    
    
    //弹性值
    springAnimation.springBounciness = 20.0;
    //弹性速度
    springAnimation.springSpeed = 20.0;
    
    [self.popView pop_addAnimation:springAnimation forKey:@"changeframe"];

//    POPBasicAnimation *ba = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
//    
//    ba.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    float alpha = self.popView.alpha;
//    if (alpha == 1.0) {
//        ba.toValue = @(0.0);
//    } else {
//        ba.toValue = @(1.0);
//    }
//    
//    [self.popView pop_addAnimation:ba forKey:@"alpha"];
}

- (void)popOut
{
    if (self.isOpen) {
        [self popIn];
        return;
    }
    self.isOpen = YES;
    POPSpringAnimation *sa = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    sa.fromValue = [NSValue valueWithCGRect:self.toRect];
    sa.toValue = [NSValue valueWithCGRect:self.fromRect];
    sa.springBounciness = 15.f;
    sa.springSpeed = 20.f;
    [self.popView pop_addAnimation:sa forKey:@"frameAnimation"];
}

- (void)popIn
{
    POPBasicAnimation *ba = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
    ba.fromValue = [NSValue valueWithCGRect:self.fromRect];
    ba.toValue = [NSValue valueWithCGRect:self.toRect];
    [self.popView pop_addAnimation:ba forKey:@"frameAnimation"];
    self.isOpen = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

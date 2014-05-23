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
    
    self.fromRect = CGRectMake(320-147, 88, 147, 160);
    self.toRect = CGRectMake(320, 88, 0, 0);
    self.popView = [[UIImageView alloc] initWithFrame:self.toRect];
    [self.popView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:self.popView];
}

- (void)popOut
{
    POPSpringAnimation *sa = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
    sa.fromValue = [NSValue valueWithCGRect:self.toRect];
    sa.toValue = [NSValue valueWithCGRect:self.fromRect];
    sa.springBounciness = 15.f;
    sa.springSpeed = 20.f;
    [self.popView pop_addAnimation:sa forKey:@"frameAnimation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

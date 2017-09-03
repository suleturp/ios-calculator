//
//  ViewController.m
//  Calculator
//
//  Created by Şule Turp on 21/08/2017.
//  Copyright © 2017 Şule Turp. All rights reserved.
//
#import "ViewController.h"
#import "CalculatorView.h"



@interface ViewController ()

@property (nonatomic, weak) IBOutlet CalculatorView *viewCalculator;

@end

@implementation ViewController

#pragma mark - FrameworkMethods


- (void)viewDidLoad {
    
    [super viewDidLoad];
    [_viewCalculator result];
}

@end

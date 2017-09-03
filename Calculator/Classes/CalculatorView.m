//
//  CalculatorView.m
//  Calculator
//
//  Created by Şule Turp on 24/08/2017.
//  Copyright © 2017 Şule Turp. All rights reserved.
//

#import "CalculatorView.h"
#import "CalculateModel.h"

@interface CalculatorView ()

@property (nonatomic, strong) CalculateModel *model;

@property (weak, nonatomic) IBOutlet UILabel *labelScreen;

-(IBAction)buttonNumbersTapped:(UIButton*)sender;
-(IBAction)buttonSymbolTapped:(UIButton*)sender;
@end

@implementation CalculatorView


-(void)awakeFromNib{
    [super awakeFromNib];
    _model = [CalculateModel new];
}


-(float)result{
    return [_model result];
}


#pragma mark - ActionMethods
-(IBAction)buttonNumbersTapped:(UIButton*)sender{
    _labelScreen.text = [NSString stringWithFormat:@"%.2f",[_model numberTapped:sender.tag]];
}


-(IBAction)buttonSymbolTapped:(UIButton*)sender{
    _labelScreen.text = [NSString stringWithFormat:@"%.2f",[_model operatorTapped:sender.tag]];
}


@end

//
//  CalculateModel.m
//  Calculator
//
//  Created by Şule Turp on 23/08/2017.
//  Copyright © 2017 Şule Turp. All rights reserved.
//
#import "CalculateModel.h"

@interface CalculateModel ()

@property (nonatomic, assign) float numberOnScreen;
@property (nonatomic, assign) float number;
@property (nonatomic, assign) BOOL typing;
@property (nonatomic, assign) Symbol buttonSymbol;
@property (nonatomic, assign) NumberOfButton buttonNumber;
@property (nonatomic, assign) Symbol previousSymbol;
@property (nonatomic, assign) BOOL numberTapped;

@end


@implementation CalculateModel


-(BOOL) resultIsInteger:(float)number{
    return (number == (int)number);
}


-(float) calculate:(int)previousSymbolTag number:(float)number secondNumber:(float)secondNumber{

    switch(previousSymbolTag){
        case 11:
            number +=  secondNumber;
            break;
        case 12:
            number -=  secondNumber;
            break;
        case 13:
            number *=  secondNumber;
            break;
        case 14:
            number /=  secondNumber;
            break;
    }
    return number;
}


-(float)result;{
    if([self resultIsInteger:_numberOnScreen]){
        int numberOnScreen = (int)_numberOnScreen;
        return numberOnScreen;
    }
    return _numberOnScreen;
}


#pragma mark - Actions


-(float)numberTapped:(NumberOfButton)number{
    
    if(_previousSymbol == SymbolComma){
        _numberOnScreen = _numberOnScreen + [[NSString stringWithFormat:@"0.%d", (int)number] floatValue];
        
        return _numberOnScreen;
    }
    
    if (_typing)
        _numberOnScreen = _numberOnScreen * 10 + (int)number;
    else
        _numberOnScreen = (int)number;
    
    _typing = YES;
    _numberTapped = YES;
    return _numberOnScreen;
}


-(float)operatorTapped:(Symbol)operand{
    switch (operand){
        case SymbolPlus:
        case SymbolMinus:
        case SymbolTimes:
        case SymbolDivision:
            if( ! _numberTapped ){
                if(_previousSymbol == operand){
                    [self resultShow];
                }
                else{
                    _number = 0;
                    [self clearPreviousSymbol];
                    [self clearScreen];
                }
            }
            else{
                [self calculateForMathSymbol:(int)operand];
            }
            return _number;
            
        case SymbolClear:
            _number = 0;
            [self clearPreviousSymbol];
            [self clearScreen];
            return _number;
            
        case SymbolEqual:
            [self operatorTapped:_previousSymbol];
            [self resultShow];
            _number = _numberOnScreen;
            [self clearPreviousSymbol];
            return _number;
            
        case SymbolComma:
            _previousSymbol = SymbolComma;
            return _numberOnScreen;
            
        default:
            break;
    }
    _previousSymbol = operand;
    _numberTapped = NO;
    return 0;
}


#pragma mark - ClearMethods
- (void)clearScreen{
    _numberOnScreen = 0;
}


- (void)clearPreviousSymbol{
    _previousSymbol = SymbolClear;
}


-(void)resultShow{
    if( [self resultIsInteger:_number]){
        _numberOnScreen =(int)_number;

    }
    _numberOnScreen =  _number;
}


#pragma mark - CalculateMethod
- (void)calculateForMathSymbol:(Symbol)newSymbol{
    _typing = NO;
    if(_previousSymbol == SymbolPlus || _previousSymbol == SymbolTimes || _previousSymbol == SymbolDivision || _previousSymbol == SymbolMinus ){
        
        _number = [self calculate:(int)(_previousSymbol) number:_number secondNumber:_numberOnScreen];
        [self resultShow];
    }
    else{
        _number = [self result];
    }
    _previousSymbol = newSymbol;
}
@end

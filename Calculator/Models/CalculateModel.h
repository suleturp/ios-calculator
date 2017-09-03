//
//  CalculateModel.h
//  Calculator
//
//  Created by Şule Turp on 23/08/2017.
//  Copyright © 2017 Şule Turp. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, Symbol)
{
    SymbolNone = 10,
    SymbolPlus,
    SymbolMinus,
    SymbolTimes,
    SymbolDivision,
    SymbolClear,
    SymbolEqual,
    SymbolComma
};

typedef NS_ENUM(NSInteger, NumberOfButton) 
{
    NumberOfButton0 = 0,
    NumberOfButton1,
    NumberOfButton2,
    NumberOfButton3,
    NumberOfButton4,
    NumberOfButton5,
    NumberOfButton6,
    NumberOfButton7,
    NumberOfButton8,
    NumberOfButton9
};

@interface CalculateModel : NSObject

-(float)result;
-(float)numberTapped:(NumberOfButton)number;
-(float)operatorTapped:(Symbol)operand;


@end

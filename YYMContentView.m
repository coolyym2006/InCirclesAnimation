//
//  YYMContentView.m
//  AinmationTest
//
//  Created by coolyym on 2016/12/23.
//  Copyright © 2016年 sooyie. All rights reserved.
//

#import "YYMContentView.h"

@implementation YYMContentView

+(Class)layerClass{
    
    
    return [CAShapeLayer class];
    
}



-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
       
        [self setup];
    }
    return self;
    
}


-(void)awakeFromNib{
   
    [self setup];
}



- (void)setup{
    CAShapeLayer *shapelayer = (CAShapeLayer *)self.layer;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:15];
    shapelayer.path = path.CGPath;
    shapelayer.fillColor = [UIColor clearColor].CGColor;
}

@end

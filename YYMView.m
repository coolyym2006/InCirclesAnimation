//
//  YYMView.m
//  AinmationTest
//
//  Created by coolyym on 2016/12/23.
//  Copyright © 2016年 sooyie. All rights reserved.
//

#import "YYMView.h"
#import "YYMContentView.h"


@interface YYMView ()
#define kWidth 35
@property (nonatomic,strong) YYMContentView * contentView;

@end

@implementation YYMView

+ (YYMView *)shareInstanceYYMView{
    
    static YYMView * instance = nil;
    
    if (!instance) {
        
        instance                     = [[YYMView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kWidth)];
        instance.contentView        = [[YYMContentView alloc] initWithFrame:instance.bounds];
        instance.contentView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height/2);
        [instance addSubview:instance.contentView];
    }
    
    return instance;
}

+ (void)dismiss{
    
    [[[self class] shareInstanceYYMView] removeFromSuperview];
}


+(void)backgroudColor:(UIColor *)color{
    [[self class] shareInstanceYYMView].backgroundColor = color;
}


+ (void)showView{
    
    [YYMView showLoadingOnView:[[[UIApplication sharedApplication] delegate] window]];
}

+ (void)showLoadingOnView:(UIView *)superView{
    
    YYMView *instance = [[self class] shareInstanceYYMView];
    CALayer *layer = [instance ReplicatorLayer];
    
    [instance.contentView.layer addSublayer:layer];
    [superView addSubview:instance];

}



-(CAReplicatorLayer*)ReplicatorLayer{
    

    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = CGRectMake(0, 0,kWidth,kWidth);
    replicator.instanceCount = 10;
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 5, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -5, 0);
    replicator.instanceTransform = transform;
    replicator.instanceBlueOffset  = -0.1;
    replicator.instanceGreenOffset = -0.1;
    replicator.instanceDelay       = 0.1;
    [replicator addSublayer:[self ShapeLayer]];
    
    return replicator;
}



-(CAShapeLayer *)ShapeLayer{
    
    
    CAAnimationGroup *group    = [CAAnimationGroup animation];
    group.repeatCount          = HUGE;
    group.animations           = @[[self BasicAnimationWithIsStart:true],[self BasicAnimationWithIsStart:false]];
    group.duration             = 1;
    group.removedOnCompletion  = NO;
    group.fillMode             = kCAFillModeForwards;
    CAShapeLayer *shape           = [CAShapeLayer layer];
    shape.frame                   = CGRectMake(0, 0, 5, 5);
    shape.path                    = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 10, 10)].CGPath;
    shape.fillColor               = [UIColor redColor].CGColor;
    [shape addAnimation:group forKey:nil];

    
    return shape;
    
}


-(CABasicAnimation *)BasicAnimationWithIsStart:(BOOL)isStart{
    
    
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    
    if (isStart) {
        
        basic.fromValue         = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0)];
        basic.toValue           = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.3, 1.3, 0)];
        
    }
    else{
        basic.fromValue         = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1.3, 1.3, 0)];
        basic.toValue           = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 0.0, 0.0, 0)];

    
    }
    basic.duration          = 1;
    basic.repeatCount       = HUGE;
    basic.fillMode = kCAFillModeForwards;
    basic.removedOnCompletion = NO;


    return basic;
    
}




@end

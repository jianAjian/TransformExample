//
//  Cyclo_MaskAnimatior.m
//  push动画blog
//
//  Created by hlj on 15/7/15.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import "Cyclo_MaskAnimatior.h"

@interface Cyclo_MaskAnimatior ()

@property (nonatomic,assign) CGPoint   beginPosition ;

@property (nonatomic,strong) CAShapeLayer  * maskLayer ;

@property (nonatomic,strong) id <UIViewControllerContextTransitioning>   transitionContext ;


@end

static  NSTimeInterval const  duringTime = 0.5;

static  NSString * const  PathKey = @"path";


@implementation Cyclo_MaskAnimatior


+(Cyclo_MaskAnimatior *)animatiorWithBeginPosition:(CGPoint )beginPosition
{
    Cyclo_MaskAnimatior * animator =[[Cyclo_MaskAnimatior alloc]init];
    
    animator .beginPosition = beginPosition;
    
    return animator;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return duringTime;
}

// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    UIView * containerView =   transitionContext.containerView;
    
    UIViewController * toViewController =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [containerView addSubview:toViewController.view];
    
    //目的View
    UIView * toView =toViewController.view;
    
    
    //1.  原始的path
    UIBezierPath * circleMaskPathInitial =[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake(self.beginPosition.x, self.beginPosition.y, 0, 0), -50,-50)];
    
    //获取距离左右边距的最大值
    CGFloat distanceH =( self.beginPosition.x > (toView.frame.size.width - self.beginPosition.x))?self.beginPosition.x : (toView.frame.size.width - self.beginPosition.x);
    //获取距离上下边距的最大值
    CGFloat distanceV =( self.beginPosition.y > (toView.frame.size.height -  self.beginPosition.y))?self.beginPosition.y : (toView.frame.size.height -  self.beginPosition.y);
    //获取最小圆的半径
    double radius = sqrt((distanceH*distanceH) + (distanceV*distanceV));
    
    //2. 最终的path
    UIBezierPath * circleMaskPathFinal =[UIBezierPath bezierPathWithOvalInRect:CGRectInset(CGRectMake( self.beginPosition.x, self.beginPosition.y, 0, 0), -radius,-radius)];
    
    
    CABasicAnimation * pathAnimation =[CABasicAnimation animationWithKeyPath:PathKey];
    
    pathAnimation . fromValue = (__bridge id)(circleMaskPathInitial.CGPath);
    
    pathAnimation . toValue = (__bridge id)(circleMaskPathFinal.CGPath);
    
    pathAnimation.duration = duringTime;
    
    pathAnimation.removedOnCompletion = YES;
    
    pathAnimation.delegate = self;
    
    toView.layer.mask = self.maskLayer;
    
    [self.maskLayer setValue:pathAnimation.toValue forKey:PathKey];
    
    [self.maskLayer addAnimation:pathAnimation forKey:PathKey];

}


- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.transitionContext completeTransition:YES];
    
    UIViewController * toViewController =[self.transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    toViewController.view.layer.mask = nil;
}



#pragma mark - setter && getter

-(CAShapeLayer *)maskLayer
{
    if (_maskLayer) {
        return _maskLayer;
    }
    _maskLayer =[CAShapeLayer new];
    return _maskLayer;
}



@end

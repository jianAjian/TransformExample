//
//  CommonAnimator.m
//  push动画blog
//
//  Created by hlj on 15/7/15.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import "CommonAnimator.h"

static  NSTimeInterval const  duringTime = 0.5;

static  NSString * const  transformYKey = @"transform.translation.y";


@implementation CommonAnimator

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return duringTime;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
  UIView * containerView =   transitionContext.containerView;
        
    UIViewController * toViewController =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    [containerView addSubview:toViewController.view];
    
    //目的View
    UIView * toView =toViewController.view;
    
    toView.alpha = 0;
    //最基本的动画
    [UIView animateWithDuration:duringTime animations:^{
        toView.alpha = 1;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

    
}




@end

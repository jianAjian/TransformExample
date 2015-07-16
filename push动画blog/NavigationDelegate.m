
//
//  NavigationDelegate.m
//  push动画blog
//
//  Created by hlj on 15/7/14.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import "NavigationDelegate.h"
#import "CommonAnimator.h"
#import "Cyclo_MaskAnimatior.h"

@interface NavigationDelegate ()

@end

@implementation NavigationDelegate


- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC
{
    
    
    switch (self.transformType) {
        case TransformType_cyclo:
        {
            CGPoint point = [self.context CGPointValue];
            Cyclo_MaskAnimatior * animator =[Cyclo_MaskAnimatior animatiorWithBeginPosition:point];
            return animator;
        }
            break;
        case TransformType_common:
        {
            CommonAnimator * animator =[[CommonAnimator alloc]init];
            return animator;
        }
        default:
            break;
    }
    
    return nil;
}



@end

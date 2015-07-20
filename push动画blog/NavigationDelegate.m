
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

@property (nonatomic,strong) UIPercentDrivenInteractiveTransition  * animator;

@end

@implementation NavigationDelegate


- (void)updateInteractiveTransition:(CGFloat)percentComplete
{
    [self.animator updateInteractiveTransition:percentComplete];
}
- (void)cancelInteractiveTransition
{
    [self.animator cancelInteractiveTransition];
    self.animator =nil;
}
- (void)finishInteractiveTransition
{
    [self.animator finishInteractiveTransition];
        self.animator =nil;
}


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
            self.animator = animator;
            return animator;
        }
            break;
        case TransformType_common:
        {
            CommonAnimator * animator =[[CommonAnimator alloc]init];
            self.animator = animator;
            return animator;
        }
        default:
            break;
    }
    
    return nil;
}


-(void)setTransformType:(TransformType)transformType
{
    _transformType = transformType;
    
    switch (self.transformType) {
        case TransformType_cyclo:
        {
            CGPoint point = [self.context CGPointValue];
            Cyclo_MaskAnimatior * animator =[Cyclo_MaskAnimatior animatiorWithBeginPosition:point];
            self.animator = animator;
        }
            break;
        case TransformType_common:
        {
            CommonAnimator * animator =[[CommonAnimator alloc]init];
            self.animator = animator;
        }
    }
}


- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return [self.animator isKindOfClass:[Cyclo_MaskAnimatior class]]?self.animator:nil;
}

@end

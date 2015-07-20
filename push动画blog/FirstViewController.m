//
//  FirstViewController.m
//  push动画blog
//
//  Created by hlj on 15/7/14.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import "FirstViewController.h"
#import "AninationNavigationController.h"
#import "SecondViewController.h"
@interface FirstViewController ()
{
    BOOL touchDirection;
}
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    
    UIPanGestureRecognizer * pan =[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(paned:)];
    
    [self.view addGestureRecognizer:pan];
}


-(void)paned:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    NSLog(@"%f",[gestureRecognizer velocityInView:self.navigationController.view].x);
    
    AninationNavigationController * animaitonNav =(AninationNavigationController *)self.navigationController;

    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStateBegan:
        {
         
            touchDirection =([gestureRecognizer velocityInView:self.view].x >0);
            
            CGPoint translation =[gestureRecognizer  locationInView:self.view];
            
            id obj = [NSValue valueWithCGPoint:translation];
            
            SecondViewController *secondVC =[[SecondViewController alloc]init];
            
            [animaitonNav setAnimationType:TransformType_cyclo Context:obj];
            
            [animaitonNav pushViewController:secondVC animated:YES];
            
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            
            CGPoint translation =[gestureRecognizer  translationInView:self.navigationController.view];
            
            CGFloat completionProgress =(fabs(-translation.x))/CGRectGetWidth(self.navigationController.view.bounds);
            
            [animaitonNav updateInteractiveTransition:completionProgress];
            
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if(  ([gestureRecognizer velocityInView:self.navigationController.view].x<0) != touchDirection)
            {
                [animaitonNav finishInteractiveTransition];
            }else
            {
                [animaitonNav cancelInteractiveTransition];
            }
            break;
        }
            
        default:
        {
            [animaitonNav cancelInteractiveTransition];
            break;
        }
    }
}







@end

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

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor redColor];
    
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SecondViewController *secondVC =[[SecondViewController alloc]init];

    
    UITouch * touch = [touches anyObject];
    
     CGPoint touchPoint =   [touch locationInView:self.view];

    id obj = [NSValue valueWithCGPoint:touchPoint];

    AninationNavigationController * animaitonNav =(AninationNavigationController *)self.navigationController;
    
    [animaitonNav pushViewController:secondVC WithType:TransformType_cyclo Context:obj];
}


@end

//
//  AninationNavigationController.m
//  push动画blog
//
//  Created by hlj on 15/7/14.
//  Copyright (c) 2015年 HLJ. All rights reserved.
//

#import "AninationNavigationController.h"
@interface AninationNavigationController ()
@property (nonatomic,strong) NavigationDelegate   * navgationDelegate ;

@end

@implementation AninationNavigationController


-(void)pushViewController:(UIViewController *)viewController WithType:(TransformType )type Context:(id)context
{
    self.navgationDelegate.context = context;
    self.navgationDelegate.transformType = type;
    [self pushViewController:viewController animated:YES];
    
}

-(UIViewController *)popViewControllerWithType:(TransformType)type Context:(id)context
{
    self.navgationDelegate.context = context;
    self.navgationDelegate.transformType = type;
    return [self popViewControllerAnimated:YES];
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self =[super initWithRootViewController:rootViewController];
    
    if (self) {
        _navgationDelegate =[[NavigationDelegate alloc]init];
        self.navigationBarHidden = YES;
        self.delegate = _navgationDelegate;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

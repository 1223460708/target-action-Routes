//
//  CBTarget_B.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "CBTarget_B.h"
#import "BViewController.h"
@implementation CBTarget_B
- (UIViewController *)CBAction_BnativeFetchDetailViewController:(NSDictionary *)params{
    BViewController *vc = [[BViewController alloc] init];
    vc.bVc_params = params;
    vc.title = @"Bvc";
    return vc;
}

@end

//
//  CBTarget_A.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "CBTarget_A.h"
#import "AViewController.h"
@implementation CBTarget_A
- (UIViewController *)CBAction_AnativeFetchDetailViewController:(NSDictionary *)params{
    AViewController *vc = [[AViewController alloc] init];
    vc.aVc_params = params;
    vc.title = @"Avc";
    return vc;
}
@end

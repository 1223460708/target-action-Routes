//
//  CBMediator+CBModel.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "CBMediator+CBModel.h"

#import "CBErrorViewController.h"

NSString * const AkCBMediatorTargetA = @"A";
NSString * const BkCBMediatorTargetB = @"B";

NSString * const AkCBMediatorActionNativFetchDetailViewController = @"AnativeFetchDetailViewController";
NSString * const BkCBMediatorActionNativFetchDetailViewController = @"BnativeFetchDetailViewController";
NSString * const kCBMediatorTargetError = @"Error";  //由于不存在Tagget_B 所以会返回错误界面

@implementation CBMediator (CBModel)


//-------------------AViewController--------------------------------
- (UIViewController *)CBMediator_ViewController{
    UIViewController *vc = [self performTarget:AkCBMediatorTargetA
                                    withAction:AkCBMediatorActionNativFetchDetailViewController withParams:@{@"key":@"本地组件跳转,这是A界面"}];
    
    if ([vc isKindOfClass:[UIViewController class]]){
        return vc;
    }else {
        return [[CBErrorViewController alloc] init];
    }

}

- (UIViewController *)CBMediator_forUrltoViewController:(NSString *)urlString{
    UIViewController *vc = [self performActionWithUrl:[NSURL URLWithString:urlString] completion:^(NSDictionary *info) {
        NSLog(@"%@",info);
    }];
    
    if ([vc isKindOfClass:[UIViewController class]]){
        return vc;
    }else {
        return [[CBErrorViewController alloc] init];
    }
    
}

//-------------------BViewController--------------------------------
- (UIViewController *)CBMediator_BViewController{
    UIViewController *vc = [self performTarget:BkCBMediatorTargetB
                                    withAction:BkCBMediatorActionNativFetchDetailViewController withParams:@{@"key":@"本地组件跳转,这是B界面"}];
    
    if ([vc isKindOfClass:[UIViewController class]]){
        return vc;
    }else {
        return [[CBErrorViewController alloc] init];
    }
}
- (UIViewController *)CBMediator_forUrltoBViewController:(NSString *)urlString{
    UIViewController *vc = [self performActionWithUrl:[NSURL URLWithString:urlString] completion:^(NSDictionary *info) {
        NSLog(@"%@",info);
    }];
    
    if ([vc isKindOfClass:[UIViewController class]]){
        return vc;
    }else {
        return [[CBErrorViewController alloc] init];
    }
}

//---------------ERROR--------------------
- (UIViewController *)CBMediator_ErrorViewController{
    UIViewController *vc = [self performTarget:kCBMediatorTargetError withAction:@"" withParams:@{@"key":@"错误界面"}];
    
    if ([vc isKindOfClass:[UIViewController class]]){
        return vc;
    }else {
        return [[CBErrorViewController alloc] init];
    }
}
@end

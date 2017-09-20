//
//  CBMediator+CBModel.h
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "CBMediator.h"
#import <UIKit/UIKit.h>
@interface CBMediator (CBModel)

//CBTarget_A
- (UIViewController *)CBMediator_ViewController;
- (UIViewController *)CBMediator_forUrltoViewController:(NSString *)urlString;

//CBTarget_B
- (UIViewController *)CBMediator_BViewController;
- (UIViewController *)CBMediator_forUrltoBViewController:(NSString *)urlString;


//错误界面
- (UIViewController *)CBMediator_ErrorViewController;




@end

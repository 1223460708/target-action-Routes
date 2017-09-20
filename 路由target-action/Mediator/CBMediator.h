//
//  CBMediator.h
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CBMediator : NSObject
+ (instancetype)sharedInstance;

//调用本地组件
- (id)performTarget:(NSString *)target withAction:(NSString *)action withParams:(NSDictionary *)params;


// 远程App调用入口
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion;

@end

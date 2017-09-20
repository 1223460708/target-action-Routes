//
//  CBMediator.m
//  路由target-action
//
//  Created by mac on 2017/9/20.
//  Copyright © 2017年 lifepay. All rights reserved.
//

#import "CBMediator.h"

@implementation CBMediator

#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static CBMediator *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[CBMediator alloc] init];
    });
    return mediator;
}

// 远程App调用入口
/* url规则
 
 scheme://[target]/[action]?[params]
 
 aaa://CBTarget_A/action_A?id=1234
 */
- (id)performActionWithUrl:(NSURL *)url completion:(void(^)(NSDictionary *info))completion{
    NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
    
    NSString *urlQuery = [url query];
    
    for (NSString *param in [urlQuery componentsSeparatedByString:@"&"]){
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if([elts count] < 2) continue;
        [paramsDict setObject:[elts lastObject] forKey:[elts firstObject]];
    }

    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    
    // 这个demo针对URL的路由处理非常简单，就只是取对应的target名字和method名字，但这已经足以应对绝大部份需求。如果需要拓展，可以在这个方法调用之前加入完整的路由逻辑
    id result = [self performTarget:url.host withAction:actionName withParams:paramsDict];
    if (completion) {
        if (result) {
            completion(@{@"result":result});
        } else {
            completion(nil);
        }
    }
    return result;
    
}

//调用本地组件
- (id)performTarget:(NSString *)target withAction:(NSString *)action withParams:(NSDictionary *)params{
    
    NSString *targetString = [NSString stringWithFormat:@"CBTarget_%@",target];
    NSString *actionString = [NSString stringWithFormat:@"CBAction_%@:",action];
    
    Class targetClass = NSClassFromString(targetString);
    SEL actionSel = NSSelectorFromString(actionString);
    
    NSObject *targetObject = [[targetClass alloc]init];
    
    if ([targetObject respondsToSelector:actionSel]){
        return [targetObject performSelector:actionSel withObject:params];
    }else {
        return nil;
    }
    
}
@end

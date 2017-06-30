//
//  UseAfterLifeScopeIssue.m
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/30.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

#import "UseAfterLifeScopeIssue.h"

@implementation UseAfterLifeScopeIssue

+ (void)run
{
    NSError *error = nil;
    [UseAfterLifeScopeIssue validateDictionary:@{ @"b" : @"a" } error:&error];
    
    NSCAssert(!error, @"");
}

+ (void)validateDictionary:(NSDictionary *)dic error:(NSError * __strong *)error
{
    __block BOOL has_value_a = NO;
    [dic enumerateKeysAndObjectsUsingBlock:^(NSString *key, id obj, BOOL *stop) {
        if ([key isEqualToString:@"a"]) {
            has_value_a = YES;
        }
        
        if ([key isEqualToString:@"b"]) {
            *stop = YES;
            if (error) {
                *error = [NSError errorWithDomain:@"Domain2" code:-10002 userInfo:nil];
            }
        }
    }];
    
    if (has_value_a) {
        *error = [NSError errorWithDomain:@"Domain1" code:-10001 userInfo:nil];
    }
}

@end

//
//  ZYBaseTool.m
//  毕业设计纯代码
//
//  Created by apple on 15-4-15.
//  Copyright (c) 2015年 com.zhaoyunyi. All rights reserved.
//

#import "ZYBaseTool.h"
#import "ZYHttpTool.h"
#import "MJExtension.h"

@implementation ZYBaseTool
+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [ZYHttpTool get:url params:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [ZYHttpTool post:url params:params success:^(id responseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:responseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)sessionDataWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [param keyValues];
    
    [ZYHttpTool sessionDataPost:url params:params success:^(id repsonseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:repsonseObj];
            success(result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)sessionDataPostWithTaskUrl:(NSString *)url EncodeParameter:(NSString *)Parameter param:(id)param resultClass:(Class)resultClass success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSError *))failure
{
//    NSDictionary *params = [param keyValues];

    NSDictionary *params = [HMJUtil paramHashWithMD5:param withEncodeParameter:Parameter];
//    DLog(@"%@===params",params);
    
    [ZYHttpTool sessionDataPostWithTask:url params:params success:^(NSURLSessionDataTask *task,id repsonseObj) {
        NSLog(@"%@",repsonseObj);
        if (success) {
            id result = [resultClass objectWithKeyValues:repsonseObj];

            success(task,result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)sessionDataGetWithTaskUrl:(NSString *)url EncodeParameter:(NSString *)Parameter param:(id)param resultClass:(Class)resultClass success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSError *))failure
{
    NSDictionary *params = [HMJUtil paramHashWithMD5:param withEncodeParameter:Parameter];

    [ZYHttpTool sessionDataGetWithTask:url params:params success:^(NSURLSessionDataTask *task,id repsonseObj) {
        if (success) {
            id result = [resultClass objectWithKeyValues:repsonseObj];
            success(task,result);
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

@end

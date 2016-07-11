//
//  ZYHttpTool.h
//  毕业设计纯代码
//
//  Created by apple on 15-4-14.
//  Copyright (c) 2015年 com.zhaoyunyi. All rights reserved.
//  网络请求工具类：负责整个项目的所有HTTP请求

#import <UIKit/UIKit.h>

@interface ZYHttpTool : NSObject

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void(^)(id responseObj))success failure:(void(^)(NSError *error))failure;

+ (void)post:(NSString *)url params: (NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure;

+ (void)sessionDataPost:(NSString *)url params:(NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure;

+ (void)sessionDataPostWithTask:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask *task,id repsonseObj))success failure:(void(^)(NSError *error))failure;

+ (void)sessionDataGetWithTask:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask *task,id repsonseObj))success failure:(void(^)(NSError *error))failure;
+ (void)post1:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure;
//监控网络
+(void)checkNetWork;

@end

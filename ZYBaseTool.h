//
//  ZYBaseTool.h
//  毕业设计纯代码
//
//  Created by apple on 15-4-15.
//  Copyright (c) 2015年 com.zhaoyunyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYBaseTool : NSObject
+ (void)getWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError *))failure;

+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError *))failure;

+ (void)sessionDataWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void(^)(id))success failure:(void (^)(NSError *))failure;

+ (void)sessionDataPostWithTaskUrl:(NSString *)url EncodeParameter:(NSString *)Parameter param:(id)param resultClass:(Class)resultClass success:(void(^)(NSURLSessionDataTask *,id))success failure:(void (^)(NSError *))failure;

+ (void)sessionDataGetWithTaskUrl:(NSString *)url EncodeParameter:(NSString *)Parameter param:(id)param resultClass:(Class)resultClass success:(void (^)(NSURLSessionDataTask *, id))success failure:(void (^)(NSError *))failure;

@end

//
//  ZYTestAFNTool.m
//  华涌理财
//
//  Created by zhaoyunyi on 15/6/17.
//  Copyright (c) 2015年 ZheJiangQiShiTongLian. All rights reserved.
//

#import "ZYTestAFNTool.h"

@implementation ZYTestAFNTool

+ (void)testAFNToolWithParam:(ZYTestAFNParam *)param success:(void(^)(AFTestAFNReslut *result))success failure:(void(^)(NSError *error))failure
{
    [self sessionDataWithUrl:@"" param:param resultClass:[AFTestAFNReslut class] success:success failure:failure];
//    [self getWithUrl:@"http://local.chston.com:10081/index.php/test/zhaoyun" param:param resultClass:[AFTestAFNReslut class] success:success failure:failure];
}

+ (void)testAFNToolWithParamTask:(ZYTestAFNParam *)param success:(void(^)(NSURLSessionDataTask *task, AFTestAFNReslut *result))success failure:(void(^)(NSError *error))failure
{
//    [self sessionDataPostWithTaskUrl:@"" param:param resultClass:[AFTestAFNReslut class] success:success failure:failure];
}

@end

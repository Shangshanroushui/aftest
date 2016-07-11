//
//  ZYTestAFNTool.h
//  华涌理财
//
//  Created by zhaoyunyi on 15/6/17.
//  Copyright (c) 2015年 ZheJiangQiShiTongLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYBaseTool.h"
#import "ZYTestAFNParam.h"
#import "AFTestAFNReslut.h"

@interface ZYTestAFNTool : ZYBaseTool

+ (void)testAFNToolWithParam:(ZYTestAFNParam *)param success:(void(^)(AFTestAFNReslut *result))success failure:(void(^)(NSError *error))failure;

+ (void)testAFNToolWithParamTask:(ZYTestAFNParam *)param success:(void(^)(NSURLSessionDataTask *task, AFTestAFNReslut *result))success failure:(void(^)(NSError *error))failure;

@end

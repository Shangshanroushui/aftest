//
//  ZYHttpTool.m
//  毕业设计纯代码
//
//  Created by apple on 15-4-14.
//  Copyright (c) 2015年 com.zhaoyunyi. All rights reserved.
//
#import "AFNetworking.h"

#import "ZYHttpTool.h"

@implementation ZYHttpTool

+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.responseSerializer.acceptableContentTypes = [manger.responseSerializer.acceptableContentTypes setByAddingObject:@"text/plain"];
    manger.responseSerializer.acceptableContentTypes = [manger.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    DLog(@"%@",url);
    // 2.发送GET请求
    [manger GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"%ld....",(long)operation.response.statusCode);
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)post:(NSString *)url params:(NSDictionary *)params success:(void (^)(id responseObj))success failure:(void (^)(NSError *))failure
{
    url=[NSString stringWithFormat:@"%@%@",DEFAULT_DOMAIN,url];
    DLog(@"%@",url);
    // 1.获得请求管理者
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.responseSerializer =[AFJSONResponseSerializer serializer];
    manger.requestSerializer.timeoutInterval = 5.0;
    // 2.发送post请求
    [manger POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (success) {
            NSLog(@"post +++++json+++ %@",responseObject);
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)sessionDataPost:(NSString *)url params:(NSDictionary *)params success:(void(^)(id repsonseObj))success failure:(void(^)(NSError *error))failure
{
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DEFAULT_DOMAIN,url]];
    
    //1.获得Session请求管理者
    //2.设置Configuration来控制是否后台进行标记
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:requestUrl sessionConfiguration:configuration];
    
    //3.用session发出POST请求
    [sessionManager POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(responseObject);
            NSLog(@"you can be more strong");
            NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)task.response;
            NSInteger responseStatusCode = [httpResponse statusCode];
            NSDictionary *headDict =[httpResponse allHeaderFields];
            NSString *cache_control = headDict[@"Cache-Control"];
            NSLog(@"%ld", (long)responseStatusCode);
            NSLog(@"%@", cache_control);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
   
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 100, 320, 568)];
    //4.接受完所有所做的操作
    [sessionManager setDataTaskDidReceiveDataBlock:^(NSURLSession *session, NSURLSessionDataTask *dataTask, NSData *data) {
        NSURL *baseU = [NSURL URLWithString:@""];
        [webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:baseU];
    }];
    [[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:webView];
}

+ (void)sessionDataPostWithTask:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask *task,id repsonseObj))success failure:(void(^)(NSError *error))failure
{
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@",DEFAULT_DOMAIN,url];
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",DEFAULT_DOMAIN,url]];
    //1.获得Session请求管理者
    //2.设置Configuration来控制是否后台进行标记®®
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:requestUrl sessionConfiguration:configuration];
    sessionManager.responseSerializer.acceptableContentTypes =[sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

        //    mgr.responseSerializer.acceptableContentTypes = [mgr.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
//    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];

    //3.用session发出POST请求
    DLog(@"%@  %@",params,stringUrl);
    [sessionManager POST:stringUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 100, 320, 568)];
//    //4.接受完所有所做的操作
//    [sessionManager setDataTaskDidReceiveDataBlock:^(NSURLSession *session, NSURLSessionDataTask *dataTask, NSData *data) {
//        NSURL *baseU = [NSURL URLWithString:@""];
//        [webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:baseU];
//    }];
//    [[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:webView];
}

+ (void)sessionDataGetWithTask:(NSString *)url params:(NSDictionary *)params success:(void(^)(NSURLSessionDataTask *task,id repsonseObj))success failure:(void(^)(NSError *error))failure
{
    NSString *stringUrl = [NSString stringWithFormat:@"%@%@",DEFAULT_DOMAIN,url];
    DLog(@"%@",stringUrl);
    NSURL *requestUrl = [NSURL URLWithString:stringUrl];
    //1.获得Session请求管理者
    //2.设置Configuration来控制是否后台进行标记
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 10;
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:requestUrl sessionConfiguration:configuration];
    sessionManager.responseSerializer.acceptableContentTypes =[sessionManager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];

//    sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //3.用session发出GET请求
    [sessionManager GET:stringUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"responseObject++++++++%@",responseObject);
        if (success) {
            success(task,responseObject);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
//    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 100, 320, 568)];
//    //4.接受完所有所做的操作
//    [sessionManager setDataTaskDidReceiveDataBlock:^(NSURLSession *session, NSURLSessionDataTask *dataTask, NSData *data) {
//        NSURL *baseU = [NSURL URLWithString:@""];
//        [webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:baseU];
//    }];
//    [[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:webView];
}

- (void)session
{
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@",DEFAULT_DOMAIN]];
    
    //1.获得Session请求管理者
    //2.设置Configuration来控制是否后台进行标记
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.timeoutIntervalForRequest = 10;
    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:requestUrl sessionConfiguration:configuration];
    //3.设置请求序列
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    //测试用，实际应该是从本地account中通过工具类来讲token取出放进请求头中
    [requestSerializer setValue:@"x-zhaoyun-access_token" forHTTPHeaderField:@"x-hello-zhaozhao"];
    sessionManager.requestSerializer = requestSerializer;
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 100, 320, 568)];
    //4.接受完所有所做的操作
    [sessionManager setDataTaskDidReceiveDataBlock:^(NSURLSession *session, NSURLSessionDataTask *dataTask, NSData *data) {
        NSURL *baseU = [NSURL URLWithString:@""];
        [webView loadData:data MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:baseU];
    }];
    [[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:webView];
    
//    //5.用session发出POST请求
//    [sessionManager POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"you can be more strong");
//        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)task.response;
//        NSInteger responseStatusCode = [httpResponse statusCode];
//        NSDictionary *headDict =[httpResponse allHeaderFields];
//        NSString *cache_control = headDict[@"Cache-Control"];
//        NSLog(@"%d", responseStatusCode);
//        NSLog(@"%@", cache_control);
//        //        [self showResponseCode:task.response];
//        
//    } failure:^(NSURLSessionDataTask *task, NSError *error) {
//        
//        //        NSLog(@"",task.response);
//        NSLog(@"%@",error);
//    }];
}

+(void)checkNetWork
{
    NSURL *baseURL = [NSURL URLWithString:@"http://www.baidu.com/"];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"WAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"Wifi");
                [operationQueue setSuspended:NO];
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"NO");
                ALERT(@"提示", @"与网络似乎断开连接，请检查网络");
                break;
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    //开始监控
    [manager.reachabilityManager startMonitoring];
}
+ (void)post1:(NSString *)url params:(NSDictionary *)params success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    [session.requestSerializer setTimeoutInterval:60.0f];//设置超时
    
    session.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    [session POST:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
@end

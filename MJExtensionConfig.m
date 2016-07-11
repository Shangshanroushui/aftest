//
//  MJExtensionConfig.m
//  MJExtensionExample
//
//  Created by MJ Lee on 15/4/22.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "ZYBaseParam.h"
#import "LoginParam.h"

@implementation MJExtensionConfig
/**
 *  这个方法会在MJExtensionConfig加载进内存时调用一次
 */
+ (void)load
{
    // User类的只有name、icon属性参与字典转模型
//    [User setupAllowedPropertyNames:^NSArray *{
//        return @[@"name", @"icon"];
//    }];
    // 相当于在User.m中实现了+allowedPropertyNames方法
    
    // Bag类中的name属性不参与归档
//    [Bag setupIgnoredCodingPropertyNames:^NSArray *{
//        return @[@"name"];
//    }];
    // 相当于在Bag.m中实现了+ignoredCodingPropertyNames方法
    
    // Bag类中只有price属性参与归档
//    [Bag setupAllowedCodingPropertyNames:^NSArray *{
//        return @[@"price"];
//    }];
    // 相当于在Bag.m中实现了+allowedCodingPropertyNames方法
    
    // StatusResult类中的statuses数组中存放的是Status模型
    // StatusResult类中的ads数组中存放的是Ad模型
//    [StatusResult setupObjectClassInArray:^NSDictionary *{
//        return @{
//                 @"statuses" : @"Status",
//                 @"ads" : @"Ad"
//                 };
//    }];
    // 相当于在StatusResult.m中实现了+objectClassInArray方法
    
    // Student中的ID属性对应着字典中的id
    // ....
//    [Student setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"ID" : @"id",
//                 @"desc" : @"desciption",
//                 @"oldName" : @"name.oldName",
//                 @"nowName" : @"name.newName",
//                 @"nameChangedTime" : @"name.info.nameChangedTime",
//                 @"bag" : @"other.bag"
//                 };
//    }];
    // 相当于在Student.m中实现了+replacedKeyFromPropertyName方法
    
//    LoginParam setup
    
//    [LoginParam setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"hashVerify" : @"hash",
//                 };
//    } objectClassInArray:^NSDictionary *{
//        return @{@"hash" : @"hashVerify",
//                 };
//    }];
    
//    [LoginParam setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"hashVerify" : @"hash",
//                 };
//    }];
    
//    [HYProduct setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"productId" : @"id",
//                 };
//    }];
//    
//    [HYPhoneRegistResult setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"userId" : @"id",
//                 };
//    }];
//    
//    [HYUserRegisteResult setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"userId" : @"id",
//                 };
//    }];
//    [HYGetUserCardResult setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"phoneId" : @"id",
//                 };
//    }];
//    [HYOrder setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"orderId" : @"id",
//                 };
//    }];
//    [HYOrderPay setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"payId" : @"id",
//                 };
//    }];
//    [HYBuyProductResult setupReplacedKeyFromPropertyName:^NSDictionary *{
//        return @{@"cacheId" : @"id",
//                 };
//    }];
}
@end

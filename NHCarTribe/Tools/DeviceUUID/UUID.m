//
//  UUID.m
//  BaiKeLive
//
//  Created by chendb on 16/3/29.
//  Copyright © 2016年 simope. All rights reserved.
//

#import "UUID.h"
#import "KeyChainStore.h"
#import <CommonCrypto/CommonDigest.h>



@implementation UUID

+(NSString *)getUUID
{
    NSString * strUUID = (NSString *)[KeyChainStore load:@"com.company.app.usernamepassword"];
    
    //首次执行该方法时，uuid为空
    if ([strUUID isEqualToString:@""] || !strUUID)
    {
        //生成一个uuid的方法
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef));
        
        //将该uuid保存到keychain
        [KeyChainStore save:UUIDKEY data:strUUID];
        
    }
    
    NSString *MD5UUID = [self md5HexDigest:strUUID];
    
    return MD5UUID;
}

#define CC_MD5_DIGEST_LENGTH 16
+ (NSString *)md5HexDigest:(NSString *)input{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)input.length, result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02X",result[i]];
    }
    
    return ret;
}


@end

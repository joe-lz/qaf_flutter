//
//  MPaaSInterface+Runner.m
//  Runner
//
//  Created by bangdong.chen on 2020/08/27.
//  Copyright © 2020 Alibaba. All rights reserved.
//

#import "MPaaSInterface+Runner.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation MPaaSInterface (Runner)

- (BOOL)enableSettingService
{
    return NO;
}

- (NSString *)userId
{
    return nil;
}

@end

#pragma clang diagnostic pop

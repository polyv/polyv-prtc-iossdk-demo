//
//  PLVMenuItem.m
//  PolyvRtcSdkDemo
//
//  Created by mac on 2021/5/10.
//  Copyright © 2021 Polyv. All rights reserved.
//

#import "PLVMenuItem.h"

@implementation PLVMenuItem

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.title = [dict objectForKey:@"title"];
        self.imageName = [dict objectForKey:@"imageName"];
    }
    return self;
}

+ (instancetype)menuItemWithDict:(NSDictionary *)dict
{
    return  [[PLVMenuItem alloc] initWithDict:dict];
}


@end

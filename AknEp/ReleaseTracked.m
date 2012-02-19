//
//  ReleaseTracked.m
//  AknEp
//
//  Created by 鈴木 聡史 on 12/02/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ReleaseTracked.h"

@implementation ReleaseTracked

- (id) initWithName: (NSString*) aName
{
    self = [super init];
    if (self != nil) {
        name = aName;
    }
    return self;
}

- (void) dealloc
{
    NSLog(@"delloc: %@" ,name);
}

@end

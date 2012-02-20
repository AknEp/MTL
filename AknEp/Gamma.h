//
//  Gamma.h
//  AknEp
//
//  Created by AknEp on 12/02/20.
//  Copyright (c) 2012年 AknEp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReleaseTracked.h"

@interface Gamma : NSObject

@property NSInteger number;
@property (readonly) NSInteger myConstant;
@property (strong) ReleaseTracked* strong;
@property (weak) ReleaseTracked* weak;

@end

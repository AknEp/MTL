//
//  Beta.h
//  AknEp
//
//  Created by AknEp on 12/02/20.
//  Copyright (c) 2012年 AknEp. All rights reserved.
//

// プロパティとARCの動作サンプル

#import <Foundation/Foundation.h>
#import "ReleaseTracked.h"

@interface Beta : NSObject{
    ReleaseTracked * strong;
    __weak ReleaseTracked * weak;
}

@property (strong) ReleaseTracked* strong;
@property (weak)   ReleaseTracked* weak;


@end

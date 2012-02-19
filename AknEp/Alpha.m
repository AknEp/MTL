//
//  Alpha.m
//  AknEp
//
//  Created by AknEp on 12/02/20.
//  Copyright (c) 2012年 AknEp. All rights reserved.
//

#import "Alpha.h"

@implementation Alpha

// まずは普通の定義
@synthesize a;


// インスタンス変数名が異なる場合
@synthesize b=myB;


// 自力で定義する場合
@dynamic c; // 書かなくても構わない
- (int) c 
{
    return c;
}
- (void) setC : (int) c_
{
    c = c_;
}


// インスタンス変数を自動生成させる場合
// ちなみに、コレの場合は自クラス内からも self.d でアクセスする
@synthesize d;


@end

//
//  Gamma.m
//  AknEp
//
//  Created by AknEp on 12/02/20.
//  Copyright (c) 2012年 AknEp. All rights reserved.
//

// クラス変数、クラス定数のサンプル

#import "Gamma.h"

// クラス変数としてふるまうC言語のstatic変数
// ファイル直下に記述されたstatic変数は、このファイル内であればobj-CコードでもCコードでも読み込みが可能である。
// 大学の授業などでも頻繁に使われる関数内のstatic変数とは、少しだけ振る舞いが異なるので注意。

// そういや、インスタンス変数は.hに書くのに、こっちは.mに書かなきゃならないの、嫌ですね。 インスタンス変数を .m に書くって手もあるけどね。


// クラス変数
static NSInteger number = 9;

// クラス定数
const static NSInteger myConstant = 42; // 人類、宇宙、すべての答え

// クラス変数 (オブジェクト)
static ReleaseTracked* strong = nil;

// クラス変数 (オブジェクト)
static __weak ReleaseTracked* weak = nil;


@implementation Gamma

- (NSInteger)number
{
    return number;
}

- (void)setNumber:(NSInteger)aNumber
{
    number = aNumber;
}

// 最近どうも、こうするしかない気がしてるんですが、どうなんでしょうね…？ 場合によってはクラスメソッドかな。
- (NSInteger)myConstant
{
    return myConstant;
}

- (ReleaseTracked *)strong
{
    return strong;
}

- (void)setStrong:(ReleaseTracked *)aStrong
{
    strong = aStrong;
}

- (ReleaseTracked *)weak
{
    return weak;
}

- (void)setWeak:(ReleaseTracked *)aWeak
{
    weak = aWeak;
}

@end

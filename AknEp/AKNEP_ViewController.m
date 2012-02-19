//
//  AKNEP_ViewController.m
//  AknEp
//
//  Created by AknEp on 12/02/20.
//  Copyright (c) 2012年 AknEp. All rights reserved.
//

#import "AKNEP_ViewController.h"
#import "Alpha.h"
#import "Beta.h"
#import "Gamma.h"
#import "Alpha+Delta.h"
#import "EpsilonDelegate.h"
#import "ReleaseTracked.h"

@implementation AKNEP_ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Sample Codes.

- (void) sampleDelegateOnEpsilon: (NSObject<EpsilonDelegate> *) obj
{
    [obj sampleDelegate];
}

- (void)alpha{
    NSLog(@"********** Alpha **********");
    
    // プロパティ
    Alpha* alpha = [[Alpha alloc] init];
    
    alpha.a = 1;
    NSLog(@"%i" , alpha.a); // nil
    alpha.b = 2;
    NSLog(@"%i" , alpha.b); // nil
    alpha.c = 3;
    NSLog(@"%i" , alpha.c); // nil
    alpha.c = 4;
    NSLog(@"%i" , alpha.d); // nil
}

- (void)beta{
    NSLog(@"********** Beta **********");
    
    // プロパティとARC
    Beta* beta = [[Beta alloc] init];
    
    ReleaseTracked* strong = [[ReleaseTracked alloc] initWithName:@"strong"];
    ReleaseTracked* weak   = [[ReleaseTracked alloc] initWithName:@"weak"];   // weakって変数名だけど、この変数自体はstrongな参照ですね。。
    
    beta.strong = strong;
    beta.weak   = weak;
    
    NSLog(@"Set strong nil");
    strong = nil;
    
    NSLog(@"Set weak nil");
    weak = nil; // ここでオブジェクトが解放される。 beta.weak は解放されたポインタなので使おうとするとアプリケーションが落ちる。
    
    NSLog(@"Set beta.strong nil");
    beta.strong = nil; // ここでオブジェクトが解放される。 strong は変なところで解放されない。されてほしくてもされない。
    
    NSLog(@"Set beta.weak nil");
    beta.weak = nil;
    
    NSLog(@"End of Method.(= end of local variable scope)");
    
    // 注記：この様に、滅多にweakを使う場面は無いのだけど、循環(特に多いのが相互)参照が起きる場合に限って使う。
    // また、これを考慮するのは面倒なので、設計の段階で出来るだけクラスの構造が木構造になるようにするのが望ましいと思う。まぁ好みだけど。
    // iOS開発では、デリゲートを利用するときに、この辺りの解放に関連する問題が起きやすい。
}

- (void)gamma{
    NSLog(@"********** Gamma **********");
    
    // クラス変数(の代わりに使うC static変数)とARC
    Gamma* gamma1 = [[Gamma alloc] init];
    Gamma* gamma2 = [[Gamma alloc] init];
    
    gamma1.number = 5;
    NSLog(@"Set gamma1.number 5;");
    NSLog(@"gamma1.number is %i;",gamma1.number);
    NSLog(@"gamma2.number is %i;",gamma2.number);
    
    gamma2.number = 8;
    NSLog(@"Set gamma1.number 8;");
    NSLog(@"gamma1.number is %i;",gamma1.number);
    NSLog(@"gamma2.number is %i;",gamma2.number);
    
    NSLog(@"gamma1.myConstant is %i;",gamma1.myConstant);
    
    
    ReleaseTracked* strong = [[ReleaseTracked alloc] initWithName:@"strong"];
    ReleaseTracked* weak   = [[ReleaseTracked alloc] initWithName:@"weak"];   // weakって変数名だけど、この変数自体はstrongな参照ですね。。
    
    gamma1.strong = strong;
    gamma2.strong = strong;
    gamma1.weak   = weak;
    gamma2.weak   = weak;
    
    NSLog(@"Set strong nil");
    strong = nil;
    
    NSLog(@"Set weak nil");
    weak = nil; // ここでweakが解放される。
    
    NSLog(@"Set gamma1.strong nil");
    gamma1.strong = nil; // ここでstrongが解放される。 gamma2.strong はnilになっているので、そんなに危険ではない。良く出来てる。
    
    NSLog(@"Set gamma1.weak nil");
    gamma1.weak = nil;
    
    
    NSLog(@"End of Method.(= end of local variable scope)");
    
}

- (void)delta{
    NSLog(@"********** Delta **********");
    // カテゴリとプロトコル
    
    Alpha* delta = [[Alpha alloc] init];
    
    // 元々のAlphaに無い機能を、利用側のファイル単位で任意に追加出来る。とても柔軟。
    // デリゲートも、カテゴリとして実装すると綺麗なケースがあります。(クラス分けた方が無難です、、、)
    
    [self sampleDelegateOnEpsilon: delta];
    
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self alpha];
    [self beta];
    [self gamma];
    [self delta];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

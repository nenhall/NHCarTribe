//
//  NHSearchBar.m
//  NHCarTribe
//
//  Created by simope on 16/7/13.
//  Copyright © 2016年 NegHao.W. All rights reserved.
//

#import "NHSearchBar.h"

@interface NHSearchBar ()
@property (nonatomic, weak) UITextField *search;
@end

@implementation NHSearchBar

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self addSearchBar];
        self.backgroundColor = kNHWhiteColor;
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    _search.frame = self.bounds;
    
}

- (void)addSearchBar{

    UITextField *search = [[UITextField alloc] init];
    search.frame = self.bounds;
    search.borderStyle = UITextBorderStyleRoundedRect;
//    search.backgroundColor = kNHBlueColor;
    search.placeholder = @"搜车...";
    [self addSubview:search];
    _search = search;
}


@end

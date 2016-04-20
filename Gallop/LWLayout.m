//
//  The MIT License (MIT)
//  Copyright (c) 2016 Wayne Liu <liuweiself@126.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//　　The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
////`
//
//  LWAutoLayout.m
//  LWAsyncDisplayViewDemo
//
//  Created by 刘微 on 16/4/7.
//  Copyright © 2016年 WayneInc. All rights reserved.
//

#import "LWLayout.h"
#import "LWStorage+Constraint.h"


@interface LWLayout ()


@property (nonatomic,strong) NSMutableArray* totalStorages;

@end

@implementation LWLayout

- (id)initWithTextStorages:(NSArray<LWTextStorage *>*)textStorages
             imageStorages:(NSArray<LWImageStorage *>*)imageStorages {
    self = [super init];
    if (self) {
        self.textStorages = [textStorages copy];
        self.imageStorages = [imageStorages copy];
        for (LWTextStorage* textStorage in self.textStorages) {
            [textStorage creatCTFrameRef];
            [self.totalStorages addObject:textStorage];
        }
        [self.totalStorages addObjectsFromArray:self.imageStorages];
    }
    return self;
}


- (CGFloat)suggestHeightWithBottomMargin:(CGFloat)bottomMargin {
    CGFloat suggestHeight = 0.0f;
    for (LWTextStorage* storage in self.totalStorages) {
        suggestHeight = suggestHeight > storage.bottom ? suggestHeight :storage.bottom;
    }
    return suggestHeight + bottomMargin;
}

- (NSMutableArray *)totalStorages {
    if (_totalStorages) {
        return _totalStorages;
    }
    _totalStorages = [[NSMutableArray alloc] init];
    return _totalStorages;
}
@end
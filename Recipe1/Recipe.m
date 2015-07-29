//
//  Recipe.m
//  Recipe1
//
//  Created by Rod Johnson on 7/27/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe



- (instancetype)initWithTitle:(NSString *)title
                  andContent:(NSString *)content
{
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
    }
    return self;
}

@end

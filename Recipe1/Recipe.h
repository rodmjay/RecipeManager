//
//  Recipe.h
//  Recipe1
//
//  Created by Rod Johnson on 7/27/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property NSString *title;
@property NSString *content;

- (instancetype)initWithTitle:(NSString *)title
                   andContent:(NSString *)content;

@end

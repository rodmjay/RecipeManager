//
//  RecipeManager.h
//  Recipe1
//
//  Created by Rod Johnson on 7/27/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recipe.h"

@interface RecipeManager : NSObject{
    NSMutableArray *recipes;
}

@property (nonatomic, retain) NSMutableArray *recipes;

+ (id)sharedManager;

- (void)addRecipeWithTitle :(NSString*)title
      withContent : (NSString*)content;

- (void)removeRecipe :(int)identifier;

- (Recipe*)getRecipe: (NSInteger)identifier;

@end

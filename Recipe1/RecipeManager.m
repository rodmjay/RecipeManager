//
//  RecipeManager.m
//  Recipe1
//
//  Created by Rod Johnson on 7/27/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

#import "RecipeManager.h"

@implementation RecipeManager

@synthesize recipes;

+ (id)sharedManager{
    static RecipeManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc]init];
    });
    return sharedManager;
}

-(id)init{
    if(self=[super init]){
        recipes = [NSMutableArray new];
    }
    return self;
}

- (void)addRecipeWithTitle:(NSString *)title withContent:(NSString *)content
{
    Recipe *recipe = [[Recipe alloc]initWithTitle:title andContent:content];
    //[self.recipes addObject:recipe];
    
    [[self recipes] addObject:recipe];
    
    NSLog(@"Recipe Info: %@ %@", [recipe title], [recipe content]);
}

- (void)removeRecipe:(int)identifier{
    //[self.recipes removeObjectAtIndex:identifier];
}

- (Recipe*)getRecipe:(NSInteger)identifier{
    if(self.recipes.count > 0){
        return (Recipe*)self.recipes[identifier];
    }
    return [[Recipe alloc]init];
}


@end

//
//  ViewController.m
//  Recipe1
//
//  Created by Rod Johnson on 7/27/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

#import "ViewController.h"
#import "CustomCell.h"
#import "DetailsViewController.h"
#import "RecipeManager.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

NSMutableArray *tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RecipeManager *manager = [RecipeManager sharedManager];
    tableData = manager.recipes;
}

- (void)viewDidAppear{
    [_tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[RecipeManager sharedManager] recipes].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *reuseIdentifier = @"SimpleTableItem";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if(cell == nil){
        cell = (CustomCell*)[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    RecipeManager *manager = [RecipeManager sharedManager];
    Recipe *recipe = [manager getRecipe:indexPath.row];
    
    cell.textLabel.text = recipe.title;
    cell.Recipe = recipe;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier  isEqual: @"detailview"]){
        CustomCell *cell = ((CustomCell *)sender);
        DetailsViewController *detailsController = ((DetailsViewController *)segue.destinationViewController);
        detailsController.preRecipe = cell.Recipe;
    }
}


@end

//
//  AddViewController.m
//  Recipe1
//
//  Created by Rod Johnson on 7/27/15.
//  Copyright (c) 2015 Rod Johnson. All rights reserved.
//

#import "AddViewController.h"
#import "RecipeManager.h"
#import "ViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleText;
@property (weak, nonatomic) IBOutlet UITextView *detailText;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //_titleText.text = @"asdf";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textTitleDidChange) name:UITextFieldTextDidChangeNotification object:nil];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recipeContentDidChange) name:UITextViewTextDidChangeNotification object:nil];
    
    [self handleButtonStates];
    
}

- (void)textTitleDidChange{
    [self handleButtonStates];
}

- (void)recipeContentDidChange{
    [self handleButtonStates];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)doneButtonClick:(id)sender {
    [_detailText resignFirstResponder];
}
- (IBAction)titleDoneButton:(id)sender {
    [_titleText resignFirstResponder];
}

- (void)handleButtonStates{
    
    // handle done button
    if([_detailText.text isEqual:@""]==FALSE){
        _doneButton.enabled = true;
    }else{
        _doneButton.enabled = false;
    }
    
    // handle add button
    if([_detailText.text isEqual:@""]==FALSE && [_titleText.text isEqual:@""]==FALSE){
        _addButton.enabled = true;
        
        [_addButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }else{
        
            _addButton.enabled = false;
            
            [_addButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
}
- (IBAction)addButtonClick:(id)sender {
    
   
    
    [_activityIndicator startAnimating];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 1 * NSEC_PER_SEC);
    
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [_activityIndicator stopAnimating];
        
        ViewController *viewController = [[ViewController alloc]init];
        
        [self.navigationController popToViewController:viewController animated:FALSE];
    });
    
    RecipeManager *manager = [RecipeManager sharedManager];
    [manager addRecipeWithTitle:[_titleText text] withContent:[_detailText text]];
    _titleText.text = @"";
    _detailText.text = @"";
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  TipViewController.m
//  tipCalculator
//
//  Created by  Yugender Boini on 1/14/17.
//  Copyright © 2017 sample. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
}

- (void)viewWillAppear:(BOOL)animated
{
    // Set the default tip percentage from the user settings
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int tipSegmentIndex = (int)[defaults integerForKey:@"default_tip_amount_index"];
    [self.tipControl setSelectedSegmentIndex:tipSegmentIndex];
    [self updateValues];
    
    // Put focus on the text field to make sure the keyboard shows
    [self.billTextField becomeFirstResponder];
    
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (void) updateValues {
    // get the bill amount
    float billAmount = [self.billTextField.text floatValue];
    
    NSArray *tipValues = @[@0.15f, @0.2f, @0.25f];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}
- (IBAction)onTipValueChanged:(UISegmentedControl *)sender {
    [self updateValues];
}


@end

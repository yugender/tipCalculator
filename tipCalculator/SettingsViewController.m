//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by  Yugender Boini on 1/15/17.
//  Copyright © 2017 sample. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipSegmentIndex = (int)[defaults integerForKey:@"default_tip_amount_index"];
    [self.tipControl setSelectedSegmentIndex:defaultTipSegmentIndex];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self updateDefaultTip];
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateDefaultTip {
    // Save the default tip percentage
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"default_tip_amount_index"];
    [defaults synchronize];
}

- (IBAction)tipValueChanged:(UISegmentedControl *)sender {
    [self updateDefaultTip];
}

@end

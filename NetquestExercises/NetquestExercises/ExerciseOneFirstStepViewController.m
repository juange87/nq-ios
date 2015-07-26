//
//  ExerciseOneFirstStepViewController.m
//  NetquestExercises
//
//  Created by Juan Jesus Fernandez Madrid on 25/7/15.
//  Copyright (c) 2015 Juan Jesus Fernandez Madrid. All rights reserved.
//

#import "ExerciseOneFirstStepViewController.h"
#import "ExerciseOneSecondStepViewController.h"

#import "KSToastView.h"

@interface ExerciseOneFirstStepViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) NSString *name;

@end

@implementation ExerciseOneFirstStepViewController

@synthesize nameTextField;
@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Step One";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ACTIONS

-(IBAction)openWelcome:(id)sender{
    name = nameTextField.text;
    
    if (name.length == 0) {
        [KSToastView ks_showToast:@"You should introduce text" duration:2.0f];
    } else {
        [self performSegueWithIdentifier: @"openWelcomeViewController" sender: self];
    }
}

#pragma mark - TEXT FIELD DELEGATE

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"openWelcomeViewController"]) {
        ExerciseOneSecondStepViewController* userViewController = [segue destinationViewController];
        userViewController.name = name;
    }
}

@end

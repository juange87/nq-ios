//
//  ViewController.m
//  NetquestExercises
//
//  Created by Juan Jesus Fernandez Madrid on 25/7/15.
//  Copyright (c) 2015 Juan Jesus Fernandez Madrid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"NETQUEST";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - ACTIONS

-(IBAction)openExercise1:(id)sender{
    [self performSegueWithIdentifier: @"openExercise1" sender: self];
}

-(IBAction)openExercise2:(id)sender
{
    [self performSegueWithIdentifier: @"openExercise2" sender: self];
}

@end

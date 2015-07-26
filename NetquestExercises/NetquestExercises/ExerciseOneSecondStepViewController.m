//
//  ExerciseOneSecondStepViewController.m
//  NetquestExercises
//
//  Created by Juan Jesus Fernandez Madrid on 25/7/15.
//  Copyright (c) 2015 Juan Jesus Fernandez Madrid. All rights reserved.
//

#import "ExerciseOneSecondStepViewController.h"

@interface ExerciseOneSecondStepViewController ()

@property (weak, nonatomic) IBOutlet UILabel *welcomeMessageLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentTimeLabel;

@end

@implementation ExerciseOneSecondStepViewController

@synthesize name;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Step Two";

    self.welcomeMessageLabel.text = [NSString stringWithFormat:@"Hello %@!", self.name ];

    [self timer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)timer
{
    [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
}

- (void)updateTime
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSDateFormatter *formatter;
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"dd/MM/yyyy HH:mm:ss.SSS"];
        NSString *timeText;
        timeText = [formatter stringFromDate:[NSDate date]];

        dispatch_async(dispatch_get_main_queue(), ^{
            self.currentTimeLabel.text = [NSString stringWithFormat:@"Current Time %@", timeText ];
        });
    });
}

@end

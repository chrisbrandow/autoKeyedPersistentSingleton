//
//  ViewController.m
//  autoKeyedPersistentSingletonDemo
//
//  Created by Christopher Brandow on 10/3/14.
//  Copyright (c) 2014 Flouu. All rights reserved.
//

#import "ViewController.h"
#import "AKPSObject.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AKPSObject *thisInstance = [AKPSObject sharedInstance];
    
    //first time you run app, thisInstance.testArray should be nil
    //if you change thisInstance.testArray belowthen the initial log will be different from the
    //second log.
    
    NSLog(@"array: %@", thisInstance.testArray);
    thisInstance.testArray = @[@"one", @"two", @"three"];

    
    NSLog(@" intere %@, hodin %@", interiorArray, holdingArray);
    
    if (thisInstance.thisColor) {
        self.label.backgroundColor = thisInstance.thisColor;
    }

    NSLog(@"array: %@", thisInstance.testArray);
    [thisInstance save];
    
    NSString *buttonTitle;
    if ([thisInstance.thisColor isEqual:[UIColor blueColor]]) {
        
        buttonTitle = [NSString stringWithFormat:@"stored color is currently %@", @"blue" ];
        
    } else {
        buttonTitle = [NSString stringWithFormat:@"stored color is currently %@", @"orange" ];
        
    }
    
    [self.toggleButton setTitle:buttonTitle forState:UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeButtonAction:(id)sender {
    AKPSObject *thisInstance = [AKPSObject sharedInstance];
    
    NSString *buttonTitle = @"";
    NSLog(@"color after press: %@", thisInstance.thisColor);


    if ([thisInstance.thisColor isEqual:[UIColor blueColor]]) {
        
        thisInstance.thisColor = [UIColor orangeColor];
        buttonTitle = [NSString stringWithFormat:@"stored color is now %@", @"orange" ];
        NSLog(@"found blue");
        
        
    } else {
        thisInstance.thisColor = [UIColor blueColor];
        buttonTitle = [NSString stringWithFormat:@"stored color is now %@", @"blue" ];
        NSLog(@"found orange %@", buttonTitle);

    }

    [self.toggleButton setTitle:buttonTitle forState:UIControlStateNormal];

    [thisInstance save];
    NSLog(@"color after press: %@", thisInstance.thisColor);
}

@end

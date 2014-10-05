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
@property (weak, nonatomic) IBOutlet UILabel *storageLabel;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AKPSObject *thisInstance = [AKPSObject sharedInstance];
    
    //first time you run app, thisInstance.testArray should be nil
    //if you change thisInstance.testArray belowthen the initial log will be different from the
    //second log.
    
    thisInstance.testArray = @[@"one", @"two", @"three"];
    thisInstance.anotherPropertyName = 5.4;
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAction:(id)sender {
    
    AKPSObject *thisInstance = [AKPSObject sharedInstance];
    
    [thisInstance save];
    
    self.storageLabel.backgroundColor = thisInstance.thisColor;


}
- (IBAction)changeButtonAction:(id)sender {
    
    AKPSObject *thisInstance = [AKPSObject sharedInstance];
    
    thisInstance.thisColor = ([thisInstance.thisColor isEqual:[UIColor blueColor]]) ? [UIColor orangeColor] :  [UIColor blueColor];

    self.label.backgroundColor = thisInstance.thisColor;

}

- (void)setupUI {
    
    AKPSObject *thisInstance = [AKPSObject sharedInstance];

    NSArray *views = @[self.toggleButton, self.saveButton, self.label, self.storageLabel];
    
    for (UIView *v  in views) {
        v.layer.cornerRadius = v.frame.size.height/2;
        v.layer.masksToBounds = YES;
    }
    
    self.label.backgroundColor = thisInstance.thisColor;
    self.storageLabel.backgroundColor = thisInstance.thisColor;
    
}


@end

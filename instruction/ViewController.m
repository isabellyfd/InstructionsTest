//
//  ViewController.m
//  instruction
//
//  Created by Isabelly Damascena on 16/01/17.
//  Copyright © 2017 Isabelly Damascena. All rights reserved.
//

#import "ViewController.h"
#import "instruction-Swift.h"

@interface ViewController ()
    @property (nonatomic, strong) InstructionsManager *instruction;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.instruction = [[InstructionsManager alloc] initWithParentViewController:self];
    self.instruction.highLightedView = self.myView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.instruction startTour];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

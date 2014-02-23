//
//  STHomeViewController.m
//  MVC
//
//  Created by SACHIN THAKUR on 8/14/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import "STHomeViewController.h"

#import "STController.h"


@interface STHomeViewController ()

@end

@implementation STHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [[STController sharedInstance] action:GOOGLE Params:nil CompleteBlock:^(NSMutableDictionary *dic, NSError *error) {
        NSLog(@"Crrrrryyÿ");
    } AndView:self.view];
    
}


-(void)viewWillDisappear:(BOOL)animated{
    [[STController sharedInstance] cancelOrCompleteAction:GOOGLE];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

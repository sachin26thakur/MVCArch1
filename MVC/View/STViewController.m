//
//  STViewController.m
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import "STViewController.h"

#import "STController.h"

#import "ST_UIManager.h"

#import "STHomeViewController.h"



@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[STController sharedInstance] action:GOOGLE Params:nil CompleteBlock:^(NSMutableDictionary *dic, NSError *error) {
        NSLog(@"%@",dic);
    } AndView:self.view];
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
   
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonAction:(id)sender {
    
    
    STHomeViewController *home = [[STHomeViewController alloc] initWithNibName:@"STHomeViewController" bundle:nil];
    [self.navigationController pushViewController:home animated:YES];
    
    
}



@end















//
//  ST_UIManager.m
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import "ST_UIManager.h"

@implementation ST_UIManager

+(MBProgressHUD *)showLoaderWithView:(UIView*)view{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading...";
    return hud;
}

+(void)hideLoaderWithHud:(MBProgressHUD*)hud{
    [hud hide:YES];
}



@end

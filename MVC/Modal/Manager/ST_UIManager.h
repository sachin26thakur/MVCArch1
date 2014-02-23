//
//  ST_UIManager.h
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBProgressHUD.h"

@interface ST_UIManager : NSObject


+(MBProgressHUD *)showLoaderWithView:(UIView*)view;
+(void)hideLoaderWithHud:(MBProgressHUD*)hud;


@end

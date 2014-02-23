//
//  STController.h
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STCallBacks.h"





@interface STController : NSObject

//Singleton Pattern
+(STController*)sharedInstance;

//This is class method, where we will give the name of action and necessary parameter
-(void)action:(ActionName)action Params:(NSDictionary*)params CompleteBlock:(CompletionBlock)completeBlock AndView:(UIView*)view;

//Here we can cancel particular action
-(void)cancelOrCompleteAction:(ActionName)action;

@end

































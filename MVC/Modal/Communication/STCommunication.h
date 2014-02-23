//
//  STCommunication.h
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "STCallBacks.h"

@interface STCommunication : NSObject


-(id)initWithServiceName:(ActionName)action AndParams:(NSDictionary*)params AndCompletionBlock:(CompletionBlock)completeBlock;

-(void)start;
-(void)stop;


@end

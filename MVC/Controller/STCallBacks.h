//
//  STCallBacks.h
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^CompletionBlock)(NSMutableDictionary* dic,NSError *error);

typedef enum{
    GOOGLE,
    STACK_OVERFLOW,
    REYWENDERLICH,
    SHABDKOSH,
    LOG_IN
}ActionName;












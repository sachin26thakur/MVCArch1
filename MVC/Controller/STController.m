//
//  STController.m
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import "STController.h"

#import "STCommunication.h"

#import "ST_UIManager.h"

#define BLOCK_SAFE_RUN(block, ...) block ? block(__VA_ARGS__) : nil


@interface STController()

-(void)actionWithGoogle:(NSDictionary*)params;

@property(nonatomic,strong) NSMutableDictionary *communicationQueue;
@property(nonatomic,strong) NSMutableDictionary *blockQueue;
@property(nonatomic,strong) NSMutableDictionary *hudQueue;

@end



@implementation STController



// In a source file
NSString * const ActionName_toString[] = {
    @"GOOGLE",
    @"STACK_OVERFLOW",
    @"REYWENDERLICH",
    @"SHABDKOSH"
};

-(id)init{
    self = [super init];
    if (self) {
        _communicationQueue = [[NSMutableDictionary alloc] init];
        _blockQueue = [[NSMutableDictionary alloc] init];
        _hudQueue =   [[NSMutableDictionary alloc] init];
    }

    return self;
}

+(STController*)sharedInstance{
    static STController *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        
    });
    return instance;
}


-(void)action:(ActionName)action Params:(NSDictionary*)params CompleteBlock:(CompletionBlock)completeBlock AndView:(UIView*)view{
    
    switch (action) {
        case GOOGLE:{
            [_hudQueue setObject:[ST_UIManager showLoaderWithView:view] forKey:ActionName_toString[action]];
            [self setObject:completeBlock forKeyedSubscript:ActionName_toString[action]];
            [self actionWithGoogle:params];
            break;
        }
        case STACK_OVERFLOW:{
            
            break;
        }
        case REYWENDERLICH:{
            break;
        }
        case SHABDKOSH:{
            break;
        }
        default:
            break;
    }
    
    
}


//Here we can cancel particular action
-(void)cancelOrCompleteAction:(ActionName)action{
    STCommunication *st = [_communicationQueue objectForKey:ActionName_toString[action]];
    [st stop];
    [ST_UIManager hideLoaderWithHud:[_hudQueue objectForKey:ActionName_toString[action]]];
    [_communicationQueue removeObjectForKey:ActionName_toString[action]];
    [_blockQueue removeObjectForKey:ActionName_toString[action]];
    [_hudQueue removeObjectForKey:ActionName_toString[action]];
}

-(void)cancelAllActions{
    
    [_communicationQueue enumerateKeysAndObjectsUsingBlock:^(id key, STCommunication *obj, BOOL *stop) {
        [obj stop];
    }];
    
    [_communicationQueue removeAllObjects];
    [_blockQueue removeAllObjects];
}


- (id)objectAtKeyedSubscript:(id <NSCopying>)key
{
    return ([_blockQueue objectForKey:key]);
}

- (void)setObject:(id)obj forKeyedSubscript:(id <NSCopying>)key
{
    [_blockQueue setObject:obj forKey:key];
}


#pragma mark - 
#pragma mark - All Actions

-(void)actionWithGoogle:(NSDictionary*)params{
    
    STCommunication *stCommuncation = [[STCommunication alloc] initWithServiceName:GOOGLE AndParams:params AndCompletionBlock:^(NSMutableDictionary *dic, NSError *error) {
        CompletionBlock block = [self objectAtKeyedSubscript:ActionName_toString[GOOGLE]];
        BLOCK_SAFE_RUN(block, dic,error);
        [self cancelOrCompleteAction:GOOGLE];
    }];
    
    [stCommuncation start];
    
   [_communicationQueue setObject:stCommuncation forKey:ActionName_toString[GOOGLE]];
}





@end
























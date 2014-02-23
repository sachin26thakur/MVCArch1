//
//  STCommunication.m
//  MVC
//
//  Created by SACHIN THAKUR on 8/13/13.
//  Copyright (c) 2013 MAC38. All rights reserved.
//

#import "STCommunication.h"

#import "AFNetworking.h"




@interface STCommunication()

@property(nonatomic,strong) CompletionBlock block;

@property(nonatomic,strong) NSDictionary *params;

@property(nonatomic,strong) AFJSONRequestOperation *operation;

@property ActionName actionName1;

-(void)sendNetworkdRequestWithGoogle;

@end


@implementation STCommunication

static NSString *const BaseURLString = @"http://www.raywenderlich.com/downloads/weather_sample/";



-(id)initWithServiceName:(ActionName)action AndParams:(NSDictionary*)params AndCompletionBlock:(CompletionBlock)completeBlock{
    self = [super init];
    if (self) {
        _params = params;
        _block = completeBlock;
        _actionName1 = action;
    }
    
    return self;
}


-(void)start{
    

    switch (_actionName1) {
        case GOOGLE:{
            [self sendNetworkdRequestWithGoogle];
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


-(void)stop{
    [_operation cancel];
}



-(void)sendNetworkdRequestWithGoogle{
       
    
    NSURL *url = [NSURL URLWithString:@"https://alpha-api.app.net/stream/0/posts/stream/global"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        _block(JSON,nil);
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
        _block(nil,nil);
    }];
    [_operation start];
}






































@end

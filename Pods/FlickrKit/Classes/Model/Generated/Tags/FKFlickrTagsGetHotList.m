//
//  FKFlickrTagsGetHotList.m
//  FlickrKit
//
//  Generated by FKAPIBuilder on 19 Sep, 2014 at 10:49.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrTagsGetHotList.h" 

@implementation FKFlickrTagsGetHotList



- (BOOL) needsLogin {
    return NO;
}

- (BOOL) needsSigning {
    return NO;
}

- (FKPermission) requiredPerms {
    return -1;
}

- (NSString *) name {
    return @"flickr.tags.getHotList";
}

- (BOOL) isValid:(NSError **)error {
    BOOL valid = YES;
	NSMutableString *errorDescription = [[NSMutableString alloc] initWithString:@"You are missing required params: "];

	if(error != NULL) {
		if(!valid) {	
			NSDictionary *userInfo = @{NSLocalizedDescriptionKey: errorDescription};
			*error = [NSError errorWithDomain:FKFlickrKitErrorDomain code:FKErrorInvalidArgs userInfo:userInfo];
		}
	}
    return valid;
}

- (NSDictionary *) args {
    NSMutableDictionary *args = [NSMutableDictionary dictionary];
	if(self.period) {
		[args setValue:self.period forKey:@"period"];
	}
	if(self.count) {
		[args setValue:self.count forKey:@"count"];
	}

    return [args copy];
}

- (NSString *) descriptionForError:(NSInteger)error {
    switch(error) {
		case FKFlickrTagsGetHotListError_InvalidPeriod:
			return @"Invalid period";
		case FKFlickrTagsGetHotListError_InvalidAPIKey:
			return @"Invalid API Key";
		case FKFlickrTagsGetHotListError_ServiceCurrentlyUnavailable:
			return @"Service currently unavailable";
		case FKFlickrTagsGetHotListError_WriteOperationFailed:
			return @"Write operation failed";
		case FKFlickrTagsGetHotListError_FormatXXXNotFound:
			return @"Format \"xxx\" not found";
		case FKFlickrTagsGetHotListError_MethodXXXNotFound:
			return @"Method \"xxx\" not found";
		case FKFlickrTagsGetHotListError_InvalidSOAPEnvelope:
			return @"Invalid SOAP envelope";
		case FKFlickrTagsGetHotListError_InvalidXMLRPCMethodCall:
			return @"Invalid XML-RPC Method Call";
		case FKFlickrTagsGetHotListError_BadURLFound:
			return @"Bad URL found";
  
		default:
			return @"Unknown error code";
    }
}

@end
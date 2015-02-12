//
//  FKFlickrGroupsPoolsGetContext.h
//  FlickrKit
//
//  Generated by FKAPIBuilder on 19 Sep, 2014 at 10:49.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrAPIMethod.h"

typedef enum {
	FKFlickrGroupsPoolsGetContextError_PhotoNotFound = 1,		 /* The photo id passed was not a valid photo id, or was the id of a photo that the calling user does not have permission to view. */
	FKFlickrGroupsPoolsGetContextError_PhotoNotInPool = 2,		 /* The specified photo is not in the specified group's pool. */
	FKFlickrGroupsPoolsGetContextError_GroupNotFound = 3,		 /* The specified group nsid was not a valid group or the caller does not have permission to view the group's pool. */
	FKFlickrGroupsPoolsGetContextError_InvalidAPIKey = 100,		 /* The API key passed was not valid or has expired. */
	FKFlickrGroupsPoolsGetContextError_ServiceCurrentlyUnavailable = 105,		 /* The requested service is temporarily unavailable. */
	FKFlickrGroupsPoolsGetContextError_WriteOperationFailed = 106,		 /* The requested operation failed due to a temporary issue. */
	FKFlickrGroupsPoolsGetContextError_FormatXXXNotFound = 111,		 /* The requested response format was not found. */
	FKFlickrGroupsPoolsGetContextError_MethodXXXNotFound = 112,		 /* The requested method was not found. */
	FKFlickrGroupsPoolsGetContextError_InvalidSOAPEnvelope = 114,		 /* The SOAP envelope send in the request could not be parsed. */
	FKFlickrGroupsPoolsGetContextError_InvalidXMLRPCMethodCall = 115,		 /* The XML-RPC request document could not be parsed. */
	FKFlickrGroupsPoolsGetContextError_BadURLFound = 116,		 /* One or more arguments contained a URL that has been used for abuse on Flickr. */

} FKFlickrGroupsPoolsGetContextError;

/*

Returns next and previous photos for a photo in a group pool.

<p>See <a href="/services/api/flickr.photos.getContext.html">flickr.photos.getContext</a></p>

Response:

<prevphoto id="2980" secret="973da1e709"
	title="boo!" url="/photos/bees/2980/" /> 
<nextphoto id="2985" secret="059b664012"
	title="Amsterdam Amstel" url="/photos/bees/2985/" /> 

*/
@interface FKFlickrGroupsPoolsGetContext : NSObject <FKFlickrAPIMethod>

/* The id of the photo to fetch the context for. */
@property (nonatomic, copy) NSString *photo_id; /* (Required) */

/* The nsid of the group who's pool to fetch the photo's context for. */
@property (nonatomic, copy) NSString *group_id; /* (Required) */


@end
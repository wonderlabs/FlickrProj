//
//  FKFlickrFavoritesGetPublicList.h
//  FlickrKit
//
//  Generated by FKAPIBuilder on 19 Sep, 2014 at 10:49.
//  Copyright (c) 2013 DevedUp Ltd. All rights reserved. http://www.devedup.com
//
//  DO NOT MODIFY THIS FILE - IT IS MACHINE GENERATED


#import "FKFlickrAPIMethod.h"

typedef enum {
	FKFlickrFavoritesGetPublicListError_UserNotFound = 1,		 /* The specified user NSID was not a valid flickr user. */
	FKFlickrFavoritesGetPublicListError_InvalidAPIKey = 100,		 /* The API key passed was not valid or has expired. */
	FKFlickrFavoritesGetPublicListError_ServiceCurrentlyUnavailable = 105,		 /* The requested service is temporarily unavailable. */
	FKFlickrFavoritesGetPublicListError_WriteOperationFailed = 106,		 /* The requested operation failed due to a temporary issue. */
	FKFlickrFavoritesGetPublicListError_FormatXXXNotFound = 111,		 /* The requested response format was not found. */
	FKFlickrFavoritesGetPublicListError_MethodXXXNotFound = 112,		 /* The requested method was not found. */
	FKFlickrFavoritesGetPublicListError_InvalidSOAPEnvelope = 114,		 /* The SOAP envelope send in the request could not be parsed. */
	FKFlickrFavoritesGetPublicListError_InvalidXMLRPCMethodCall = 115,		 /* The XML-RPC request document could not be parsed. */
	FKFlickrFavoritesGetPublicListError_BadURLFound = 116,		 /* One or more arguments contained a URL that has been used for abuse on Flickr. */

} FKFlickrFavoritesGetPublicListError;

/*

Returns a list of favorite public photos for the given user.




*/
@interface FKFlickrFavoritesGetPublicList : NSObject <FKFlickrAPIMethod>

/* The user to fetch the favorites list for. */
@property (nonatomic, copy) NSString *user_id; /* (Required) */

/* Minimum date that a photo was favorited on. The date should be in the form of a unix timestamp. */
@property (nonatomic, copy) NSString *min_fave_date;

/* Maximum date that a photo was favorited on. The date should be in the form of a unix timestamp. */
@property (nonatomic, copy) NSString *max_fave_date;

/* A comma-delimited list of extra information to fetch for each returned record. Currently supported fields are: <code>description</code>, <code>license</code>, <code>date_upload</code>, <code>date_taken</code>, <code>owner_name</code>, <code>icon_server</code>, <code>original_format</code>, <code>last_update</code>, <code>geo</code>, <code>tags</code>, <code>machine_tags</code>, <code>o_dims</code>, <code>views</code>, <code>media</code>, <code>path_alias</code>, <code>url_sq</code>, <code>url_t</code>, <code>url_s</code>, <code>url_q</code>, <code>url_m</code>, <code>url_n</code>, <code>url_z</code>, <code>url_c</code>, <code>url_l</code>, <code>url_o</code> */
@property (nonatomic, copy) NSString *extras;

/* Number of photos to return per page. If this argument is omitted, it defaults to 100. The maximum allowed value is 500. */
@property (nonatomic, copy) NSString *per_page;

/* The page of results to return. If this argument is omitted, it defaults to 1. */
@property (nonatomic, copy) NSString *page;


@end

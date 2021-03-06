//
//  Plist.m
//  PuppyLove
//
//  Created by John Fulgoni on 12/5/13.
//  Copyright (c) 2013 John Fulgoni. All rights reserved.
//

#import "Plist.h"

@implementation Plist

+(NSData *) objToPlistAsData:(id)obj
{
    NSError * error=nil;
    NSPropertyListFormat format=NSPropertyListXMLFormat_v1_0;
    NSData * data =  [NSPropertyListSerialization dataWithPropertyList:obj format:format options:NSPropertyListImmutable error:&error];
    return data;
    
}
+(NSString *) objToPlistAsString:(id)obj
{
    NSData * data =[self objToPlistAsData:obj];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
}

+(id) plistToObjectFromData:(NSData *)data
{
    NSError * error=nil;
    NSPropertyListFormat format=NSPropertyListXMLFormat_v1_0;
    id plist = [NSPropertyListSerialization propertyListWithData:data
                                                         options:NSPropertyListImmutable
                                                          format:&format error:&error] ;
    
    return plist;
    
}
+(id) plistToObjectFromString:(NSString*)str
{
    NSData * data =[str dataUsingEncoding:NSUTF8StringEncoding];
    return [self plistToObjectFromData:data];
}

@end

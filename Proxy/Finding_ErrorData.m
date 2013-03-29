// Generated by xsd compiler for ios/objective-c
// DO NOT CHANGE!

#import <Foundation/Foundation.h>
#import "Finding_ErrorData.h"
#import "Finding_ErrorParameter.h"

@implementation Finding_ErrorData

@synthesize errorId = _errorId;
@synthesize domain = _domain;
@synthesize severity = _severity;
@synthesize category = _category;
@synthesize message = _message;
@synthesize subdomain = _subdomain;
@synthesize exceptionId = _exceptionId;
@synthesize parameter = _parameter;

// class meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(PicoClassSchema *)getClassMetaData {
    return nil;
}

// property meta-data method
// note: this method is only for internal use, DO NOT CHANGE!
+(NSMutableDictionary *)getPropertyMetaData {
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    
    PicoPropertySchema *ps = nil;
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"errorId" propertyName:@"errorId" type:PICO_TYPE_LONG clazz:nil];
    [map setObject:ps forKey:@"errorId"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"domain" propertyName:@"domain" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"domain"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"severity" propertyName:@"severity" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"severity"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"category" propertyName:@"category" type:PICO_TYPE_ENUM clazz:nil];
    [map setObject:ps forKey:@"category"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"message" propertyName:@"message" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"message"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"subdomain" propertyName:@"subdomain" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"subdomain"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT xmlName:@"exceptionId" propertyName:@"exceptionId" type:PICO_TYPE_STRING clazz:nil];
    [map setObject:ps forKey:@"exceptionId"];
    [ps release];
    ps = [[PicoPropertySchema alloc] initWithKind:PICO_KIND_ELEMENT_ARRAY xmlName:@"parameter" propertyName:@"parameter" type:PICO_TYPE_OBJECT clazz:[Finding_ErrorParameter class]];
    [map setObject:ps forKey:@"parameter"];
    [ps release];
    
    return map;
}



-(void)dealloc {
    self.errorId = nil;
    self.domain = nil;
    self.severity = nil;
    self.category = nil;
    self.message = nil;
    self.subdomain = nil;
    self.exceptionId = nil;
    self.parameter = nil;
    [super dealloc];
}

@end

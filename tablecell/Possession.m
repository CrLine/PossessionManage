//
//  Possession.m
//  tablecell
//
//  Created by 李涛 on 4/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "Possession.h"

@implementation Possession
@synthesize possessionName,serialNumber,vauleInDollar,datecreated;
+(id)randomPossesseion
{
    Possession *p=[[Possession alloc]initWithPossesseion:@"name" number:@"number" dollar:10];
    return p;
}
-(id)init
{
    return[self initWithPossesseion:@"0" number:@"0" dollar:0];
}
-(id)initWithPossesseion:(NSString *)possession number:(NSString *)number dollar:(int)dollar
{
    self=[super init];
    if (self) {
        [self setPossessionName:possession];
        [self setSerialNumber:number];
        [self setVauleInDollar:dollar];
        datecreated=[[NSDate alloc]init];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:possessionName forKey:@"possessionName"];
    [aCoder encodeObject:serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:dateCreated forKey:@"dateCreated"];
    [aCoder encodeInt:vauleInDollar forKey:@"vuleInDollar"];
}

-(NSString*)description
{
    NSString *descriptioning=[[NSString alloc]initWithFormat:@"name:%@ number:%@ dollar:%d date:%@",possessionName,serialNumber,vauleInDollar,dateCreated ];
    return descriptioning;
}
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super init];
    if (self) {
        [self setPossessionName:[aDecoder decodeObjectForKey:@"PossessionName"]];
        [self setSerialNumber:[aDecoder decodeObjectForKey:@"serialNumber"]];
        [self setVauleInDollar:[aDecoder decodeIntForKey:@"vauleInDollar"]];
        dateCreated=[[aDecoder decodeObjectForKey:@"dateCreated"]retain];
    }
    return self;
}
@end

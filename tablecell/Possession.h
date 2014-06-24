//
//  Possession.h
//  tablecell
//
//  Created by 李涛 on 4/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Possession : NSString<NSCoding>
{
    NSString *possessionName;
    NSString *serialNumber;
    int vauleInDollar;
    NSDate *dateCreated;
}

+(id)randomPossesseion;
-(id)initWithPossesseion:(NSString *)possession number:(NSString*)number dollar:(int)dollar;
-(NSString*)description;
@property(nonatomic,retain)NSString *possessionName;
@property(nonatomic,retain)NSString *serialNumber;
@property(nonatomic)int vauleInDollar;
@property(nonatomic,readonly)NSDate *datecreated;
@end

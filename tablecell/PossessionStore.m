//
//  PossessionStore.m
//  tablecell
//
//  Created by 李涛 on 5/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "PossessionStore.h"
#import "Possession.h"
static PossessionStore *defaultPossession=Nil;
@implementation PossessionStore
+(PossessionStore *)defaultPossesseion
{
    if (!defaultPossession) {
        defaultPossession=[[super alloc]init];
        
    }
    return defaultPossession;
}
+(id)alloc
{
    return [self defaultPossesseion];
}
-(id)init
{
    if (defaultPossession) {
        return defaultPossession;
    }
    self=[super init];
  
    return self;
}
-(void)release
{
    
}
-(id)retain
{
    return self;
}
-(void)removePossession:(Possession *)p
{
    [allPossessions removeObjectIdenticalTo:p];
}
-(void)movePossessionAtIndex:(int)from toIndex:(int)to
{
    Possession *p=[[[PossessionStore defaultPossesseion]allPossessions]objectAtIndex:from];
    [allPossessions removeObjectAtIndex:from];
    [allPossessions insertObject:p atIndex:to];
}
-(NSUInteger)retainCount
{
    return NSUIntegerMax;
}
-(Possession *)createPossesseion
{
    [self fetchPossessionsIfNecessary];
    Possession *p=[[Possession alloc]init];
    [allPossessions addObject:p];
    return p;
}
-(NSArray *)allPossessions
{
    [self fetchPossessionsIfNecessary];
    return allPossessions;
}
-(NSString *)possessionArchivePath
{
    //返回沙盒的路径
    return pathInDocumentDirectory(@"possession.data");
}
-(BOOL)saveChanges
{
    return [NSKeyedArchiver archiveRootObject:allPossessions toFile:[self possessionArchivePath]];
}
-(void)fetchPossessionsIfNecessary
{
    if (!allPossessions) {
        NSString *path=[self possessionArchivePath];
        allPossessions=[[NSKeyedUnarchiver unarchiveObjectWithFile:path]retain];
    }
    if (!allPossessions) {
        allPossessions=[[NSMutableArray alloc]init];
    }
}

@end

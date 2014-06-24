//
//  PossessionStore.h
//  tablecell
//
//  Created by 李涛 on 5/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Possession;
@interface PossessionStore : NSObject
{
    NSMutableArray *allPossessions;
}
+(id)defaultPossesseion;
-(void)removePossession:(Possession *)p;
-(NSArray *)allPossessions;
-(Possession *)createPossesseion;
-(NSString *)possessionArchivePath;
-(void)movePossessionAtIndex:(int)from toIndex:(int)to;
-(BOOL)saveChanges;
-(void)fetchPossessionsIfNecessary;
@end

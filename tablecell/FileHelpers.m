//
//  FileHelpers.m
//  tablecell
//
//  Created by 李涛 on 16/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "FileHelpers.h"

NSString *pathInDocumentDirectory(NSString *fileName)
{
    NSArray *documentDirectories=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory=[documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:fileName];
}

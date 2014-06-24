//
//  ItemDetailViewController.h
//  tablecell
//
//  Created by 李涛 on 6/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Possession;
@interface ItemDetailViewController : UIViewController
{
    IBOutlet UITextField *nameField;
    IBOutlet UITextField *numberField;
    IBOutlet UITextField *dollarField;
    IBOutlet UILabel *dateLable;
    Possession *possession;
}
@property(nonatomic,retain)Possession *possession;
@end

//
//  ItemDetailViewController.m
//  tablecell
//
//  Created by 李涛 on 6/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "Possession.h"
@interface ItemDetailViewController ()

@end

@implementation ItemDetailViewController
@synthesize possession;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self view]setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [nameField setText:[possession possessionName]];
    [numberField setText:[possession serialNumber]];
    [dollarField setText:[NSString stringWithFormat:@"%d",[possession vauleInDollar]]];
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateLable setText:[dateFormatter stringFromDate:[possession datecreated]]];
    [[self navigationItem]setTitle:[possession possessionName]];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self view]endEditing:YES];
    [possession setPossessionName:[nameField text]];
    [possession setSerialNumber:[numberField text]];
    [possession setVauleInDollar:[[dollarField text]intValue]];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

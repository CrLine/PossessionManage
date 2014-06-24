//
//  ItemsViewController.m
//  tablecell
//
//  Created by 李涛 on 4/6/14.
//  Copyright (c) 2014年 李涛. All rights reserved.
//

#import "ItemsViewController.h"
#import "Possession.h"
#import "PossessionStore.h"
#import "ItemDetailViewController.h"
@implementation ItemsViewController
-(id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}
-(id)init
{
    self=[super initWithStyle:UITableViewStyleGrouped];
    UIBarButtonItem *bbi=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewPossession:)];
    [[self navigationItem]setRightBarButtonItem:bbi];
    [[self navigationItem]setTitle:@"Homepwner"];
    [[self navigationItem]setLeftBarButtonItem:[self editButtonItem]];
    if (self) {
        for (int i=0; i<10; i++) {
            [[PossessionStore defaultPossesseion]createPossesseion];
        }
    }
    return [super initWithStyle:UITableViewStyleGrouped];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ItemDetailViewController *detailViewController=[[ItemDetailViewController alloc]init];
    NSArray *possessions=[[PossessionStore defaultPossesseion]allPossessions];
    [detailViewController setPossession:[possessions objectAtIndex:[indexPath row]]];
    [[self navigationController]pushViewController:detailViewController animated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView]reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[PossessionStore defaultPossesseion]allPossessions]count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    Possession *p=[[[PossessionStore defaultPossesseion]allPossessions]objectAtIndex:[indexPath row]];
    [[cell textLabel]setText:[p description]];
    return cell;
}
-(IBAction)addNewPossession:(id)sender
{
    [[PossessionStore defaultPossesseion]createPossesseion];
    [[self tableView]reloadData];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        PossessionStore *ps=[PossessionStore defaultPossesseion];
        NSArray *possessions=[ps allPossessions];
        Possession *p=[possessions objectAtIndex:[indexPath row]];
        [ps removePossession:p];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:YES];
    }
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    [[PossessionStore defaultPossesseion]movePossessionAtIndex:[sourceIndexPath row] toIndex:[destinationIndexPath row]];
}
@end

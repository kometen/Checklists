//
//  AllListsViewController.m
//  Checklists
//
//  Created by Claus Guttesen on 28/06/13.
//  Copyright (c) 2013 Claus Guttesen. All rights reserved.
//

#import "AllListsViewController.h"
#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "Checklist.h"

@interface AllListsViewController ()

@end

@implementation AllListsViewController

-(id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        self.dataModel = [[DataModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.delegate = self;
    int index = [self.dataModel indexOfSelectedChecklist];
    if (index >= 0 && index < [self.dataModel.lists count]) {
        Checklist *checklist = [self.dataModel.lists objectAtIndex:index];
        [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataModel.lists count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Checklist *checklist = [self.dataModel.lists objectAtIndex:indexPath.row];
    cell.textLabel.text = checklist.name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowChecklist"]) {
        ChecklistViewController *controller = segue.destinationViewController;
        controller.checklist = sender;
    } else if ([segue.identifier isEqualToString:@"AddChecklist"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
        controller.delegate = self;
        controller.checklistToEdit = nil;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataModel setIndexOfSelectedChecklist:indexPath.row];
    
    Checklist *checklist = [self.dataModel.lists objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ShowChecklist" sender:checklist];
}

-(void)listDetailViewControllerDidCancel:(ListDetailViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist {
    int newRowIndex = [self.dataModel.lists count];
    [self.dataModel.lists addObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)listDetailViewController:(ListDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist {
    int index = [self.dataModel.lists indexOfObject:checklist];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.text = checklist.name;
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataModel.lists removeObjectAtIndex:indexPath.row];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"ListNavigationController"];
    ListDetailViewController *controller = (ListDetailViewController *)navigationController.topViewController;
    controller.delegate = self;
    Checklist *checklist = [self.dataModel.lists objectAtIndex:indexPath.row];
    controller.checklistToEdit = checklist;
    [self presentViewController:navigationController animated:YES completion:nil];
}

-(void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (viewController == self) {
        [self.dataModel setIndexOfSelectedChecklist:-1];
    }
}

@end

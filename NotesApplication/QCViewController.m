//
//  QCViewController.m
//  NotesApplication
//
//  Created by Weiwei Shi on 7/2/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import "QCViewController.h"

@interface QCViewController ()

@end

@implementation QCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
      self.title = @"Notes";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)notesArray
{
    NSArray *notes = [NSArray alloc];
    
    if (!self.currentPredicate) {
        notes = [Note MR_findAllSortedBy:@"index" ascending:YES];
    }
    else
    {
        notes = [Note MR_findAllWithPredicate:self.currentPredicate];
    }
    return notes;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self notesArray].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"QCCustomTableViewCell";
    
    QCCustomTableViewCell *cell = (QCCustomTableViewCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"QCCustomTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    
    Note *note = [[self notesArray]objectAtIndex:indexPath.row];
        cell.titleLabel.text = note.title;
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"mm/dd/yy"];
        
        NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
        NSData* imageData = [standardUserDefaults objectForKey:@"image"];
        
        cell.imageView.image = [UIImage imageWithData:imageData];
        

        
        cell.dateCratedLable.text = [formatter stringFromDate:note.dateCreated];
        
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QCCreateNoteViewController *createView = [[QCCreateNoteViewController alloc]initWithNibName:nil bundle:nil];
    
    createView.selectedNote = [[self notesArray]objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:createView animated:YES];
}

- (void) addButtonPressed:(id) sender
{
    QCCreateNoteViewController *createView = [[QCCreateNoteViewController alloc]initWithNibName:nil bundle:nil];
    
    [self.navigationController pushViewController:createView animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Note *note =[[self notesArray] objectAtIndex:indexPath.row];
        [note MR_deleteEntity];
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
        [tableView reloadData];
    }

}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:YES];
    [self.tableView setEditing:editing animated:YES];
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText && ![searchText isEqualToString:@""])
    {
        NSPredicate *titlePredicate = [NSPredicate predicateWithFormat:@"title contains[dc] %@"
                                       , searchText];
        NSPredicate *bodyPredicate = [NSPredicate predicateWithFormat:@"body contains[dc] %@", searchText];

        self.currentPredicate = [NSCompoundPredicate orPredicateWithSubpredicates:[NSArray arrayWithObjects:titlePredicate, bodyPredicate, nil]];
    }
    else
    {
        self.currentPredicate = nil;
    }
    [self.tableView reloadData];

}


@end

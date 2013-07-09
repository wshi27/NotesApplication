//
//  QCCreateNoteViewController.m
//  NotesApplication
//
//  Created by Weiwei Shi on 7/2/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import "QCCreateNoteViewController.h"

@interface QCCreateNoteViewController ()

@end

@implementation QCCreateNoteViewController

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
    // Do any additional setup after loading the view from its nib.
    
    if (self.selectedNote)
    {
        self.title = @"Editing Note";
        [self.textView.text stringByAppendingFormat:@"%@",self.selectedNote];
        self.titleTextField.text = self.selectedNote.title;
    }
    else
    {
          self.title = @"Creating Note";
    }
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelButtonPressed:)];
    
    self.navigationItem.leftBarButtonItem = saveButton;
    self.navigationItem.rightBarButtonItem = cancelButton;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)saveButtonPressed: (id) sender
{
    if (self.selectedNote)
    {
        NSNumber *index = self.selectedNote.index;
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"index == [c] %@",index];
        Note *noteFound = [Note MR_findFirstWithPredicate:predicate];
        noteFound.body = self.textView.text;
        noteFound.title = self.titleTextField.text;
        [[NSManagedObjectContext MR_contextForCurrentThread] MR_saveToPersistentStoreAndWait];
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    else
    {
        Note *note = [Note MR_createEntity];
        note.body = self.textView.text;
        note.title = self.titleTextField.text;
        note.dateCreated = [NSDate new];
        note.index =[NSNumber numberWithInt:[Note MR_findAll].count];
        
        [[NSManagedObjectContext MR_contextForCurrentThread]MR_saveOnlySelfAndWait];
        [self.navigationController popViewControllerAnimated:YES];

    }
}

-(void)cancelButtonPressed:(id) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

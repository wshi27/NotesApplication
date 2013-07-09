//
//  QCViewController.h
//  NotesApplication
//
//  Created by Weiwei Shi on 7/2/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
#import "QCCreateNoteViewController.h"
#import "QCCustomTableViewCell.h"

@interface QCViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic)NSCompoundPredicate *currentPredicate;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (NSArray *) notesArray;


@end

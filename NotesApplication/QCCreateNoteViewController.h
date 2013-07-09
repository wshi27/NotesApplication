//
//  QCCreateNoteViewController.h
//  NotesApplication
//
//  Created by Weiwei Shi on 7/2/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"

@interface QCCreateNoteViewController : UIViewController

@property(strong, nonatomic) Note * selectedNote;
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;

@end

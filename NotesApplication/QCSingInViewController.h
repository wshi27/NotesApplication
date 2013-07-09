//
//  QCSingInViewController.h
//  NotesApplication
//
//  Created by Weiwei Shi on 7/4/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QCViewController.h"
#import "QCCreateAccountViewController.h"

@interface QCSingInViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIImageView *profileImage;
- (IBAction)signInButtonPressed:(id)sender;

- (IBAction)createAccountButtonPressed:(id)sender;
- (IBAction)deleteAccountButtonPressed:(id)sender;

@end

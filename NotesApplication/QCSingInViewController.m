//
//  QCSingInViewController.m
//  NotesApplication
//
//  Created by Weiwei Shi on 7/4/13.
//  Copyright (c) 2013 self.edu. All rights reserved.
//

#import "QCSingInViewController.h"

@interface QCSingInViewController ()

@end

@implementation QCSingInViewController

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
    
    self.title = @"User Sign In";

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    
    if([standardUserDefaults objectForKey:@"image"] != nil)
    {
        NSData* imageData = [standardUserDefaults objectForKey:@"image"];
        
        self.profileImage.image = [UIImage imageWithData:imageData];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signInButtonPressed:(id)sender
{
    NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
    if([standardUserDefaults objectForKey:@"userName"] != nil)
    {
        NSString *savedPassword = [standardUserDefaults objectForKey:@"password"];
        NSString *savedUserName = [standardUserDefaults objectForKey:@"userName"];
    
        if ([savedPassword isEqualToString:self.passwordTextField.text]&& [savedUserName isEqualToString:self.userNameTextField.text])
        {
            QCViewController *view = [[QCViewController alloc]initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:view animated:YES];
        }
        else
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect User Name or Password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: nil];
            [alertView show];
        }
    }
    else
    {
        UIAlertView *noUserAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"No account exist in the system yet." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [noUserAlert show];
    }
}

- (IBAction)createAccountButtonPressed:(id)sender
{
    QCCreateAccountViewController *createAccount = [[QCCreateAccountViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:createAccount animated:YES];
}

- (IBAction)deleteAccountButtonPressed:(id)sender
{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
     QCCreateAccountViewController *createAccount = [[QCCreateAccountViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:createAccount animated:YES];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.userNameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    return YES;
}
@end

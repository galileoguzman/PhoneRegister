//
//  ViewController.m
//  Phone Register
//
//  Created by Galileo Guzman on 27/11/15.
//  Copyright © 2015 Galileo Guzman. All rights reserved.
//

#import "Home.h"
#import <DigitsKit/DigitsKit.h>

@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // add button to sign in with fabric
    
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            // TODO: associate the session userID with your user model
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else if (error) {
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    authButton.center = self.view.center;
    [self.view addSubview:authButton];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSignInWithFabricPressed:(id)sender {
    
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:@"Phone Register" message:@"Add your phone number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
    
    [a show];
}
@end

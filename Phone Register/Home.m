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

@property (nonatomic) UIAlertView *a;

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // add button to sign in with fabric
    /*
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

    */
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSignInWithFabricPressed:(id)sender {
    
    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        // Inspect session/error objects
        NSLog(@"Session Obj %@", [session phoneNumber]);
        
        if(error){
            
            self.a = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error while you sign in with Phone Number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            
        }else{
            self.a = [[UIAlertView alloc] initWithTitle:@"Welcome" message:@"Welcome to our great app with Fabric.io" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        }
        
        [self.a show];
    }];
}
@end

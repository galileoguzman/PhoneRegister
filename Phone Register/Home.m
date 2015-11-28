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
@property (nonatomic) BOOL *sessionActive;

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
    
    
    [self initController];
}

- (void) initController
{
    
    self.sessionActive = NO;
    
    //Shadow of header
    self.lblHeader.layer.masksToBounds = NO;
    self.lblHeader.layer.shadowOffset = CGSizeMake(-15, 5);
    self.lblHeader.layer.shadowRadius = 5;
    self.lblHeader.layer.shadowOpacity = 0.5;
    
    //Button session style
    self.btnSession.layer.masksToBounds = YES;
    self.btnSession.layer.cornerRadius = self.btnSession.frame.size.height / 2.0f;
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSignInWithFabricPressed:(id)sender {

    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        if (!self.sessionActive) {
            if(error){
                
                self.a = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error while you sign in with Phone Number" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                
            }else{
                
                NSLog(@"User is logged");
                
                self.sessionActive = YES;
                self.imgSession.image = [UIImage imageNamed:@"closeSession.png"];
                self.lblPhoneNumber.text = [session phoneNumber];
                self.a = [[UIAlertView alloc] initWithTitle:@"Welcome" message:@"Welcome to our great app with Fabric.io" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            }
            
            [self.a show];
        }else{
            
            NSLog(@"User closed session");
            self.sessionActive = NO;
            self.imgSession.image = [UIImage imageNamed:@"openSession.png"];
            self.lblPhoneNumber.text = nil;
            [[Digits sharedInstance]logOut];
            
        }
    }];
}
@end

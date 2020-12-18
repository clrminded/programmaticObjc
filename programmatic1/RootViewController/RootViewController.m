/*
 * This is the code that you add to SceneDelegate.m to allow you to be able to delete the storyboard and not have
 * the app crash:
 *  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 *  self.window.windowScene = (UIWindowScene *)scene;
 * // (choose one:) This is the rootViewController setting to have a NavigationController
 *  self.window.rootViewController = [[UINavigationController alloc]
 *                       initWithRootViewController:ViewController.new];
 * // (choose one:) This is the rootViewController setting to be modular
 *  //self.window.rootViewController = [[ViewController alloc]init];
 *  self.window.backgroundColor = [UIColor colorWithDisplayP3Red:153.0/255.0 green:170.0/255.0 blue:187.0/255.0 alpha:0.8];
 *  [self.window makeKeyAndVisible];
 *
 * Finally! I got some refactoring DOWN! now the UIconfigurations are in their own functions and the constraints are in
 * there own functions as well! All in Objective-C!
 */

#import "RootViewController.h"
#import "Project1.h"
#import "ThirdScreen.h"
#import "MyFirstMap.h"


@interface RootViewController()

// I got the iadea from swift, but man this is just cluttered now and I dont even know
// What the heck to do to help fix it
@property UILabel *textLabel;
@property UILabel *nameLabel;
@property UITextField *nameTextField;
@property UIButton *submitButton;
@property UIButton *nextButton;
@property UIButton *thirdButton;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addLabel];
    [self addNameLabel];
    [self addNameField];
    [self addSubmitButton];
    [self addNextButton];
    [self addThirdButton];
}

/* ------------------------ Start of UI Configurations ------------------------------------------------- */
// Configuration for label at top of screen that says "Hello ____!" fills in what user inputs
-(void) addLabel {
    // Label to be changed
    _textLabel = [[UILabel alloc]init];
    _textLabel.text = @"Changed with code!";
    [self.view addSubview:_textLabel];
    // constraints below
    [self labelConstraints];
}
-(void) labelConstraints {
    _textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_textLabel.topAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.topAnchor constant:50].active = YES;
    [_textLabel.leadingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.leadingAnchor constant:20].active = YES;
    [_textLabel.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant:-20].active = YES;
}

// Configuration for the label for the name
-(void) addNameLabel {
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.text = @"Name: ";
    [self.view addSubview:_nameLabel];
    // constraints below
    [self nameLabelConstraints];
}
-(void) nameLabelConstraints {
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [_nameLabel.topAnchor constraintEqualToAnchor:_textLabel.bottomAnchor constant:50].active = YES;
    [_nameLabel.leadingAnchor constraintEqualToAnchor: self.view.safeAreaLayoutGuide.leadingAnchor constant:20].active = YES;
    [_nameLabel.heightAnchor constraintEqualToConstant:44].active = YES;
}

// Configurations for the textField next to "Name: " label, this is where user inputs a name
-(void) addNameField {
    _nameTextField = [[UITextField alloc] init];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    _nameTextField.delegate = self;
    _nameTextField.placeholder = @"Enter your name here...";
    [self.view addSubview: _nameTextField];
    // constraints below
    [self nameFieldConstraints];
}
-(void) nameFieldConstraints {
    _nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    [_nameTextField.topAnchor constraintEqualToAnchor:_textLabel.bottomAnchor constant:50].active = YES;
    [_nameTextField.leadingAnchor constraintEqualToAnchor:_nameLabel.trailingAnchor constant:0].active = YES;
    [_nameTextField.trailingAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.trailingAnchor constant: -20].active = YES;
    [_nameTextField.heightAnchor constraintEqualToConstant:44].active = YES;
}

// Confguration for the submit button, once this button is clicked the user input in the text field will be the new text
// in the label at the top!
-(void) addSubmitButton {
    _submitButton = [[UIButton alloc] init];
    [_submitButton setTitle: @"Talk" forState: UIControlStateNormal];
    [_submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_submitButton addTarget:self
                     action:@selector(buttonPressed)
                     forControlEvents:UIControlEventTouchUpInside];
    _submitButton.layer.cornerRadius = 25;
    _submitButton.backgroundColor = [UIColor cyanColor];
    [self.view addSubview: _submitButton];
    // Constraints below
    [self submitButtonConstraints];
}
-(void) submitButtonConstraints {
    _submitButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_submitButton.topAnchor constraintEqualToAnchor: _nameTextField.bottomAnchor constant:50].active = YES;
    [_submitButton.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [_submitButton.widthAnchor constraintEqualToConstant:100].active = YES;
    [_submitButton.heightAnchor constraintEqualToConstant:50].active = YES;
}

-(void) addNextButton {
    _nextButton = [[UIButton alloc] init];
    [_nextButton setTitle:@"Next" forState:UIControlStateNormal];
    _nextButton.backgroundColor = [UIColor blueColor];
    [_nextButton addTarget:self
                     action:@selector(moveToSecondScreen)
                     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _nextButton];
    
    [self nextButtonConstraints];
}
-(void) nextButtonConstraints {
    _nextButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_nextButton.topAnchor constraintEqualToAnchor:_submitButton.bottomAnchor constant:5].active = YES;
    [_nextButton.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [_nextButton.widthAnchor constraintEqualToConstant:88].active = YES;
    [_nextButton.heightAnchor constraintEqualToConstant:44].active = YES;
}

-(void) addThirdButton {
    _thirdButton = [[UIButton alloc] init];
    [_thirdButton setTitle:@"Third" forState:UIControlStateNormal];
    _thirdButton.backgroundColor = [UIColor grayColor];
    [_thirdButton addTarget:self
                     action:@selector(moveToThirdScreen)
                     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_thirdButton];
    [self setThirdButtonConstraints];
}
-(void) setThirdButtonConstraints {
    _thirdButton.translatesAutoresizingMaskIntoConstraints = NO;
    [_thirdButton.topAnchor constraintEqualToAnchor:_nextButton.bottomAnchor constant:5].active = YES;
    [_thirdButton.centerXAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.centerXAnchor].active = YES;
    [_thirdButton.widthAnchor constraintEqualToConstant:88].active = YES;
    [_thirdButton.heightAnchor constraintEqualToConstant:44].active = YES;
}
/* -------------------------- End of UI Configurations -------------------------------------------- */

/* -------------------------- Start of Event Functions ------------------------------------------- */

/* This is the action that sets off when the submitButton is clicked, changes the label at the top to say
 * "Hello " followed by whatever text was entered by the user in the textField, if nothing was submitted
 * there is just a blank!
 */
- (void) buttonPressed {
    _textLabel.text = [NSString stringWithFormat: @"Hello %@!", _nameTextField.text];
    // Add a speech synthesizer to speaker the output by the user
    AVSpeechSynthesizer *speaker = [[AVSpeechSynthesizer alloc] init];
    AVSpeechUtterance *speech    = [AVSpeechUtterance speechUtteranceWithString: ((void)(@"%@"), _textLabel.text)];
    [speaker speakUtterance:speech];
}

-(void) moveToSecondScreen {
    Project1 *nextScreen = [[Project1 alloc] init];
    nextScreen.title = @"Second Project";
    [self.navigationController pushViewController: nextScreen animated:YES];
}

-(void) moveToThirdScreen {
    MyFirstMap *nextProject = [[MyFirstMap alloc] init];
    nextProject.title = @"Third Project";
    [self.navigationController pushViewController:nextProject animated:YES];
}

/* -------------------------- End of Event Functions ---------------------------------------------- */

@end

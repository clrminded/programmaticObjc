//
//  SceneDelegate.m
//  programmatic1
//
//  Created by Christopher Liudahl-Rackley on 11/15/20.
//

#import "SceneDelegate.h"
#import "RootViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    /*
    _window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
    UIViewController *viewController = [[UIViewController alloc] init];
        viewController.view.backgroundColor = [UIColor redColor];
        _window.rootViewController = viewController;
        [_window makeKeyAndVisible];}
     */
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.windowScene = (UIWindowScene *)scene;
    self.window.rootViewController = [[UINavigationController alloc]
                                      initWithRootViewController: RootViewController.new];
    //self.window.rootViewController = [[UITableViewController alloc]init];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                           NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:17],
                                                           }];

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];

    self.window.backgroundColor = [UIColor colorWithDisplayP3Red:153.0/255.0 green:170.0/255.0 blue:187.0/255.0 alpha:0.8];
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end

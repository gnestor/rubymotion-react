class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'rubymotion-react'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(rootViewController)
    @window.makeKeyAndVisible

    jsCodeLocation = NSURL.URLWithString("http://localhost:8081/index.ios.bundle")

    @root_view = RCTRootView.alloc.initWithBundleURL(jsCodeLocation, moduleName:"SimpleApp", launchOptions:nil)
    @window.rootViewController.view.addSubview(@root_view)
    @root_view.frame = @window.rootViewController.view.bounds

    true
  end
end

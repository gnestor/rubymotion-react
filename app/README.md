# React Native in Motion
Embedded React Native in RubyMotion

## Install
1. Install RubyMotion
2. Install React Native: https://facebook.github.io/react-native/docs/getting-started.html
  * Install node
  * Install npm
  * Install watchman
  * Optional: Install React Native CLI: `npm install -g react-native-cli`
3. Install bundler: `gem install bundler`
4. Install gems (motion-cocoapods): `bundle`
5. Initialize cocoapods: `pod setup`
6. Install cocoapods: `rake pod:install`

## Run
1. Run React Native server (run this in a separate terminal tab): `cd vendor/Pods/React && npm start`
2. Build your app: `rake` or `rake device`

## Embedding React Native in an existing RubyMotion project
1. Add motion-cocoapods gem to your `Gemfile`
2. Add React and any additional React component pods to your `Rakefile`
```
app.pods do
  pod 'React'
  pod 'React/RCTText'
end
```
3. Create a React `index.ios.js` file in `vendors/Pods/React` directory
4. Add `RCTRootView` to a container view (any UIView):
```
jsCodeLocation = NSURL.URLWithString("http://localhost:8081/index.ios.bundle")
@root_view = RCTRootView.alloc.initWithBundleURL(jsCodeLocation, moduleName:"SimpleApp", launchOptions:nil)
@container_view.addSubview(@root_view)
@root_view.frame = @container_view.bounds
```

## Production vs. Development
The React Native server is intended for development (the server watches for changes to the `index.ios.js` file and allows the developer to refresh the Simulator with `CMD+R` vs. rebuilding).

For production use, this `NSURL` could instead point to a pre-bundled file on disk:
`jsCodeLocation = NSBundle.mainBundle.URLForResource("main",withExtension:"jsbundle")`

To generate that file, run the `curl` command and add the output to your `resources` directory:
`curl http://localhost:8081/index.ios.bundle -o main.jsbundle`

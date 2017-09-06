# iOS template

A template for new iOS projects starting from ground up with basic functionality implementations.

Inspired by [Raizlabs]/[ios-template]

[Raizlabs]: https://www.raizlabs.com/
[ios-template]: https://github.com/Raizlabs/ios-template

## What's in the template?

 - Configures the project name, company name, lead name, an initial gitignore.
 - Option to configure [crashlytics][fabricio] apps automatically.
 - Default [swiftlint][swiftlint] rules to help enforce code style standards across projects.
 - [Default set of Cocoapods][pods] including:
   - [Crashlytics][fabric] - "Lightweight crash reporting solution for mobile apps."
   - [XCLogger][davewood] - "A debug log framework for use in Swift projects."
   - [Swinject][swinject] - "Dependency injection framework for Swift with iOS/macOS/Linux."
   - [Alamofire][alamofire] - "Elegant HTTP Networking in Swift."
   - [SwiftLint][realm] - "A tool to enforce Swift style and conventions."
   - [RxSwift][reactivex] - "Reactive Programming in Swift."
   - [SwiftyUserDefaults][radex] - "Modern Swift API for NSUserDefaults"
   - [Anchorage][anchorage] - "A lightweight collection of intuitive operators and utilities that simplify iOS layout code."
   - [Swiftilities][swiftilities] - Keyboard avoidance guides, lifecycle event code injection, about view, accessibility helpers, color helpers, device size detection, hairline views, logging
   - [OHHTTPStubs][ohhttpstubs] - Stub API requests with edge case datasets for unit tests or to fake an endpoint while it is in development.

[pods]: PRODUCTNAME/app/Podfile
[fabricio]: https://fabric.io
[fabric]: https://github.com/crashlytics
[davewood]: https://github.com/DaveWoodCom/XCGLogger
[swinject]: https://github.com/Swinject/Swinject
[alamofire]: https://github.com/Alamofire/Alamofire
[realm]: https://github.com/realm/SwiftLint
[reactivex]: https://github.com/ReactiveX/RxSwift
[radex]: https://github.com/radex/SwiftyUserDefaults
[anchorage]: https://github.com/Raizlabs/Anchorage
[swiftilities]: https://github.com/Raizlabs/Swiftilities
[ohhttpstubs]: https://github.com/AliSoftware/OHHTTPStubs
[fastlane]: https://github.com/fastlane/fastlane
[venmo]: https://github.com/venmo/synx

## Prerequesites
The post script shell used and some used tools require the following to be installed in the user's machine:

1. [Install Cocoapods][pods] (`sudo gem install cocoapods` on
   macOS).

2. [Install Fastlane][fastlane] (`brew cask install fastlane` on
   macOS).

3. [Install Synx][venmo] (`gem install synx` on
   macOS).

## Usage


1. [Install cookiecutter][cookiecutter] (`brew install cookiecutter` on
   macOS).
2. Run `cookiecutter gh:pmlbrito/cookiecutter-ios-template`.
3. Answer the questions.
4. Delete anything that is not of interest to your project.

[cookiecutter]: http://cookiecutter.readthedocs.org/en/latest/installation.html

To run directly from cloned folder, run `cookiecutter ./`

## Configuring the generated project
### Fastlane
Fastlane folder will contain a basic functional fastfile configuration for you project. Deploy QA versions of the app via Fabric platform will be pre-configured.

### Crashlytics
When generating a project from the provided template you will be prompt for the App's Crashlytics API key and secret, providing them will automatically setup fastlanes QA deploys, Crashlytics Crash Report module setup in the app.


### APIClient 

## Cookie Cutter
Cookie Cutter is a python project for templating files and directories. Cookie cutter will ask a serires of questions as defined in `cookiecutter.json` and then run the expansion on the contained files and directory names, and file contents. Anything with `{{ cookiecutter.variable }}` is expanded when the template is expanded. This is a powerful primitive, but has some complications with Xcode

## Post processing
Cookie cutter follows a pattern of expand and prune, where the superset of the template is expanded, and then any specific functionality is pruned in a post in shell script `post_gen_project.sh`. You can also run shell scripts to integrate with webservices. The included `post_gen_project.sh` is a good example of this and it will create a new git repository for your project, run pod instalation command on your newly created project and also run synx command line tool to organize your project's files and folders.

## Contributing to the template
This project is intended to serve as some kind of starting booster for projects with common functionality and ins in no way closed to anyone's contribution or questions. All contributions are welcome, and all feedback is of great value. To ask for specific Modules or functionality, please hit me up with a message or some other kind of contact. Feel free to clone the project and continue it's development and contribute to make it grow. Pull Requests are welcome!

### Managing an XCode Project Template
If you place a cookie cutter expansion in a `.pbxproj` file, Xcode will no longer open the project file. To simplify managing the Xcode project, I have a more primitive expansion script in `generate_template.sh` that will replace a smaller set of words with cookiecutter variables. In particular `PRODUCTNAME` is expanded to `{{ cookiecutter.project_name }}`. Using this simpler form of expansion allows the project in the `PRODUCTNAME` directory to continue to work in Xcode, and lets you manage your template just like any other Xcode project. When you are done with modifications, run `generate_template.sh | sh`.

### Notes
Note that each time you run the template generation command, some of the projects files (such as workspace configs and some other pod instalation metadata files will be deleted). For this reason, to continue working in the PRODUCTNAME project template you have to run 'pod install' command and the work as usual.

If you are looking to do specific Xcode project modifications, I would recommend using `.xcconfig` files, and placing any expansion in those files. If you are looking to expand variables outside of the project file, you can use cookie cutters `{{ cookiecutter.whatever }}` variables directly.



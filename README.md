# NPLinkedINLogin
This Project explains how to get user data from LinkedIn Login using swift 4.

# Getting Started

Download this project.

Create your project in LinkedIn's developer site (https://developer.linkedin.com/docs/ios-sdk)

Configure your plist (replace you **LinkedInAPPID**)

Then install pods from terminal

  ```
    $ sudo gem install cocoapods
    $ pod init
  ```
  
 In your podfile
 ```
   pod 'LinkedinSwift'
   pod 'SwiftyJSON'
   pod 'Alamofire'
   pod 'AlamofireImage'
   pod 'AlamofireObjectMapper', '~> 5.0'
  ``` 
  In terminal
  ```
    $ pod install
  ```
    
 You can run the .xcworkspace project now.
 You will get your data in `linkedinObj` object in `linkedInParsingCompleted(_ linkedinObj: NPLinkedInParser)`delegate method.
 
 # Finally
 You can set set up pods and drag and drop `NPLinkedInParser` class in your project. Set Up your app details in the class like `clientID`, `Client secret Key`, `admin key`, `permissions` and `redirect URL`. Confirm to the `NPLinkedInParserDelegate` protocol.You will get your response data in your `ViewController`.
 
 Thank you for referring. You can always suggest me if we can we do the things in a better way (perveznouman@gmail.com).

# Authors

Nouman Pervez - Initial work - LinkedINLogin

# License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

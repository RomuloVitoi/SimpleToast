# SimpleToast
Provides Android-like API for displaying toasts with keyboard aware positioning on iOS.

![Toast](https://raw.githubusercontent.com/lohmander/iOS-Toast/master/screencast.gif)

## Installation

Through CocoaPods:

```
pod 'SimpleToast', :git => 'https://github.com/RomuloVitoi/SimpleToast.git', :commit => '93be63ba14897de5fa5654eb0119bcd5e502de59'
```

## Usage

First you need to initialize the keyboard observer somewhere. It doesn't really matter where.

```
import SimpleToast

...

Toast.initKeyboardObserver()

...

```

Then use just use it as follows (with the library imported):

```
Toast.makeText("My toast message", Toast.LENGTH_LONG).show()
```

## Settings

There's a few appearance settings you can adjust:

#### blur: Bool
Right there's no background at all if you turn this of. To be fixed...

#### blurStyle: UIBlurEffectStyle
#### cornerRadius: CGFloat
#### margin: CGFloat
Margin to parent view (ie. the window)

#### padding: CGFloat
Padding between the background view and the text label.

#### textColor: UIColor
#### animationDuration: NSTimeInterval


### Example:

Set the values like so:

```
Toast.appearance.cornerRadius = 2
```

## License
[MIT Licensed](https://github.com/lohmander/iOS-Toast/blob/master/LICENSE)

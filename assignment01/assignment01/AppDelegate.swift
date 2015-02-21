//
//  AppDelegate.swift
//  assignment01
//
//  Created by u0734869 Justin Barsketis on 2/7/15.
//  Copyright (c) 2015 CS4962. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    

    var window: UIWindow?
    
    private var _currentColor: UIColor?
    private var _previousColor: UIColor?
    //used in the paint splotches for comparison
    
    private var _saturationKnob: knobControl!
    private var _brightnessKnob: knobControl!
    private var _alphaKnob: knobControl!
   
    private var _saturationValue: CGFloat?
    private var _brightnessValue: CGFloat?
    private var _alphaValue: CGFloat?
    
    internal var _splotchArray: [ColorSplotch]!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = UIColor.whiteColor()
        
        _splotchArray = []
        
        var currentSplotch: UIView = UIView(frame: CGRectMake(window!.frame.width * 0.16, window!.frame.height * 0.05, window!.frame.width * 0.33, window!.frame.width * 0.33))
        currentSplotch.backgroundColor = UIColor.blackColor()
        
        let _textPrevious: UILabel = UILabel(frame: CGRectMake(window!.frame.width * 0.24, window!.frame.height * 0.16, window!.frame.width * 0.33, window!.frame.width * 0.33))
        _textPrevious.text = "Current"
        _textPrevious.adjustsFontSizeToFitWidth = true
        window?.addSubview(_textPrevious)
        
        let _textNext: UILabel = UILabel(frame: CGRectMake(window!.frame.width * 0.58, window!.frame.height * 0.16, window!.frame.width * 0.33, window!.frame.width * 0.33))
        _textNext.text = "Previous"
        _textNext.adjustsFontSizeToFitWidth = true
        window?.addSubview(_textNext)
        
        var previousSplotch: UIView = UIView(frame: CGRectMake(window!.frame.width * 0.50, window!.frame.height * 0.05, window!.frame.width * 0.33, window!.frame.width * 0.33))
        previousSplotch.backgroundColor = UIColor.grayColor()
        
        window?.addSubview(previousSplotch);
        window?.addSubview(currentSplotch);
        
       
        let splotchWidthOffset = window!.frame.width / 5
        
        let splotchHeightOffset = window!.frame.height / 4 + splotchWidthOffset * 0.5
        
        let defaultAlpha: CGFloat = 1.0
        let defaultBrightness: CGFloat = 1.0
        let defaultSaturation: CGFloat = 1.0
        
        var redSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 1.0, frame: CGRectMake(splotchWidthOffset, splotchHeightOffset, splotchWidthOffset, splotchWidthOffset), previous: previousSplotch, current: currentSplotch)
        
        var orangeSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 0.1, frame: CGRectMake(splotchWidthOffset * 2.0, splotchHeightOffset, splotchWidthOffset, splotchWidthOffset), previous: previousSplotch, current: currentSplotch)
        
        var yellowSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 0.2, frame: CGRectMake(splotchWidthOffset * 3.0, splotchHeightOffset, splotchWidthOffset, splotchWidthOffset), previous: previousSplotch, current: currentSplotch)
        
        var greenSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 0.3, frame: CGRectMake(splotchWidthOffset, splotchHeightOffset * 1.5, splotchWidthOffset, splotchWidthOffset), previous: previousSplotch, current: currentSplotch)
        
        var blueSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 0.6, frame: CGRectMake(splotchWidthOffset * 2.0, splotchHeightOffset * 1.5, splotchWidthOffset, splotchWidthOffset), previous: previousSplotch, current: currentSplotch)
        
        var purpleSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 0.85, frame: CGRectMake(splotchWidthOffset * 3.0, splotchHeightOffset * 1.5, splotchWidthOffset, splotchWidthOffset), previous: previousSplotch, current: currentSplotch)
        
        let topSplotchWidth: CGFloat = window!.frame.width * 0.5
        let topSplotchOffset: CGFloat = window!.frame.width * 0.5

        
//        var previousSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 1.0, frame: CGRectMake(window!.frame.width * 0.05, window!.frame.height * 0.05, window!.frame.width * 0.4, window!.frame.width * 0.4))
//        var currentSplotch: ColorSplotch = ColorSplotch(saturation: defaultSaturation, brightness: defaultBrightness, alpha: defaultAlpha, hue: 1.0, frame: CGRectMake(window!.frame.width * 0.5, window!.frame.height * 0.05, window!.frame.width * 0.4, window!.frame.width * 0.4))
//        
        
        
        
        window?.addSubview(redSplotch);_splotchArray?.append(redSplotch)
        window?.addSubview(orangeSplotch);_splotchArray?.append(orangeSplotch)
        window?.addSubview(yellowSplotch);_splotchArray?.append(yellowSplotch)
        window?.addSubview(greenSplotch);_splotchArray?.append(greenSplotch)
        window?.addSubview(blueSplotch);_splotchArray?.append(blueSplotch)
        window?.addSubview(purpleSplotch);_splotchArray?.append(purpleSplotch)
        //add splotches to the view and to an array to keep track of them all
        
        
        
        
        let knobWidth: CGFloat = window!.frame.width / 4
        let knobOffset: CGFloat = knobWidth * 0.5
        let labelWidth: CGFloat = 50
        let labelOffset: CGFloat = labelWidth * 0.5
        let labelHeight: CGFloat = 60
        let heightOffset:CGFloat = 200.0
        
        
        
        _saturationKnob = knobControl(name: "saturation", frame: CGRectMake(window!.frame.width * 0.25 - knobOffset, window!.frame.height - heightOffset, knobWidth, knobWidth), colors: _splotchArray)
        _saturationKnob.backgroundColor = UIColor.clearColor()
        window?.addSubview(_saturationKnob)
        //create the custom knob
        let _textSat: UILabel = UILabel(frame: CGRectMake(window!.frame.width * 0.25 - labelOffset, window!.frame.height - (labelHeight + knobWidth + (heightOffset * 0.5)), labelWidth, labelHeight))
        _textSat.text = "Saturation"
        _textSat.adjustsFontSizeToFitWidth = true
        window?.addSubview(_textSat)
        //add a label to it
        
        _brightnessKnob = knobControl(name: "brightness", frame: CGRectMake(window!.frame.width * 0.5 - knobOffset, window!.frame.height - heightOffset, knobWidth, knobWidth), colors: _splotchArray)
        _brightnessKnob.backgroundColor = UIColor.clearColor()
        window?.addSubview(_brightnessKnob)
        //create the custom knob
        let _textBright: UILabel = UILabel(frame: CGRectMake(window!.frame.width * 0.5 - labelOffset, window!.frame.height - (labelHeight + knobWidth + (heightOffset * 0.5)), labelWidth, labelHeight))
        _textBright.text = "Brightness"
        _textBright.adjustsFontSizeToFitWidth = true
        window?.addSubview(_textBright)
        //add a label to it
        
        _alphaKnob = knobControl(name: "alpha", frame: CGRectMake(window!.frame.width * 0.75 - knobOffset, window!.frame.height - heightOffset, knobWidth, knobWidth), colors: _splotchArray)
        _alphaKnob.backgroundColor = UIColor.clearColor()
        window?.addSubview(_alphaKnob)
        //create the custom knob
        let _textAlpha: UILabel = UILabel(frame: CGRectMake(window!.frame.width * 0.75 - labelOffset, window!.frame.height - (labelHeight + knobWidth + (heightOffset * 0.5)), labelWidth, labelHeight))
        _textAlpha.text = "   Alpha  "
        _textAlpha.adjustsFontSizeToFitWidth = true
        window?.addSubview(_textAlpha)
        
        
        var resetButton = UIButton(frame: CGRectMake(window!.frame.width * 0.5 - 100, window!.frame.height - heightOffset * 0.5 + 10, 200, 50))
        resetButton.setTitle("Reset Colors", forState: UIControlState.Normal)
        resetButton.backgroundColor = UIColor.grayColor()
        //resetButton.addTarget(self, action: "resetColors", forControlEvents: UIControlEvents.TouchUpInside)
        resetButton.addTarget(self, action: "resetColors", forControlEvents: UIControlEvents.TouchUpInside)
        window?.addSubview(resetButton)
        //This button will reset the pallette to their default values
        
        //reset presentation colors to their default values
        
        
        //set the colors/sliders to their desired original values
        
        // Override point for customization after application launch.
        return true
    }
    func resetColors()
    {
        for index in 0...5
        {
            var currentSplotch = _splotchArray[index]
            
            currentSplotch.changeSaturation(CGFloat(1.0))
            currentSplotch.changeBrightness(CGFloat(1.0))
            currentSplotch.changeAlpha(CGFloat(1.0))
           
        }
    }

    
    
    
    
    class ColorSplotch: UIView
    {
        private var _saturation: CGFloat
        private var _brightness: CGFloat
        private var _alpha: CGFloat
        private let _hue: CGFloat
        private var _color: UIColor
        private var _colorSquare: CGRect = CGRectZero
        private var _previous: UIView
        private var _current: UIView
        
        init(saturation: CGFloat, brightness: CGFloat, alpha: CGFloat, hue: CGFloat, frame: CGRect, previous: UIView, current: UIView)
        {
            
            _saturation = saturation
            _brightness = brightness
            _alpha = alpha
            _hue = hue
            _color = UIColor(hue: _hue, saturation: _saturation, brightness: _brightness, alpha: _alpha)
            
            _previous = previous
            _current = current
            
            super.init(frame: frame)
            self.backgroundColor = UIColor.clearColor()
        }

        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        
        override func drawRect(rect: CGRect)
        {
            let context: CGContext = UIGraphicsGetCurrentContext()
            
            
            
            _colorSquare = CGRectZero
            _colorSquare.size.width = min(bounds.width, bounds.height)
            _colorSquare.size.height = _colorSquare.width
            //create a square so it is a perfect circle
            
            _colorSquare.origin.x = (bounds.width - _colorSquare.width) * 0.5
            _colorSquare.origin.x = (bounds.height - _colorSquare.height) * 0.5
            //center the square on the screen
            
            
            CGContextAddEllipseInRect(context, _colorSquare)
            
            CGContextSetFillColorWithColor(context, _color.CGColor)
            CGContextDrawPath(context, kCGPathFill)
            //create the circle
            
            
            

            
            
        }

        
        override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
            _previous.backgroundColor = _current.backgroundColor
            _current.backgroundColor = _color
            
        }
        
        
        
        func changeValues()
        {
            _saturation = 1.0
            _brightness = 1.0
            _alpha = 1.0
            _color = UIColor(hue: _hue, saturation: _saturation, brightness: _brightness, alpha: _alpha)
            setNeedsDisplay()
        }
        func changeSaturation(newSaturation: CGFloat)
        {
            _saturation = newSaturation
            _color = UIColor(hue: _hue, saturation: _saturation, brightness: _brightness, alpha: _alpha)
            setNeedsDisplay()
        }
        func changeBrightness(newBrightness: CGFloat)
        {
            
            _brightness = newBrightness
            _color = UIColor(hue: _hue, saturation: _saturation, brightness: _brightness, alpha: _alpha)
            setNeedsDisplay()
        }
        func changeAlpha(newAlpha: CGFloat)
        {
            _alpha = newAlpha
            _color = UIColor(hue: _hue, saturation: _saturation, brightness: _brightness, alpha: _alpha)
            setNeedsDisplay()
        }
        
        
        func resetValue()
        {
            _saturation = 1.0
            _brightness = 1.0
            _alpha = 1.0
            _color = UIColor(hue: _hue, saturation: _saturation, brightness: _brightness, alpha: _alpha)
            setNeedsDisplay()
            
        }
    
    }
    
    class knobControl: UIView
    {
        
        //add label as parameter
        private var _knobSquare: CGRect = CGRectZero
        private var _angle: Float = Float(M_PI) / 4.0
        private var _previousAngle: Float = Float(M_PI) / 4.0
        //angle the nib is located at = pi/4 or 45 degrees
        private let _incrementValue: Float = 0.015
        private var _colorsArray: [ColorSplotch]
        
        private let _knobType: String
        
        var angle: Float
        {
            get {return _angle}
            set
            {
                _angle = newValue
                setNeedsDisplay()
            }
        }
        
        var _minValue: Float = 0.0
        var _maxValue: Float = 1.0
        var value: Float = 1.0
        
        
        required init(coder: NSCoder) {
            fatalError("NSCoding not supported")
        }

        init (name: String, frame: CGRect, colors: [ColorSplotch])
        {
            _knobType = name
            _colorsArray = colors
            super.init(frame: frame)
            
            
        }

        override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
            
            let touch: UITouch = touches.anyObject() as UITouch
            let touchPoint: CGPoint = touch.locationInView(self)
            let touchAngle: Float = atan2f(Float(touchPoint.y - _knobSquare.midY) , Float(touchPoint.x - _knobSquare.midX))
            
            
            _previousAngle = angle
            //reset the previous angle
            
            
            
            //determine to increment or decrement value marker
            //doesn't set angle if the max is reached
            if (abs(_previousAngle - touchAngle) > 5.0)
            {
            
                if (touchAngle > 0)
                {
                   
                    if (decrementValue())
                    {
                        
                        _previousAngle = 3.15
                        angle = 3.14
                    }
                    
                }
                else
                {
                    if (incrementValue())
                    {
                        
                        _previousAngle = -3.15
                        angle = -3.14
                    }
                    
                }
            }
            else
            {
                if (touchAngle > _previousAngle)
                {
                
                    //icrement the value
                    if (incrementValue())
                    {
                    //and set the new angle
                       
                        angle = touchAngle
                    }
                    
                }
                else
                {
                
                    if (decrementValue())
                    {
                        //and set the new angle
                        angle = touchAngle
                       
                    }
                    
                }
            }
            

            
            
        
            
            setNeedsDisplay()
            //redraw the frame
        
        }
        
        //increment value if the max as not been reached
        //return true if it as changed, false otherwise
        func incrementValue() -> Bool
        {
            if (value >= _maxValue)
            {
                return false
            }
            
            value = value + _incrementValue
            
            //change pallette colors saturation
            
            for index in 0...5
            {
                var currentSplotch = _colorsArray[index]
                if (_knobType == "saturation")
                {
                    println(value)
                    currentSplotch.changeSaturation(CGFloat(value))
                }
                else if (_knobType == "brightness")
                {
                    currentSplotch.changeBrightness(CGFloat(value))
                }
                else
                {
                    currentSplotch.changeAlpha(CGFloat(value))
                }
            }
            
            return true
            
        }
        func decrementValue() -> Bool
        {
            if (value <= _minValue)
            {
                return false
            }
            
            value = value - _incrementValue
            
            for index in 0...5
            {
                var currentSplotch = _colorsArray[index]
                if (_knobType == "saturation")
                {
                    println(value)
                    currentSplotch.changeSaturation(CGFloat(value))
                }
                else if (_knobType == "brightness")
                {
                    currentSplotch.changeBrightness(CGFloat(value))
                }
                else
                {
                    currentSplotch.changeAlpha(CGFloat(value))
                }
            }
            
            return true
        }
        
        override func drawRect(rect: CGRect)
        {
            let context: CGContext = UIGraphicsGetCurrentContext()
            
            
            
            _knobSquare = CGRectZero
            _knobSquare.size.width = min(bounds.width, bounds.height)
            _knobSquare.size.height = _knobSquare.width
            //create a square so it is a perfect circle
            
            _knobSquare.origin.x = (bounds.width - _knobSquare.width) * 0.5
            _knobSquare.origin.x = (bounds.height - _knobSquare.height) * 0.5
            //center the knob on the screen
            
            
            CGContextAddEllipseInRect(context, _knobSquare)
            CGContextSetFillColorWithColor(context, UIColor.lightGrayColor().CGColor)
            CGContextDrawPath(context, kCGPathFill)
            //create the circle
            
            
            
            let nibRadius: CGFloat = _knobSquare.width*0.4
            //the how far out the inner control is
            
            var nibSquare: CGRect = CGRectZero
            nibSquare.size.width = _knobSquare.width * 0.15
            nibSquare.size.height = nibSquare.width
            //create the square for the smaller control
            nibSquare.origin.x = _knobSquare.midX + nibRadius * CGFloat(cosf(angle)) - nibSquare.width * 0.5
            nibSquare.origin.y = _knobSquare.midY + nibRadius * CGFloat(sinf(angle)) - nibSquare.height * 0.5
            //center the nib
            
            CGContextAddEllipseInRect(context, nibSquare)
            CGContextSetFillColorWithColor(context, UIColor.darkGrayColor().CGColor)
            CGContextDrawPath(context, kCGPathFill)
            //create the circle
            
            
            
        }
        
        
        
        
    }
    
    


}


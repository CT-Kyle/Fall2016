# Core Motion
## Swift Coding
```Swift
import CoreMotion
let activityManager = CMMotionActivityManager()
let customQueue = NSOperationQueue()

    override func viewDidLoad() {
        super.viewDidLoad()

        if CMMotionActivityManager.isActivityAvailable() {
            self.activityManager.startActivityUpdatesToQueue(customQueue)
            { (activity:CMMotionActivityManager) -> Void in
                //do something with activity info!
            }
        }
    }
```

### What's in an update?
- updated when any part of activity estimate changes
- each update is a CMMotionActivityManager class instance
    - startDate(down to the seconds)
    - walking {0,1}
    - stationary {0,1}
    - etc.

### Pedometer Use
```Swift
let pedometer = CMPedometer()

if CMPedometer.isStepCountingAvailable() {
    pedometer.startPedometerUpdatesFromDate(NSDate())
    { (pedData: CMPedometerData?, error:NSError?) -> Void in
        NSLog("%@", pedData.description)
    }
}

if CMPedometer.isStepCountingAvailable() {
    self.pedometer.stopPedometerUpdates()
}
```
- iOS: you get pedo updates when we say you do!
    - which optimizes battery life
    - is not really at expense of interaction
    - minimizes bus traffic on co-processor
    - will keep track in background, even if app is off
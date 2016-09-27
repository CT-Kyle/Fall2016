# Core Motion Continued and SpriteKit
### Storing persistent defaults (vaults)
- Where all apps can store their data
```swift
let defaults = NSUserDefaults.standardUserDefaults()
```

## SpriteKit
- Sk abbreviated
- real time physics engine for game applications
- for 2D games
- uses an SKview and SKViewController
- create sprites (basically 2D images, png)
  - color/texture
  - physical properties:
    - mass
    - restitution
    - friction
    - awesomeness
- physics updated at 60Hz

# Image Processing
##### *The art and science of manipulating pixels*

### Images as Data
- Image can be represented in many ways
- Most common format is a matrix of pixels
- Each "pixel" is BGRA (blue, green, red, alpha)
- 9 sensors on the iphone, 6 of them are green sensors since green is picked up the most

### Images as Signals
- Human eye can discern 50 shades of gray
- "Stretching" is where we take lower RGBA values and boost them to amp up low light conditions
- there are issues with distortion! Sometimes lines get messed up in video or in static images. This is called aliasing.


### What is filtering?
- You take one array and multiply it with the original image array
- Convolution, vertical difference, etc.

### Video
- Back:
  - 8MB photos(~30MB raw)
  - 1080p HD video at 30fps
- Face:
  - 1.2MB photos
- So much data! We need to hardware accelerate!
- Need to use parallel processing and GPU!

### Core Image Framework
- Defines images as CIImage instances
- Defines a set of filters that (can be) GPU accelerated
  - Optimizes filters when cascaded
- Filters created through CIFilter class instances

- Will apply multiple filters at one time if possible
  - "Lazily display"
- Will very easily allow you to take a picture from the camera, look at code on github


### AH! But we want video!
- Want to access incoming video in real time and display to screen!
- But how??
  - Use VideoAnalgesic!
  - Takes the pain out of GPU capture, render, and processing



























_______________

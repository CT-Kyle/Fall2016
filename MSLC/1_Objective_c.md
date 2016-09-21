`@interface SomeClass : NSObject`
 interface is interface for the class, SomeClass is the class name and NSObject
 is what every class must inherit from

`@property (strong, nonatomic) NSString \*aString;`
 \*aString is a property

`@end`

if its in the .h file they are public

```objective-c
@interface SomeClass ()
{
  float aFloat;
}
@property (strong, nonatomic) NSString \*aString;
@end
@impelementation SomeClass
@synthesize aString = _aString;
```
The \_aString is the backing variable, what actually gets mutated

atomic = thread safe
nonatomic = faster access

strong = keep a reference
weak = no reference
^The two above are about *automatic reference counting*
not garbage collection
when reference count for variable == 0, immediately free memory
**strong** is usually what you want, else variable is never allocated
**weak** is used in scenarios when UI elements


##Encapsulation
```objective-c
NSNumber *aNum = [[NSNumber alloc]init];
aNum = @3;

NSString *aString = [NSString stringWithFormat:@"The time is always %d past %d", 42, 9];
aString = @"A string";
```

##Mutable and Immutable
Arrays are immutable by default
If you want to make it mutable you have to call it an `NSMutableArray`, you can
add objects to it now!
All arrays are `nil` terminated


##Function examples

##Common Functions
```objective-c
NSLog(@"The value is: %@", someComplexObject);
```
the %@ is print for serializable objects

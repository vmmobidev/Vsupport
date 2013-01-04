#import "Orientation.h"

NSString *NSStringFromUIDeviceOrientation(UIDeviceOrientation orientation)
{
    assert(orientation <= 6);
    static NSString *names[] = {@"unknown", @"portrait", @"portrait u/d",
        @"landscape left", @"landscape right", @"face up", @"face down"};
    return names[orientation];
}

NSString *NSStringFromUIInterfaceOrientation(UIInterfaceOrientation orientation)
{
    assert(orientation <= 4);
    static NSString *names[] = {@"unknown", @"portrait", @"portrait u/d", @"landscape left", @"landscape right"};
    return names[orientation];
}

CGAffineTransform CGAffineTransformFromUIOrientation(UIInterfaceOrientation io)
{
    assert(io <= 4);
    // unknown, portrait, portrait u/d, landscape L, landscape R
    static float angles[] = {0, 0, M_PI, M_PI/2, -M_PI/2};
    return CGAffineTransformMakeRotation(angles[io]);
}
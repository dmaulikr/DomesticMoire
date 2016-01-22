
//  Created by Patrick Winchell on 1/19/16.
//  Copyright © 2016 Patrick Winchell. All rights reserved.

import Cocoa
import SpriteKit

public class ScreenSaverSKView: SKView
{
    // Ignore all input so the screensaver ends on any input
    public override var acceptsFirstResponder: Bool { return false }
}

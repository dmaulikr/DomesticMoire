
//  Created by Devine Lu Linvega on 2016-01-02.
//  Copyright (c) 2016 Devine Lu Linvega. All rights reserved.

var game:SKScene!
var rings:Int = 30

import Cocoa
import SpriteKit

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate
{
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var skView: SKView!
	
    func applicationDidFinishLaunching(aNotification: NSNotification)
	{
		game = GameScene(fileNamed:"GameScene")
		
            /* Set the scale mode to scale to fit the window */
            game.scaleMode = .AspectFill
			game.backgroundColor = SKColor.blackColor()
            
            self.skView!.presentScene(game)
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
//            self.skView!.ignoresSiblingOrder = true
			
            self.skView!.showsFPS = true
            self.skView!.showsNodeCount = true
			
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool
	{
        return true
    }
}

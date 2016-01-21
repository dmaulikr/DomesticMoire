
//  Created by Devine Lu Linvega on 2016-01-02.
//  Copyright (c) 2016 Devine Lu Linvega. All rights reserved.

import SpriteKit
import Cocoa

var rings:Int = 30

public class ScreenSaverScene: SKScene
{
	let container = SKNode()
    var image: SKNode?
    var tiles = [Tile]()
    
    // Ignore all input so the screensaver ends on any input
    public override var acceptsFirstResponder: Bool { return false }
	
    public override func didMoveToView(view: SKView)
	{
        self.resignFirstResponder()
        self.userInteractionEnabled=false
        removeChildrenInArray([container])
		addChild(container)
		
		var count = 1
		while count < rings {
            let newTile = Tile(index:count, size: self.size)
			container.addChild(newTile)
            tiles.append(newTile)
			count += 1
		}
        
        if let image = self.getImage("logo.xxiivv.white")
        {
            let texture = SKTexture(image: image)
            let node = SKSpriteNode(texture: texture)
            self.image = node
            self.addChild(node)
            node.size.width = node.size.width / 2
            node.size.height = node.size.height / 2
            node.position = CGPoint(x: (node.size.width / 2) + 20,
                y:  (node.size.height / 2) + 20)
        }
    }
	
//	override func mouseDown(theEvent: NSEvent)
//	{
//		mainView.exitFullScreenModeWithOptions(nil)
//		NSApp.terminate(self)
//	}
	
    public override func update(currentTime: CFTimeInterval)
	{
		for tile in tiles
        {
            tile.animate()
        }
        
        // Fade the xxiivv logo to prevent burn-in
        if let image = self.image
        {
            image.alpha = sin(CGFloat(currentTime * M_PI / 60.0))
        }
    }
    
    
    // In the screensave environment getting an image is harder than it should be.
    func getImage(name: String) -> NSImage?
    {
        if let image = NSImage(named: "logo.xxiivv.white")
        {
            return image
        }
        
        let bundle = NSBundle(forClass: ScreenSaverScene.self)
        if let path = bundle.pathForResource(name, ofType: "png")
        {
            return NSImage(contentsOfFile: path)
        }
        
        return nil
    }
}
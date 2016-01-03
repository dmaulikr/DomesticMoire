
//  Created by Devine Lu Linvega on 2016-01-02.
//  Copyright © 2016 Devine Lu Linvega. All rights reserved.

import Foundation
import SpriteKit

class Tile: SKNode
{
	var sprite:SKShapeNode!
	var time:CGFloat = 0
	var index:Int = 0
	var ratio:CGFloat = 0
	
	init( index:Int)
	{
		super.init()
		self.position = CGPoint(x: game.frame.width/2, y: game.frame.height/2)
		self.index = index
		
		sprite = SKShapeNode(circleOfRadius: (game.frame.height/100) * CGFloat(rings - index))
		sprite.fillColor = index % 2 == 0 ? NSColor.whiteColor() : NSColor.blackColor()
		sprite.strokeColor = NSColor.clearColor()
		addChild(sprite)
		
		ratio = CGFloat(index)/CGFloat(rings)
	}
	
	func animate()
	{
		let slow = sin(time * 0.0001)
		let medium = sin(time * 0.001)
		let fast = sin(time * ratio * (medium/10))/ratio * 20 * ratio * slow
		
		let wobble = ((sin(time * 0.01) * CGFloat(rings) ) + CGFloat(rings)) * 0.1
		
		sprite.position = CGPoint(x: 0, y: (10 * ratio) + (10 * wobble * ratio))
		
		zRotation = time * 0.025 + ratio * (wobble/2) + (slow * ratio) * (slow * wobble/medium)
		sprite.xScale = 1 + (wobble * ratio * 0.1)
		sprite.yScale = 1 + (wobble * ratio * 0.2 * ratio * wobble * 0.25)
		
		sprite.xScale += fast * 0.01 * ratio
		sprite.yScale += fast * 0.01 * ratio
		
		sprite.zRotation = ( wobble * ratio * medium * wobble ) / ratio
		
		time += 1
	}

	required init?(coder aDecoder: NSCoder)
	{
	    fatalError("init(coder:) has not been implemented")
	}
}
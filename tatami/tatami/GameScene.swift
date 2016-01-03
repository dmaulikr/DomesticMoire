
//  Created by Devine Lu Linvega on 2016-01-02.
//  Copyright (c) 2016 Devine Lu Linvega. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
    override func didMoveToView(view: SKView)
	{
		var count = 1
		while count < rings {
			addChild(Tile(index:count))
			count += 1
		}
    }
	
	var time:Double = 0
	
    override func update(currentTime: CFTimeInterval)
	{
		for tile in self.children {
			let tile = tile as! Tile
			tile.animate()
		}
		
		time += 1
		
		
		
    }
}

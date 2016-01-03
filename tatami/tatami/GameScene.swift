
//  Created by Devine Lu Linvega on 2016-01-02.
//  Copyright (c) 2016 Devine Lu Linvega. All rights reserved.

import SpriteKit

class GameScene: SKScene
{
	let container = SKNode()
	
    override func didMoveToView(view: SKView)
	{
		addChild(container)
		
		var count = 1
		while count < rings {
			container.addChild(Tile(index:count))
			count += 1
		}
    }
	
    override func update(currentTime: CFTimeInterval)
	{
		for tile in container.children {
			let tile = tile as! Tile
			tile.animate()
		}
    }
}

//
//  Renderer.swift
//  Metal_WorkSpace
//
//  Created by Cheney on 2023/8/7.
//

import MetalKit

class Renderer: NSObject {
    init(metalView: MTKView){
        super.init()
    }
}


extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        print("draw")
    }
}


//: [Previous](@previous)

import PlaygroundSupport
import MetalKit

guard let device = MTLCreateSystemDefaultDevice() else {
    
    fatalError("GPU is not supported")
}


let frame = CGRect(x: 0, y: 0, width: 400, height: 400)
let view = MTKView(frame: frame, device: device)
view.clearColor = MTLClearColor(red: 1, green: 1, blue: 0.8, alpha: 1)

let allocator = MTKMeshBufferAllocator(device: device)

let mdlMesh = MDLMesh(sphereWithExtent: [0.75,0.75,0.75], segments: [100,100], inwardNormals: false, geometryType: .triangles, allocator: allocator)

let mesh = try MTKMesh(mesh: mdlMesh, device: device)


guard let commandQueue = device.makeCommandQueue() else {
    
    fatalError("Could not create a command queue")
}

let shader = """
#include <metal_stdlib>
using namespace metal;

struct VertexIn {
  float4 position [[attribute(0)]];
};

vertex float4 vertex_main(const VertexIn vertex_in [[stage_in]]) {
  return vertex_in.position;
}

fragment float4 fragment_main() {
  return float4(0, 0.4, 0.21, 1);
}
"""

let library = try device.makeLibrary(source: shader, options: nil)
let vertexFuncation = library.makeFunction(name: "vertex_main")
let fragmentFuncation = library.makeFunction(name: "fragment_main")

let pipelineDescriptor = MTLRenderPipelineDescriptor()
pipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
pipelineDescriptor.vertexFunction = vertexFuncation
pipelineDescriptor.fragmentFunction = fragmentFuncation

pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mesh.vertexDescriptor)

let pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)


guard let commandBuffer = commandQueue.makeCommandBuffer(),
      let renderPassDescriptor = view.currentRenderPassDescriptor,
      let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)

else {
    fatalError()
}

renderEncoder.setRenderPipelineState(pipelineState)
renderEncoder.setTriangleFillMode(.lines)

renderEncoder.setVertexBuffer(mesh.vertexBuffers[0].buffer, offset: 0, index: 0)

guard let submesh = mesh.submeshes.first else {
    fatalError()
}

renderEncoder.drawIndexedPrimitives(type: .triangle, indexCount: submesh.indexCount, indexType: submesh.indexType, indexBuffer: submesh.indexBuffer.buffer, indexBufferOffset: 0)

renderEncoder.endEncoding()

guard let drawable = view.currentDrawable else {
    fatalError()
}

commandBuffer.present(drawable)
commandBuffer.commit()
PlaygroundPage.current.liveView = view

//: [Next](@next)

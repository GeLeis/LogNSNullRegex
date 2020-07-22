//
//  SDTri.h
//  LogNSNullRegex
//
//  Created by gelei on 2019/10/22.
//  Copyright © 2019 gelei. All rights reserved.
//

#import <simd/simd.h>
#import <Metal/Metal.h>
#import <MetalKit/MetalKit.h>
NS_ASSUME_NONNULL_BEGIN

//simd
typedef struct {
    // Positions in pixel space // (e.g. a value of 100 indicates 100 pixels from the center)
    vector_float2 position; // Floating-point RGBA colors
    vector_float4 color;
} AAPLVertex;
//三角形的3个顶点
static const AAPLVertex triangleVertices[] = {
    {{250,-250},{1,0,0,1}},
    {{-250,-250},{0,1,0,1}},
    {{0,250},{0,0,1,1}}
};

//typedef struct {
//    float4 clipSpacePosition [[position]];
//    float4 color;
//} RasterizerData;

//vertex RasterizerData
//vertexShader(uint vertexID [[vertex_id]],
//             constant AAPLVertex *vertices [[buffer(AAPLVertexInputIndexVertices)]],
//             constant vector_uint2 *viewportSizePointer [[buffer(AAPLVertexInputIndexViewportSize)]])

@interface SDTri : NSObject


@end

NS_ASSUME_NONNULL_END

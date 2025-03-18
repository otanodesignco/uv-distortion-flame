import { shaderMaterial, useTexture } from '@react-three/drei'
import { extend, useFrame } from '@react-three/fiber'
import React, { useRef } from 'react'
import vertex from '../shaders/vertex.glsl'
import fragment from '../shaders/fragment.glsl'
import { RepeatWrapping, Vector2, Color, DoubleSide } from 'three'

export default function BaseMaterial( {
    texture ='./textures/noise/noiseValue.webp',
    ...props
} ) 
{
    const self = useRef()

    const flame = useTexture('./textures/noise/noiseFlame.webp')
    const colorMap = useTexture('./textures/gradientmaps/gradientmap2.png')

    const noise = useTexture( texture )
    noise.wrapS = RepeatWrapping
    noise.wrapT = RepeatWrapping

    const uniforms =
    {
        uTime: 0,
        uNoiseTexture: noise,
        uNoiseFlame: flame,
        uColorMap: colorMap,
    }

    useFrame( ( state, delta ) =>
    {
        self.current.uniforms.uTime.value += delta
    })

    const BaseMaterial = shaderMaterial( uniforms, vertex, fragment )
    extend( { BaseMaterial } )

    return (
        <baseMaterial
            key={ BaseMaterial.key }
            ref={ self }
            {...props}
            transparent={ true }
            side={ DoubleSide }
        />
    )
}
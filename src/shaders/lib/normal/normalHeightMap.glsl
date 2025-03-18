// vec3 normalHeightMap( sampler2D heightMap, vec2 texCoord, vec2 texelSize ) 
// {
//     // Sample height values from neighboring pixels
//     float heightL = texture(heightMap, texCoord - vec2(texelSize.x, 0.0)).r;
//     float heightR = texture(heightMap, texCoord + vec2(texelSize.x, 0.0)).r;
//     float heightU = texture(heightMap, texCoord + vec2(0.0, texelSize.y)).r;
//     float heightD = texture(heightMap, texCoord - vec2(0.0, texelSize.y)).r;
    
//     // Calculate the change in height (derivative) in x and y directions
//     // Multiplying by a scale factor allows you to control the normal map intensity
//     float scale = 10.0; // Adjust this to control the normal map's prominence
//     float dX = ((heightR - heightL) * scale);
//     float dY = ((heightU - heightD) * scale);
    
//     // Construct the normal vector
//     // Note: In a typical normal map, the blue channel (Z) is usually set to 1
//     vec3 normal = normalize(vec3(-dX, -dY, 1.0));
    
//     // Convert from [-1,1] range to [0,1] range for texture storage
//     return normal * 0.5 + 0.5;
    
// }

vec3 normalHeightMapWorld( float In, mat3 TangentMatrix, vec3 Position )
{

    vec3 worldDirivativeX = dFdx(Position * 100.0);
    vec3 worldDirivativeY = dFdy(Position * 100.0);
    vec3 crossX = cross(TangentMatrix[2].xyz, worldDirivativeX);
    vec3 crossY = cross(TangentMatrix[2].xyz, worldDirivativeY);
    float d = abs(dot(crossY, worldDirivativeX));
    vec3 inToNormal = ((((In + dFdx(In)) - In) * crossY) + (((In + dFdy(In)) - In) * crossX)) * sign(d);
    inToNormal.y *= -1.0;

    vec3 rtnNormal = normalize((d * TangentMatrix[2].xyz) - inToNormal)
    return rtnNormal;

}

vec3 normalHeightMapTangent( float In, mat3 TangentMatrix, vec3 Position )
{

    vec3 worldDirivativeX = dFdx(Position * 100.0);
    vec3 worldDirivativeY = dFdy(Position * 100.0);
    vec3 crossX = cross(TangentMatrix[2].xyz, worldDirivativeX);
    vec3 crossY = cross(TangentMatrix[2].xyz, worldDirivativeY);
    float d = abs(dot(crossY, worldDirivativeX));
    vec3 inToNormal = ((((In + dFdx(In)) - In) * crossY) + (((In + dFdy(In)) - In) * crossX)) * sign(d);
    inToNormal.y *= -1.0;

    vec3 rtnNormal = normalize((d * TangentMatrix[2].xyz) - inToNormal)
    return transpose( TangentMatrix ) * rtnNormal;

}
' Copyright (c) 2014 Mark Mcvittie, Bruce A Henderson
'
' This software is provided 'as-is', without any express or implied
' warranty. In no event will the authors be held liable for any damages
' arising from the use of this software.
'
' Permission is granted to anyone to use this software for any purpose,
' including commercial applications, and to alter it and redistribute it
' freely, subject to the following restrictions:
'
'    1. The origin of this software must not be misrepresented; you must not
'    claim that you wrote the original software. If you use this software
'    in a product, an acknowledgment in the product documentation would be
'    appreciated but is not required.
'
'    2. Altered source versions must be plainly marked as such, and must not be
'    misrepresented as being the original software.
'
'    3. This notice may not be removed or altered from any source
'    distribution.
'

' Openb3d declarations and library functions

Strict

Import brl.linkedlist
Import brl.Graphics
Import b3d.OpenB3dLib

'Import "source.bmx"

' Global declarations
' -------------------
Extern
	Function BackBufferToTex_( tex:Byte Ptr, frame:Int )="BackBufferToTex"
	Function BufferToTex_( tex:Byte Ptr, buffer:Byte Ptr, frame:Int )="BufferToTex"
	Function CameraToTex_( tex:Byte Ptr, cam:Byte Ptr, frame:Int )="CameraToTex"
	Function TexToBuffer_( tex:Byte Ptr, buffer:Byte Ptr, frame:Int )="TexToBuffer"
' Minib3d Only
	Function MeshCullRadius_( ent:Byte Ptr, radius:Float )="MeshCullRadius"
' Blitz3D functions, A-Z
	Function AddAnimSeq_:Int( ent:Byte Ptr, length:Int )="AddAnimSeq"
	Function AddMesh_( mesh1:Byte Ptr, mesh2:Byte Ptr )="AddMesh"
	Function AddTriangle_:Int( surf:Byte Ptr, v0:Int, v1:Int, v2:Int )="AddTriangle"
	Function AddVertex_:Int( surf:Byte Ptr, x:Float, y:Float, z:Float, u:Float, v:Float, w:Float )="AddVertex"
	Function AmbientLight_( r:Float, g:Float, b:Float )="AmbientLight"
	Function AntiAlias_( samples:Int )="AntiAlias"
	Function Animate_( ent:Byte Ptr, Mode:Int, speed:Float, seq:Int, trans:Int )="Animate"
	Function Animating_:Int( ent:Byte Ptr )="Animating"
	Function AnimLength_( ent:Byte Ptr )="AnimLength"
	Function AnimSeq_:Int( ent:Byte Ptr )="AnimSeq"
	Function AnimTime_:Float( ent:Byte Ptr )="AnimTime"
	Function BrushAlpha_( brush:Byte Ptr, a:Float )="BrushAlpha"
	Function BrushBlend_( brush:Byte Ptr, blend:Int )="BrushBlend"
	Function BrushColor_( brush:Byte Ptr, r:Float, g:Float, b:Float )="BrushColor"
	Function BrushFX_( brush:Byte Ptr, fx:Int )="BrushFX"
	Function BrushShininess_( brush:Byte Ptr, s:Float )="BrushShininess"
	Function BrushTexture_( brush:Byte Ptr, tex:Byte Ptr, frame:Int, index:Int )="BrushTexture"
	Function CameraClsColor_( cam:Byte Ptr, r:Float, g:Float, b:Float )="CameraClsColor"
	Function CameraClsMode_( cam:Byte Ptr, cls_depth:Int, cls_zbuffer:Int )="CameraClsMode"
	Function CameraFogColor_( cam:Byte Ptr, r:Float, g:Float, b:Float )="CameraFogColor"
	Function CameraFogMode_( cam:Byte Ptr, Mode:Int )="CameraFogMode"
	Function CameraFogRange_( cam:Byte Ptr, nnear:Float, nfar:Float )="CameraFogRange"
	Function CameraPick_:Byte Ptr( cam:Byte Ptr, x:Float, y:Float )="CameraPick"
	Function CameraProject_( cam:Byte Ptr, x:Float, y:Float, z:Float )="CameraProject"
	Function CameraProjMode_( cam:Byte Ptr, Mode:Int )="CameraProjMode"
	Function CameraRange_( cam:Byte Ptr, nnear:Float, nfar:Float )="CameraRange"
	Function CameraViewport_( cam:Byte Ptr, x:Int, y:Int, width:Int, height:Int )="CameraViewport"
	Function CameraZoom_( cam:Byte Ptr, zoom:Float )="CameraZoom"
	Function ClearCollisions_()="ClearCollisions"
	Function ClearSurface_( surf:Byte Ptr, clear_verts:Int, clear_tris:Int )="ClearSurface"
	Function ClearTextureFilters_()="ClearTextureFilters"
	Function ClearWorld_( entities:Int, brushes:Int, textures:Int )="ClearWorld"
	Function CollisionEntity_:Byte Ptr( ent:Byte Ptr, index:Int )="CollisionEntity"
	Function Collisions_( src_no:Int, dest_no:Int, method_no:Int, response_no:Int )="Collisions"
	Function CollisionNX_:Float( ent:Byte Ptr, index:Int )="CollisionNX"
	Function CollisionNY_:Float( ent:Byte Ptr, index:Int )="CollisionNY"
	Function CollisionNZ_:Float( ent:Byte Ptr, index:Int )="CollisionNZ"
	Function CollisionSurface_:Byte Ptr( ent:Byte Ptr, index:Int )="CollisionSurface"
	Function CollisionTime_:Float( ent:Byte Ptr, index:Int )="CollisionTime"
	Function CollisionTriangle_:Int( ent:Byte Ptr, index:Int )="CollisionTriangle"
	Function CollisionX_:Float( ent:Byte Ptr, index:Int )="CollisionX"
	Function CollisionY_:Float( ent:Byte Ptr, index:Int )="CollisionY"
	Function CollisionZ_:Float( ent:Byte Ptr, index:Int )="CollisionZ"
	Function CountChildren_:Int( ent:Byte Ptr )="CountChildren"
	Function CountCollisions_:Int( ent:Byte Ptr )="CountCollisions"
	Function CopyEntity_:Byte Ptr( ent:Byte Ptr, parent:Byte Ptr )="CopyEntity"
	Function CopyMesh_:Byte Ptr( mesh:Byte Ptr, parent:Byte Ptr )="CopyMesh"
	Function CountSurfaces_:Int( mesh:Byte Ptr )="CountSurfaces"
	Function CountTriangles_:Int( surf:Byte Ptr )="CountTriangles"
	Function CountVertices_:Int( surf:Byte Ptr )="CountVertices"
	Function CreateBrush_:Byte Ptr( r:Float, g:Float, b:Float )="CreateBrush"
	Function CreateCamera_:Byte Ptr( parent:Byte Ptr )="CreateCamera"
	Function CreateCone_:Byte Ptr( segments:Int, solid:Int, parent:Byte Ptr )="CreateCone"
	Function CreateCylinder_:Byte Ptr( segments:Int, solid:Int, parent:Byte Ptr )="CreateCylinder"
	Function CreateCube_:Byte Ptr( parent:Byte Ptr )="CreateCube"
	Function CreateGeosphere_:Byte Ptr( size:Int, parent:Byte Ptr )="CreateGeosphere"
	Function CreateMesh_:Byte Ptr( parent:Byte Ptr )="CreateMesh"
	Function CreateLight_:Byte Ptr( light_type:Int, parent:Byte Ptr )="CreateLight"
	Function CreatePivot_:Byte Ptr( parent:Byte Ptr )="CreatePivot"
	Function CreatePlane_:Byte Ptr( divisions:Int, parent:Byte Ptr )="CreatePlane"
	Function CreateQuad_:Byte Ptr( parent:Byte Ptr )="CreateQuad"
	Function CreateShadow_:Byte Ptr( parent:Byte Ptr, Static:Int )="CreateShadow"
	Function CreateSphere_:Byte Ptr( segments:Int, parent:Byte Ptr )="CreateSphere"
	Function CreateSprite_:Byte Ptr( parent:Byte Ptr )="CreateSprite"
	Function CreateSurface_:Byte Ptr( mesh:Byte Ptr, brush:Byte Ptr )="CreateSurface"
	Function CreateStencil_:Byte Ptr()="CreateStencil"
	Function CreateTerrain_:Byte Ptr( size:Int, parent:Byte Ptr )="CreateTerrain"
	Function CreateTexture_:Byte Ptr( width:Int, height:Int, flags:Int, frames:Int )="CreateTexture"
	Function CreateVoxelSprite_:Byte Ptr( slices:Int, parent:Byte Ptr )="CreateVoxelSprite"
	Function DeltaPitch_:Float( ent1:Byte Ptr, ent2:Byte Ptr )="DeltaPitch"
	Function DeltaYaw_:Float( ent1:Byte Ptr, ent2:Byte Ptr )="DeltaYaw"
	Function EntityAlpha_( ent:Byte Ptr, alpha:Float )="EntityAlpha"
	Function EntityAutoFade_( ent:Byte Ptr, near:Float, far:Float )="EntityAutoFade"
	Function EntityBlend_( ent:Byte Ptr, blend:Int )="EntityBlend"
	Function EntityBox_( ent:Byte Ptr, x:Float, y:Float, z:Float, w:Float, h:Float, d:Float )="EntityBox"
	Function EntityClass_:Byte Ptr( ent:Byte Ptr )="EntityClass"
	Function EntityCollided_:Byte Ptr( ent:Byte Ptr, type_no:Int )="EntityCollided"
	Function EntityColor_( ent:Byte Ptr, red:Float, green:Float, blue:Float )="EntityColor"
	Function EntityDistance_:Float( ent1:Byte Ptr, ent2:Byte Ptr )="EntityDistance"
	Function EntityFX_( ent:Byte Ptr, fx:Int )="EntityFX"
	Function EntityInView_:Int( ent:Byte Ptr, cam:Byte Ptr )="EntityInView"
	Function EntityName_:Byte Ptr( ent:Byte Ptr )="EntityName"
	Function EntityOrder_( ent:Byte Ptr, order:Int )="EntityOrder"
	Function EntityParent_( ent:Byte Ptr, parent_ent:Byte Ptr, glob:Int )="EntityParent"
	Function EntityPick_:Byte Ptr( ent:Byte Ptr, Range:Float )="EntityPick"
	Function EntityPickMode_( ent:Byte Ptr, pick_mode:Int, obscurer:Int )="EntityPickMode"
	Function EntityPitch_:Float( ent:Byte Ptr, glob:Int )="EntityPitch"
	Function EntityRadius_( ent:Byte Ptr, radius_x:Float, radius_y:Float )="EntityRadius"
	Function EntityRoll_:Float( ent:Byte Ptr, glob:Int )="EntityRoll"
	Function EntityShininess_( ent:Byte Ptr, shine:Float )="EntityShininess"
	Function EntityTexture_( ent:Byte Ptr, tex:Byte Ptr, frame:Int, index:Int )="EntityTexture"
	Function EntityType_( ent:Byte Ptr, type_no:Int, recursive:Int )="EntityType"
	Function EntityVisible_:Int( src_ent:Byte Ptr, dest_ent:Byte Ptr )="EntityVisible"
	Function EntityX_:Float( ent:Byte Ptr, glob:Int )="EntityX"
	Function EntityY_:Float( ent:Byte Ptr, glob:Int )="EntityY"
	Function EntityYaw_:Float( ent:Byte Ptr, glob:Int )="EntityYaw"
	Function EntityZ_:Float( ent:Byte Ptr, glob:Int )="EntityZ"
	Function ExtractAnimSeq_:Int( ent:Byte Ptr, first_frame:Int, last_frame:Int, seq:Int )="ExtractAnimSeq"
	Function FindChild_:Byte Ptr( ent:Byte Ptr, child_name:Byte Ptr )="FindChild"
	Function FindSurface_:Byte Ptr( mesh:Byte Ptr, brush:Byte Ptr )="FindSurface"
	Function FitMesh_( mesh:Byte Ptr, x:Float, y:Float, z:Float, width:Float, height:Float, depth:Float, uniform:Int )="FitMesh"
	Function FlipMesh_( mesh:Byte Ptr )="FlipMesh"
	Function FreeBrush_( brush:Byte Ptr )="FreeBrush"
	Function FreeEntity_( ent:Byte Ptr )="FreeEntity"
	Function FreeShadow_( shad:Byte Ptr )="FreeShadow"
	Function FreeTexture_( tex:Byte Ptr )="FreeTexture"
	Function GeosphereHeight_( geo:Byte Ptr, h:Float )="GeosphereHeight"
	Function GetBrushTexture_:Byte Ptr( brush:Byte Ptr, index:Int )="GetBrushTexture"
	Function GetChild_:Byte Ptr( ent:Byte Ptr, child_no:Int )="GetChild"
	Function GetEntityBrush_:Byte Ptr( ent:Byte Ptr )="GetEntityBrush"
	Function GetEntityType_:Int( ent:Byte Ptr )="GetEntityType"
	Function GetMatElement_:Float( ent:Byte Ptr, row:Int, col:Int )="GetMatElement"
	Function GetParentEntity_:Byte Ptr( ent:Byte Ptr )="GetParentEntity"
	Function GetSurface_:Byte Ptr( mesh:Byte Ptr, surf_no:Int )="GetSurface"
	Function GetSurfaceBrush_:Byte Ptr( surf:Byte Ptr )	="GetSurfaceBrush"
	Function Graphics3D_( width:Int, height:Int, depth:Int, Mode:Int, rate:Int )="Graphics3D"
	Function GraphicsResize_( width:Int, height:Int )="GraphicsResize"
	Function HandleSprite_( sprite:Byte Ptr, h_x:Float, h_y:Float )="HandleSprite"
	Function HideEntity_( ent:Byte Ptr )="HideEntity"
	Function LightColor_( light:Byte Ptr, red:Float, green:Float, blue:Float )="LightColor"
	Function LightConeAngles_( light:Byte Ptr, inner_ang:Float, outer_ang:Float )="LightConeAngles"
	Function LightRange_( light:Byte Ptr, Range:Float )="LightRange"
	Function LinePick_:Byte Ptr( x:Float, y:Float, z:Float, dx:Float, dy:Float, dz:Float, radius:Float )="LinePick"
	Function LoadAnimMesh_:Byte Ptr( file:Byte Ptr, parent:Byte Ptr )="LoadAnimMesh"
	Function LoadAnimTexture_:Byte Ptr( file:Byte Ptr, flags:Int, frame_width:Int, frame_height:Int, first_frame:Int, frame_count:Int )="LoadAnimTexture"
	Function LoadBrush_:Byte Ptr( file:Byte Ptr, flags:Int, u_scale:Float, v_scale:Float )="LoadBrush"
	Function LoadGeosphere_:Byte Ptr( file:Byte Ptr, parent:Byte Ptr )="LoadGeosphere"
	Function LoadMesh_:Byte Ptr( file:Byte Ptr, parent:Byte Ptr )="LoadMesh"
	Function LoadTerrain_:Byte Ptr( file:Byte Ptr, parent:Byte Ptr )="LoadTerrain"
	Function LoadTexture_:Byte Ptr( file:Byte Ptr, flags:Int )="LoadTexture"
	Function LoadSprite_:Byte Ptr( tex_file:Byte Ptr, tex_flag:Int, parent:Byte Ptr )="LoadSprite"
	Function MeshCSG_:Byte Ptr( m1:Byte Ptr, m2:Byte Ptr, method_no:Int )="MeshCSG"
	Function MeshDepth_:Float( mesh:Byte Ptr )="MeshDepth"
	Function MeshesIntersect_:Int( mesh1:Byte Ptr, mesh2:Byte Ptr )="MeshesIntersect"
	Function MeshHeight_:Float( mesh:Byte Ptr )="MeshHeight"
	Function MeshWidth_:Float( mesh:Byte Ptr )="MeshWidth"
	Function ModifyGeosphere_( geo:Byte Ptr, x:Int, z:Int, new_height:Float )="ModifyGeosphere"
	Function ModifyTerrain_( terr:Byte Ptr, x:Int, z:Int, new_height:Float )="ModifyTerrain"
	Function MoveEntity_( ent:Byte Ptr, x:Float, y:Float, z:Float )="MoveEntity"
	Function NameEntity_( ent:Byte Ptr, name:Byte Ptr )="NameEntity"
	Function PaintEntity_( ent:Byte Ptr, brush:Byte Ptr )="PaintEntity"
	Function PaintMesh_( mesh:Byte Ptr, brush:Byte Ptr )="PaintMesh"
	Function PaintSurface_( surf:Byte Ptr, brush:Byte Ptr )="PaintSurface"
	Function PickedEntity_:Byte Ptr()="PickedEntity"
	Function PickedNX_:Float()="PickedNX"
	Function PickedNY_:Float()="PickedNY"
	Function PickedNZ_:Float()="PickedNZ"
	Function PickedSurface_:Byte Ptr()="PickedSurface"
	Function PickedTime_:Float()="PickedTime"
	Function PickedTriangle_:Int()="PickedTriangle"
	Function PickedX_:Float()="PickedX"
	Function PickedY_:Float()="PickedY"
	Function PickedZ_:Float()="PickedZ"
	Function PointEntity_( ent:Byte Ptr, target_ent:Byte Ptr, roll:Float )="PointEntity"
	Function PositionEntity_( ent:Byte Ptr, x:Float, y:Float, z:Float, glob:Int )="PositionEntity"
	Function PositionMesh_( mesh:Byte Ptr, px:Float, py:Float, pz:Float )="PositionMesh"
	Function PositionTexture_( tex:Byte Ptr, u_pos:Float, v_pos:Float )="PositionTexture"
	Function ProjectedX_:Float()="ProjectedX"
	Function ProjectedY_:Float()="ProjectedY"
	Function ProjectedZ_:Float()="ProjectedZ"
	Function RenderWorld_()="RenderWorld"
	Function RepeatMesh_:Byte Ptr( mesh:Byte Ptr, parent:Byte Ptr )="RepeatMesh"
	Function ResetEntity_( ent:Byte Ptr )="ResetEntity"
	Function RotateEntity_( ent:Byte Ptr, x:Float, y:Float, z:Float, glob:Int )="RotateEntity"
	Function RotateMesh_( mesh:Byte Ptr, pitch:Float, yaw:Float, roll:Float )="RotateMesh"
	Function RotateSprite_( sprite:Byte Ptr, ang:Float )="RotateSprite"
	Function RotateTexture_( tex:Byte Ptr, ang:Float )="RotateTexture"
	Function ScaleEntity_( ent:Byte Ptr, x:Float, y:Float, z:Float, glob:Int )="ScaleEntity"
	Function ScaleMesh_( mesh:Byte Ptr, sx:Float, sy:Float, sz:Float )="ScaleMesh"
	Function ScaleSprite_( sprite:Byte Ptr, s_x:Float, s_y:Float )="ScaleSprite"
	Function ScaleTexture_( tex:Byte Ptr, u_scale:Float, v_scale:Float )="ScaleTexture"
	Function SetAnimTime_( ent:Byte Ptr, time:Float, seq:Int )="SetAnimTime"
	Function SetCubeFace_( tex:Byte Ptr, face:Int )="SetCubeFace"
	Function SetCubeMode_( tex:Byte Ptr, Mode:Int )="SetCubeMode"
	Function ShowEntity_( ent:Byte Ptr )="ShowEntity"
	Function SpriteViewMode_( sprite:Byte Ptr, Mode:Int )="SpriteViewMode"
	Function StencilAlpha_( stencil:Byte Ptr, a:Float )="StencilAlpha"
	Function StencilClsColor_( stencil:Byte Ptr, r:Float, g:Float, b:Float )="StencilClsColor"
	Function StencilClsMode_( stencil:Byte Ptr, cls_depth:Int, cls_zbuffer:Int )="StencilClsMode"
	Function StencilMesh_( stencil:Byte Ptr, mesh:Byte Ptr, Mode:Int )="StencilMesh"
	Function StencilMode_( stencil:Byte Ptr, m:Int, o:Int )="StencilMode"
	Function TerrainHeight_:Float( terr:Byte Ptr, x:Int, z:Int )="TerrainHeight"
	Function TerrainX_:Float( terr:Byte Ptr, x:Float, y:Float, z:Float )="TerrainX"
	Function TerrainY_:Float( terr:Byte Ptr, x:Float, y:Float, z:Float )="TerrainY"
	Function TerrainZ_:Float( terr:Byte Ptr, x:Float, y:Float, z:Float )="TerrainZ"
	Function TextureBlend_( tex:Byte Ptr, blend:Int )="TextureBlend"
	Function TextureCoords_( tex:Byte Ptr, coords:Int )="TextureCoords"
	Function TextureHeight_:Int( tex:Byte Ptr )="TextureHeight"
	Function TextureFilter_( match_text:Byte Ptr, flags:Int )="TextureFilter"
	Function TextureName_:Byte Ptr( tex:Byte Ptr )="TextureName"
	Function TextureWidth_:Int( tex:Byte Ptr )="TextureWidth"
	Function TFormedX_:Float()="TFormedX"
	Function TFormedY_:Float()="TFormedY"
	Function TFormedZ_:Float()="TFormedZ"
	Function TFormNormal_( x:Float, y:Float, z:Float, src_ent:Byte Ptr, dest_ent:Byte Ptr )="TFormNormal"
	Function TFormPoint_( x:Float, y:Float, z:Float, src_ent:Byte Ptr, dest_ent:Byte Ptr )="TFormPoint"
	Function TFormVector_( x:Float, y:Float, z:Float, src_ent:Byte Ptr, dest_ent:Byte Ptr )="TFormVector"
	Function TranslateEntity_( ent:Byte Ptr, x:Float, y:Float, z:Float, glob:Int )="TranslateEntity"
	Function TriangleVertex_:Int( surf:Byte Ptr, tri_no:Int, corner:Int )="TriangleVertex"
	Function TurnEntity_( ent:Byte Ptr, x:Float, y:Float, z:Float, glob:Int )="TurnEntity"
	Function UpdateNormals_( mesh:Byte Ptr )="UpdateNormals"
	Function UpdateTexCoords_( surf:Byte Ptr )="UpdateTexCoords"
	Function UpdateWorld_( anim_speed:Float )="UpdateWorld"
	Function UseStencil_( stencil:Byte Ptr )="UseStencil"
	Function VectorPitch_:Float( vx:Float, vy:Float, vz:Float )="VectorPitch"
	Function VectorYaw_:Float( vx:Float, vy:Float, vz:Float )="VectorYaw"
	Function VertexAlpha_:Float( surf:Byte Ptr, vid:Int )="VertexAlpha"
	Function VertexBlue_:Float( surf:Byte Ptr, vid:Int )="VertexBlue"
	Function VertexColor_( surf:Byte Ptr, vid:Int, r:Float, g:Float, b:Float, a:Float )="VertexColor"
	Function VertexCoords_( surf:Byte Ptr, vid:Int, x:Float, y:Float, z:Float )="VertexCoords"
	Function VertexGreen_:Float( surf:Byte Ptr, vid:Int )="VertexGreen"
	Function VertexNormal_( surf:Byte Ptr, vid:Int, nx:Float, ny:Float, nz:Float )="VertexNormal"
	Function VertexNX_:Float( surf:Byte Ptr, vid:Int )="VertexNX"
	Function VertexNY_:Float( surf:Byte Ptr, vid:Int )="VertexNY"
	Function VertexNZ_:Float( surf:Byte Ptr, vid:Int )="VertexNZ"
	Function VertexRed_:Float( surf:Byte Ptr, vid:Int )="VertexRed"
	Function VertexTexCoords_( surf:Byte Ptr, vid:Int, u:Float, v:Float, w:Float, coord_set:Int )="VertexTexCoords"
	Function VertexU_:Float( surf:Byte Ptr, vid:Int, coord_set:Int )="VertexU"
	Function VertexV_:Float( surf:Byte Ptr, vid:Int, coord_set:Int )="VertexV"
	Function VertexW_:Float( surf:Byte Ptr, vid:Int, coord_set:Int )="VertexW"
	Function VertexX_:Float( surf:Byte Ptr, vid:Int )="VertexX"
	Function VertexY_:Float( surf:Byte Ptr, vid:Int )="VertexY"
	Function VertexZ_:Float( surf:Byte Ptr, vid:Int )="VertexZ"
	Function VoxelSpriteMaterial_( voxelspr:Byte Ptr, mat:Byte Ptr )="VoxelSpriteMaterial"
	Function Wireframe_( enable:Int )="Wireframe"
' ***extras***
	Function EntityScaleX_:Float( ent:Byte Ptr, glob:Int )="EntityScaleX"
	Function EntityScaleY_:Float( ent:Byte Ptr, glob:Int )="EntityScaleY"
	Function EntityScaleZ_:Float( ent:Byte Ptr, glob:Int )="EntityScaleZ"
	Function LoadShader_:Byte Ptr( ShaderName:Byte Ptr, VshaderFileName:Byte Ptr, FshaderFileName:Byte Ptr )="LoadShader"
	Function CreateShader_:Byte Ptr( ShaderName:Byte Ptr, VshaderString:Byte Ptr, FshaderString:Byte Ptr )="CreateShader"
	Function ShadeSurface_( surf:Byte Ptr, material:Byte Ptr )="ShadeSurface"
	Function ShadeMesh_( mesh:Byte Ptr, material:Byte Ptr )="ShadeMesh"
	Function ShadeEntity_( ent:Byte Ptr, material:Byte Ptr )="ShadeEntity"
	Function ShaderTexture_( material:Byte Ptr, tex:Byte Ptr, name:Byte Ptr, index:Int )="ShaderTexture"
	Function SetFloat_( material:Byte Ptr, name:Byte Ptr, v1:Float )="SetFloat"
	Function SetFloat2_( material:Byte Ptr, name:Byte Ptr, v1:Float, v2:Float )="SetFloat2"
	Function SetFloat3_( material:Byte Ptr, name:Byte Ptr, v1:Float, v2:Float, v3:Float )="SetFloat3"
	Function SetFloat4_( material:Byte Ptr, name:Byte Ptr, v1:Float, v2:Float, v3:Float, v4:Float )="SetFloat4"
	Function UseFloat_( material:Byte Ptr, name:Byte Ptr, v1:Float Ptr )="UseFloat"
	Function UseFloat2_( material:Byte Ptr, name:Byte Ptr, v1:Float Ptr, v2:Float Ptr )="UseFloat2"
	Function UseFloat3_( material:Byte Ptr, name:Byte Ptr, v1:Float Ptr, v2:Float Ptr, v3:Float Ptr )="UseFloat3"
	Function UseFloat4_( material:Byte Ptr, name:Byte Ptr, v1:Float Ptr, v2:Float Ptr, v3:Float Ptr, v4:Float Ptr )="UseFloat4"
	Function SetInteger_( material:Byte Ptr, name:Byte Ptr, v1:Int )="SetInteger"
	Function SetInteger2_( material:Byte Ptr, name:Byte Ptr, v1:Int, v2:Int )="SetInteger2"
	Function SetInteger3_( material:Byte Ptr, name:Byte Ptr, v1:Int, v2:Int, v3:Int )="SetInteger3"
	Function SetInteger4_( material:Byte Ptr, name:Byte Ptr, v1:Int, v2:Int, v3:Int, v4:Int )="SetInteger4"
	Function UseInteger_( material:Byte Ptr, name:Byte Ptr, v1:Int Ptr )="UseInteger"
	Function UseInteger2_( material:Byte Ptr, name:Byte Ptr, v1:Int Ptr, v2:Int Ptr )="UseInteger2"
	Function UseInteger3_( material:Byte Ptr, name:Byte Ptr, v1:Int Ptr, v2:Int Ptr, v3:Int Ptr )="UseInteger3"
	Function UseInteger4_( material:Byte Ptr, name:Byte Ptr, v1:Int Ptr, v2:Int Ptr, v3:Int Ptr, v4:Int Ptr )="UseInteger4"
	Function UseSurface_( material:Byte Ptr, name:Byte Ptr, surf:Byte Ptr, vbo:Int )="UseSurface"
	Function UseMatrix_( material:Byte Ptr, name:Byte Ptr, Mode:Int )="UseMatrix"
	Function LoadMaterial_:Byte Ptr( filename:Byte Ptr, flags:Int, frame_width:Int, frame_height:Int, first_frame:Int, frame_count:Int )="LoadMaterial"
	Function ShaderMaterial_( material:Byte Ptr, tex:Byte Ptr, name:Byte Ptr, index:Int )="ShaderMaterial"
	Function CreateOcTree_:Byte Ptr( w:Float, h:Float, d:Float, parent_ent:Byte Ptr )="CreateOcTree"
	Function OctreeBlock_( octree:Byte Ptr, mesh:Byte Ptr, level:Int, X:Float, Y:Float, Z:Float, Near:Float, Far:Float )="OctreeBlock"
	Function OctreeMesh_( octree:Byte Ptr, mesh:Byte Ptr, level:Int, X:Float, Y:Float, Z:Float, Near:Float, Far:Float )="OctreeMesh"

End Extern

Private

'Global libDirs$[] = ["" , CurrentDir()+"/" , "BlitzMax/mod/angros.mod/openb3d.mod/"] ' install location
Global hLib:Int
Global globals:TGlobal=New TGlobal

Public



' Blitz2D functions
' -----------------


Rem
bbdoc: Begin using Max2D functions.
End Rem
Function BeginMax2D()

	' by Oddball
	glPopClientAttrib()
	glPopAttrib()
	glMatrixMode(GL_MODELVIEW)
	glPopMatrix()
	glMatrixMode(GL_PROJECTION)
	glPopMatrix()
	glMatrixMode(GL_TEXTURE)
	glPopMatrix()
	glMatrixMode(GL_COLOR)
	glPopMatrix()

End Function

Rem
bbdoc: End using Max2D functions.
End Rem
Function EndMax2D()

	' save the Max2D settings for later - by Oddball
	glPushAttrib(GL_ALL_ATTRIB_BITS)
	glPushClientAttrib(GL_CLIENT_ALL_ATTRIB_BITS)
	glMatrixMode(GL_MODELVIEW)
	glPushMatrix()
	glMatrixMode(GL_PROJECTION)
	glPushMatrix()
	glMatrixMode(GL_TEXTURE)
	glPushMatrix()
	glMatrixMode(GL_COLOR)
	glPushMatrix()
	
	' Enable States
	glEnable(GL_LIGHTING)
	glEnable(GL_DEPTH_TEST)
	glEnable(GL_FOG)
	glEnable(GL_CULL_FACE)
	glEnable(GL_SCISSOR_TEST)
	
	glEnable(GL_NORMALIZE)
	
	glEnableClientState(GL_VERTEX_ARRAY)
	glEnableClientState(GL_COLOR_ARRAY)
	glEnableClientState(GL_NORMAL_ARRAY)
	
	glDisable(GL_TEXTURE_2D)
	
	glLightModeli(GL_LIGHT_MODEL_COLOR_CONTROL,GL_SEPARATE_SPECULAR_COLOR)
	glLightModeli(GL_LIGHT_MODEL_LOCAL_VIEWER,GL_TRUE)
	
	glClearDepth(1.0)
	glDepthFunc(GL_LEQUAL)
	glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST)
	
	glAlphaFunc(GL_GEQUAL,0.5)
	
End Function


' Wrapper object types
' --------------------

Type TGlobal

	Global brush:TBrush=New TBrush
	Global cam:TCamera=New TCamera
	Global ent:TEntity=New TEntity
	Global geo:TGeosphere=New TGeosphere
	Global light:TLight=New TLight
	Global mat:TMaterial=New TMaterial
	Global material:TShader=New TShader
	Global mesh:TMesh=New TMesh
	Global octree:TOcTree=New TOcTree
	Global piv:TPivot=New TPivot
	Global shad:TShadowObject=New TShadowObject
	Global sprite:TSprite=New TSprite
	Global stencil:TStencil=New TStencil
	Global terr:TTerrain=New TTerrain
	Global tex:TTexture=New TTexture
	Global voxelspr:TVoxelSprite=New TVoxelSprite

End Type

Type TBrush

	Global brush_list:TList=CreateList()

	Field instance:Byte Ptr
	Field last_instance:Byte Ptr
	Field last_brush:TBrush
	
	Method NewBrush:TBrush()
	
		Local brush:TBrush=New TBrush
		ListAddLast( brush_list, brush )
		Return brush
		
	End Method
	
	Method DeleteBrush()
	
		ListRemove( brush_list, Self )
	
	End Method
	
	Method GetBrush:TBrush( instance:Byte Ptr )
	
		If last_instance=instance Then Return last_brush
		
		For Local brush:TBrush=EachIn brush_list
			If brush.instance=instance
				last_instance=instance
				last_brush=brush
				Return brush
			EndIf
		Next
		Return Null
	
	End Method
	
	Method BrushExists:Byte Ptr( brush:TBrush )
	
		If brush=Null
			Return Null
		Else
			Return brush.instance
		EndIf
	
	End Method
	
End Type

Type TCamera Extends TEntity

	Method NewCamera:TCamera()
	
		Local cam:TCamera=New TCamera
		ListAddLast( entity_list, cam )
		Return cam
		
	End Method
	
End Type

Type TEntity

	Global entity_list:TList=CreateList()

	Field instance:Byte Ptr
	Field last_instance:Byte Ptr
	Field last_ent:TEntity
	
	Method NewEntity:TEntity()

		Local ent:TEntity=New TEntity
		ListAddLast( entity_list, ent )
		Return ent
		
	End Method
	
	Method DeleteEntity()
	
		ListRemove( entity_list, Self )
	
	End Method
	
	Method GetEntity:TEntity( instance:Byte Ptr )
	
		If last_instance=instance Then Return last_ent
		
		For Local ent:TEntity=EachIn entity_list
			If ent.instance=instance
				last_instance=instance
				last_ent=ent
				Return ent
			EndIf
		Next
		Return Null
	
	End Method
	
	Function EntityExists:Byte Ptr( ent:TEntity )
	
		If ent=Null
			Return Null
		Else
			Return ent.instance
		EndIf
	
	End Function
	
	' Recursively counts all children of an entity.
	Function CountAllChildren:Int( ent:TEntity, no_children:Int=0 )

		Local children%=CountChildren_( ent.instance )
		
		For Local ent2:Int=1 To children
			no_children=no_children+1
			no_children=CountAllChildren( GetChild( ent, ent2 ), no_children)
		Next
		Return no_children
		
	End Function
	
	' Returns the specified child entity of a parent entity.
	Method GetChildFromAll:TEntity( child_no:Int, no_children:Int Var, ent:TEntity=Null )

		If ent=Null Then ent=Self
		Local ent3:TEntity=Null
		Local children%= CountChildren_( ent.instance )
		
		For Local ent2:Int=1 To children
			no_children=no_children+1
			If no_children=child_no Then Return GetChild( ent, ent2 )
			
			If ent3=Null
				ent3=GetChildFromAll( child_no, no_children, GetChild( ent, ent2 ) )
			EndIf
		Next
		Return ent3
		
	End Method
	
End Type

Type TGeosphere Extends TTerrain

	Method NewGeosphere:TGeosphere()
	
		Local geo:TGeosphere=New TGeosphere
		ListAddLast( entity_list, geo )
		Return geo
		
	End Method
	
End Type

Type TLight Extends TEntity

	Method NewLight:TLight()
	
		Local light:TLight=New TLight
		ListAddLast( entity_list, light )
		Return light
		
	End Method
	
End Type

Type TMaterial Extends TTexture

	Method NewMaterial:TMaterial()
	
		Local mat:TMaterial=New TMaterial
		ListAddLast( tex_list, mat )
		Return mat
		
	End Method
	
End Type

Type TMesh Extends TEntity

	Global surf_list:TList=CreateList()
	
	Field last_surf_instance:Byte Ptr
	Field last_surf:TSurface
	
	Method NewMesh:TMesh()
	
		Local mesh:TMesh=New TMesh
		ListAddLast( entity_list, mesh )
		Return mesh
		
	End Method
	
	Method NewSurface:TSurface()
	
		Local surf:TSurface=New TSurface
		ListAddLast( surf_list, surf )
		Return surf
		
	End Method
	
	Method GetSurface:TSurface( instance:Byte Ptr )
	
		If last_surf_instance=instance Then Return last_surf
		
		For Local surf:TSurface=EachIn surf_list
			If surf.instance=instance
				last_surf_instance=instance
				last_surf=surf
				Return surf
			EndIf
		Next
		Return Null
	
	End Method
	
End Type

Type TOcTree Extends TTerrain

	Method NewOcTree:TOcTree()
	
		Local octree:TOcTree=New TOcTree
		ListAddLast( entity_list, octree )
		Return octree
		
	End Method
	
End Type

Type TPivot Extends TEntity

	Method NewPivot:TPivot()
	
		Local piv:TPivot=New TPivot
		ListAddLast( entity_list, piv )
		Return piv
		
	End Method
	
End Type

Type TShader

	Field instance:Byte Ptr
	
	Method NewShader:TShader()
	
		Local material:TShader=New TShader
		Return material
		
	End Method

End Type

Type TShadowObject

	Global shad_list:TList=CreateList()

	Field instance:Byte Ptr
	
	Method NewShadowObject:TShadowObject()
	
		Local shad:TShadowObject=New TShadowObject
		ListAddLast( shad_list, shad )
		Return shad
		
	End Method
	
	Method DeleteShadowObject()
	
		ListRemove( shad_list, Self )
	
	End Method
	
End Type

Type TSprite Extends TMesh

	Method NewSprite:TSprite()
	
		Local sprite:TSprite=New TSprite
		ListAddLast( entity_list, sprite )
		Return sprite
		
	End Method
	
End Type

Type TStencil

	Field instance:Byte Ptr
	
	Method NewStencil:TStencil()
	
		Local stencil:TStencil=New TStencil
		Return stencil
		
	End Method
	
End Type

Type TSurface

	Field instance:Byte Ptr
	
End Type

Type TTerrain Extends TEntity

	Method NewTerrain:TTerrain()
	
		Local terr:TTerrain=New TTerrain
		ListAddLast( entity_list, terr )
		Return terr
		
	End Method
	
End Type

Type TTexture

	Global tex_list:TList=CreateList()

	Field instance:Byte Ptr
	Field last_instance:Byte Ptr
	Field last_tex:TTexture
	
	Method NewTexture:TTexture()
	
		Local tex:TTexture=New TTexture
		ListAddLast( tex_list, tex )
		Return tex
		
	End Method
	
	Method DeleteTexture()
	
		ListRemove( tex_list, Self )
	
	End Method
	
	Method GetTexture:TTexture( instance:Byte Ptr )
	
		If last_instance=instance Then Return last_tex
		
		For Local tex:TTexture=EachIn tex_list
			If tex.instance=instance
				last_instance=instance
				last_tex=tex
				Return tex
			EndIf
		Next
		Return Null
	
	End Method
	
End Type

Type TVoxelSprite Extends TMesh

	Method NewVoxelSprite:TVoxelSprite()
	
		Local voxelspr:TVoxelSprite=New TVoxelSprite
		ListAddLast( entity_list, voxelspr )
		Return voxelspr
		
	End Method
	
End Type


' Wrapped functions
' -----------------

Include "functions.bmx"

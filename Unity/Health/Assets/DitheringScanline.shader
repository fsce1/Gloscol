Author: fsce1 <jamieserlin@gmail.com>  2022-12-05 22:09:17
Committer: fsce1 <jamieserlin@gmail.com>  2022-12-05 22:09:17
Parent: e1672c4d39926bd2db8da05248663f09903271f9 (2nd pistol brace)
Branch: remotes/origin/URP
Follows: 
Precedes: 

    Initial URP Checkout

------------------------- Blender/Tex/NodeGroups.blend -------------------------
index 7b57b9a..aafd87b 100644
Binary files a/Blender/Tex/NodeGroups.blend and b/Blender/Tex/NodeGroups.blend differ

---------------------- Unity/Health/Assets/PostFX.prefab ----------------------
new file mode 100644
index 0000000..0d4e5b7
@@ -0,0 +1,50 @@
+%YAML 1.1
+%TAG !u! tag:unity3d.com,2011:
+--- !u!1 &7118591497622784381
+GameObject:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  serializedVersion: 6
+  m_Component:
+  - component: {fileID: 7118591497622784382}
+  - component: {fileID: 7118591497622784383}
+  m_Layer: 3
+  m_Name: PostFX
+  m_TagString: Untagged
+  m_Icon: {fileID: 0}
+  m_NavMeshLayer: 0
+  m_StaticEditorFlags: 0
+  m_IsActive: 1
+--- !u!4 &7118591497622784382
+Transform:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 7118591497622784381}
+  m_LocalRotation: {x: -0, y: -0, z: -0, w: 1}
+  m_LocalPosition: {x: 0, y: 0, z: 0}
+  m_LocalScale: {x: 1, y: 1, z: 1}
+  m_Children: []
+  m_Father: {fileID: 0}
+  m_RootOrder: 0
+  m_LocalEulerAnglesHint: {x: 0, y: 0, z: 0}
+--- !u!114 &7118591497622784383
+MonoBehaviour:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 7118591497622784381}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: 8b9a305e18de0c04dbd257a21cd47087, type: 3}
+  m_Name: 
+  m_EditorClassIdentifier: 
+  sharedProfile: {fileID: 11400000, guid: 56ca66d352163cb4fbfa9eabde5e20c5, type: 2}
+  isGlobal: 1
+  blendDistance: 0
+  weight: 1
+  priority: 0

-------------------- Unity/Health/Assets/PostFX.prefab.meta --------------------
new file mode 100644
index 0000000..ee862c3
@@ -0,0 +1,7 @@
+fileFormatVersion: 2
+guid: 1504a31bd6c4646499378f8904e21908
+PrefabImporter:
+  externalObjects: {}
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 

------------------------- Unity/Health/Assets/Rock.mat -------------------------
index ca157d3..1ad1c79 100644
@@ -1,5 +1,18 @@
 %YAML 1.1
 %TAG !u! tag:unity3d.com,2011:
+--- !u!114 &-6330070497399567604
+MonoBehaviour:
+  m_ObjectHideFlags: 11
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 0}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: d0353a89b1f911e48b9e16bdc9f2e058, type: 3}
+  m_Name: 
+  m_EditorClassIdentifier: 
+  version: 4
 --- !u!21 &2100000
 Material:
   serializedVersion: 6
@@ -8,7 +21,7 @@ Material:
   m_PrefabInstance: {fileID: 0}
   m_PrefabAsset: {fileID: 0}
   m_Name: Rock
-  m_Shader: {fileID: 46, guid: 0000000000000000f000000000000000, type: 0}
+  m_Shader: {fileID: 4800000, guid: 933532a4fcc9baf4fa0491de14d08ed7, type: 3}
   m_ShaderKeywords: _ALPHATEST_ON
   m_LightmapFlags: 4
   m_EnableInstancingVariants: 0
@@ -20,6 +33,10 @@ Material:
   m_SavedProperties:
     serializedVersion: 3
     m_TexEnvs:
+    - _BaseMap:
+        m_Texture: {fileID: 2800000, guid: 7b2722cd3fd6bb14d967c3d66060ada2, type: 3}
+        m_Scale: {x: 1, y: 1}
+        m_Offset: {x: 0, y: 0}
     - _BumpMap:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
@@ -56,12 +73,35 @@ Material:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
+    - _SpecGlossMap:
+        m_Texture: {fileID: 0}
+        m_Scale: {x: 1, y: 1}
+        m_Offset: {x: 0, y: 0}
+    - unity_Lightmaps:
+        m_Texture: {fileID: 0}
+        m_Scale: {x: 1, y: 1}
+        m_Offset: {x: 0, y: 0}
+    - unity_LightmapsInd:
+        m_Texture: {fileID: 0}
+        m_Scale: {x: 1, y: 1}
+        m_Offset: {x: 0, y: 0}
+    - unity_ShadowMasks:
+        m_Texture: {fileID: 0}
+        m_Scale: {x: 1, y: 1}
+        m_Offset: {x: 0, y: 0}
     m_Ints: []
     m_Floats:
+    - _AlphaClip: 1
+    - _Blend: 0
     - _BumpScale: 1
+    - _ClearCoatMask: 0
+    - _ClearCoatSmoothness: 0
+    - _Cull: 2
     - _Cutoff: 0.5
+    - _DetailAlbedoMapScale: 1
     - _DetailNormalMapScale: 1
     - _DstBlend: 0
+    - _EnvironmentReflections: 1
     - _GlossMapScale: 1
     - _Glossiness: 0.5
     - _GlossyReflections: 1
@@ -69,12 +109,19 @@ Material:
     - _Mode: 1
     - _OcclusionStrength: 1
     - _Parallax: 0.02
+    - _QueueOffset: 0
+    - _ReceiveShadows: 1
+    - _Smoothness: 0.5
     - _SmoothnessTextureChannel: 0
     - _SpecularHighlights: 1
     - _SrcBlend: 1
+    - _Surface: 0
     - _UVSec: 0
+    - _WorkflowMode: 1
     - _ZWrite: 1
     m_Colors:
+    - _BaseColor: {r: 1, g: 1, b: 1, a: 1}
     - _Color: {r: 1, g: 1, b: 1, a: 1}
     - _EmissionColor: {r: 0, g: 0, b: 0, a: 1}
+    - _SpecColor: {r: 0.2, g: 0.2, b: 0.2, a: 1}
   m_BuildTextureStacks: []

----------------- Unity/Health/Assets/Scenes/SampleScene.unity -----------------
index d99a68d..27c6e24 100644
@@ -9578,8 +9578,8 @@ GameObject:
   - component: {fileID: 519420030}
   - component: {fileID: 519420031}
   - component: {fileID: 519420029}
-  - component: {fileID: 519420034}
   - component: {fileID: 519420033}
+  - component: {fileID: 519420034}
   m_Layer: 0
   m_Name: Main Camera
   m_TagString: MainCamera
@@ -9665,12 +9665,42 @@ Transform:
   m_LocalScale: {x: 1, y: 1, z: 1}
   m_Children:
   - {fileID: 950953041}
-  - {fileID: 569536906}
-  - {fileID: 2083906489}
   m_Father: {fileID: 0}
   m_RootOrder: 2
   m_LocalEulerAnglesHint: {x: 0, y: 0, z: 0}
 --- !u!114 &519420033
+MonoBehaviour:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 519420028}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: a79441f348de89743a2939f4d699eac1, type: 3}
+  m_Name: 
+  m_EditorClassIdentifier: 
+  m_RenderShadows: 1
+  m_RequiresDepthTextureOption: 2
+  m_RequiresOpaqueTextureOption: 2
+  m_CameraType: 0
+  m_Cameras: []
+  m_RendererIndex: -1
+  m_VolumeLayerMask:
+    serializedVersion: 2
+    m_Bits: 1
+  m_VolumeTrigger: {fileID: 0}
+  m_RenderPostProcessing: 1
+  m_Antialiasing: 0
+  m_AntialiasingQuality: 2
+  m_StopNaN: 0
+  m_Dithering: 0
+  m_ClearDepth: 1
+  m_AllowXRRendering: 1
+  m_RequiresDepthTexture: 0
+  m_RequiresColorTexture: 0
+  m_Version: 2
+--- !u!114 &519420034
 MonoBehaviour:
   m_ObjectHideFlags: 0
   m_CorrespondingSourceObject: {fileID: 0}
@@ -9725,31 +9755,11 @@ MonoBehaviour:
       colorBlindnessStrength: 1
   m_Resources: {fileID: 11400000, guid: d82512f9c8e5d4a4d938b575d47f88d4, type: 2}
   m_ShowToolkit: 0
-  m_ShowCustomSorter: 0
+  m_ShowCustomSorter: 1
   breakBeforeColorGrading: 0
   m_BeforeTransparentBundles: []
   m_BeforeStackBundles: []
   m_AfterStackBundles: []
---- !u!114 &519420034
-MonoBehaviour:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  m_GameObject: {fileID: 519420028}
-  m_Enabled: 1
-  m_EditorHideFlags: 0
-  m_Script: {fileID: 11500000, guid: 6a160d838ff8b4b4693ac20007e008c7, type: 3}
-  m_Name: 
-  m_EditorClassIdentifier: 
-  m_AssetsPPU: 32
-  m_RefResolutionX: 640
-  m_RefResolutionY: 480
-  m_UpscaleRT: 1
-  m_PixelSnapping: 0
-  m_CropFrameX: 1
-  m_CropFrameY: 1
-  m_StretchFill: 1
 --- !u!1 &548898648
 GameObject:
   m_ObjectHideFlags: 0
@@ -9838,54 +9848,6 @@ SpriteRenderer:
   m_WasSpriteAssigned: 1
   m_MaskInteraction: 0
   m_SpriteSortPoint: 0
---- !u!1 &569536905
-GameObject:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  serializedVersion: 6
-  m_Component:
-  - component: {fileID: 569536906}
-  - component: {fileID: 569536907}
-  m_Layer: 3
-  m_Name: PostFX
-  m_TagString: Untagged
-  m_Icon: {fileID: 0}
-  m_NavMeshLayer: 0
-  m_StaticEditorFlags: 0
-  m_IsActive: 1
---- !u!4 &569536906
-Transform:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  m_GameObject: {fileID: 569536905}
-  m_LocalRotation: {x: -0, y: -0, z: -0, w: 1}
-  m_LocalPosition: {x: 0, y: 0, z: 0}
-  m_LocalScale: {x: 1, y: 1, z: 1}
-  m_Children: []
-  m_Father: {fileID: 519420032}
-  m_RootOrder: 1
-  m_LocalEulerAnglesHint: {x: 0, y: 0, z: 0}
---- !u!114 &569536907
-MonoBehaviour:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  m_GameObject: {fileID: 569536905}
-  m_Enabled: 1
-  m_EditorHideFlags: 0
-  m_Script: {fileID: 11500000, guid: 8b9a305e18de0c04dbd257a21cd47087, type: 3}
-  m_Name: 
-  m_EditorClassIdentifier: 
-  sharedProfile: {fileID: 11400000, guid: 56ca66d352163cb4fbfa9eabde5e20c5, type: 2}
-  isGlobal: 1
-  blendDistance: 0
-  weight: 1
-  priority: 0
 --- !u!1001 &680567913
 PrefabInstance:
   m_ObjectHideFlags: 0
@@ -11509,103 +11471,6 @@ Transform:
   m_CorrespondingSourceObject: {fileID: 7154388778215230783, guid: 25f140470ea17d6488381d05fcc8c380, type: 3}
   m_PrefabInstance: {fileID: 1932659859}
   m_PrefabAsset: {fileID: 0}
---- !u!1 &2083906488
-GameObject:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  serializedVersion: 6
-  m_Component:
-  - component: {fileID: 2083906489}
-  - component: {fileID: 2083906490}
-  - component: {fileID: 2083906491}
-  m_Layer: 0
-  m_Name: scanlines 1
-  m_TagString: Untagged
-  m_Icon: {fileID: 0}
-  m_NavMeshLayer: 0
-  m_StaticEditorFlags: 0
-  m_IsActive: 1
---- !u!4 &2083906489
-Transform:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  m_GameObject: {fileID: 2083906488}
-  m_LocalRotation: {x: -0, y: -0, z: -0, w: 1}
-  m_LocalPosition: {x: 0, y: 0.5, z: 5}
-  m_LocalScale: {x: 2.7974577, y: 2.7974577, z: 2.7974577}
-  m_Children: []
-  m_Father: {fileID: 519420032}
-  m_RootOrder: 2
-  m_LocalEulerAnglesHint: {x: 0, y: 0, z: 0}
---- !u!212 &2083906490
-SpriteRenderer:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  m_GameObject: {fileID: 2083906488}
-  m_Enabled: 1
-  m_CastShadows: 0
-  m_ReceiveShadows: 0
-  m_DynamicOccludee: 1
-  m_StaticShadowCaster: 0
-  m_MotionVectors: 1
-  m_LightProbeUsage: 1
-  m_ReflectionProbeUsage: 1
-  m_RayTracingMode: 0
-  m_RayTraceProcedural: 0
-  m_RenderingLayerMask: 1
-  m_RendererPriority: 0
-  m_Materials:
-  - {fileID: 10754, guid: 0000000000000000f000000000000000, type: 0}
-  m_StaticBatchInfo:
-    firstSubMesh: 0
-    subMeshCount: 0
-  m_StaticBatchRoot: {fileID: 0}
-  m_ProbeAnchor: {fileID: 0}
-  m_LightProbeVolumeOverride: {fileID: 0}
-  m_ScaleInLightmap: 1
-  m_ReceiveGI: 1
-  m_PreserveUVs: 0
-  m_IgnoreNormalsForChartDetection: 0
-  m_ImportantGI: 0
-  m_StitchLightmapSeams: 1
-  m_SelectedEditorRenderState: 0
-  m_MinimumChartSize: 4
-  m_AutoUVMaxDistance: 0.5
-  m_AutoUVMaxAngle: 89
-  m_LightmapParameters: {fileID: 0}
-  m_SortingLayerID: 0
-  m_SortingLayer: 0
-  m_SortingOrder: 0
-  m_Sprite: {fileID: 21300000, guid: 7b503d45ba80930429b7280927fcb33d, type: 3}
-  m_Color: {r: 1, g: 1, b: 1, a: 0.2901961}
-  m_FlipX: 0
-  m_FlipY: 0
-  m_DrawMode: 0
-  m_Size: {x: 19.2, y: 10.8}
-  m_AdaptiveModeThreshold: 0.5
-  m_SpriteTileMode: 0
-  m_WasSpriteAssigned: 1
-  m_MaskInteraction: 0
-  m_SpriteSortPoint: 0
---- !u!114 &2083906491
-MonoBehaviour:
-  m_ObjectHideFlags: 0
-  m_CorrespondingSourceObject: {fileID: 0}
-  m_PrefabInstance: {fileID: 0}
-  m_PrefabAsset: {fileID: 0}
-  m_GameObject: {fileID: 2083906488}
-  m_Enabled: 1
-  m_EditorHideFlags: 0
-  m_Script: {fileID: 11500000, guid: c0bef2354c165bc419e2aa6d7e712e3e, type: 3}
-  m_Name: 
-  m_EditorClassIdentifier: 
-  bounds: {x: -0.25, y: 0.25}
 --- !u!1 &2146049935
 GameObject:
   m_ObjectHideFlags: 0

------------------------- Unity/Health/Assets/URP.meta -------------------------
new file mode 100644
index 0000000..6c4ca10
@@ -0,0 +1,8 @@
+fileFormatVersion: 2
+guid: 46ec2b02e80605548b1b3c727be73093
+folderAsset: yes
+DefaultImporter:
+  externalObjects: {}
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 

----------------------- Unity/Health/Assets/URP/Blit.cs -----------------------
new file mode 100644
index 0000000..692fdc3
@@ -0,0 +1,119 @@
+using UnityEngine;
+using UnityEngine.Rendering;
+using UnityEngine.Rendering.Universal;
+
+// this was used on https://gamedevbill.com, but originally taken from https://cyangamedev.wordpress.com/2020/06/22/urp-post-processing/
+
+// Saved in Blit.cs
+public class Blit : ScriptableRendererFeature
+{
+
+    public class BlitPass : ScriptableRenderPass
+    {
+        public enum RenderTarget
+        {
+            Color,
+            RenderTexture,
+        }
+
+        public Material blitMaterial = null;
+        public int blitShaderPassIndex = 0;
+        public FilterMode filterMode { get; set; }
+
+        private RenderTargetIdentifier source { get; set; }
+        private RenderTargetHandle destination { get; set; }
+
+        RenderTargetHandle m_TemporaryColorTexture;
+        string m_ProfilerTag;
+
+        public BlitPass(RenderPassEvent renderPassEvent, Material blitMaterial, int blitShaderPassIndex, string tag)
+        {
+            this.renderPassEvent = renderPassEvent;
+            this.blitMaterial = blitMaterial;
+            this.blitShaderPassIndex = blitShaderPassIndex;
+            m_ProfilerTag = tag;
+            m_TemporaryColorTexture.Init("_TemporaryColorTexture");
+        }
+
+        public void Setup(RenderTargetIdentifier source, RenderTargetHandle destination)
+        {
+            this.source = source;
+            this.destination = destination;
+        }
+
+        public override void Execute(ScriptableRenderContext context, ref RenderingData renderingData)
+        {
+            CommandBuffer cmd = CommandBufferPool.Get(m_ProfilerTag);
+
+            RenderTextureDescriptor opaqueDesc = renderingData.cameraData.cameraTargetDescriptor;
+            opaqueDesc.depthBufferBits = 0;
+
+
+            // Can't read and write to same color target, use a TemporaryRT
+            if (destination == RenderTargetHandle.CameraTarget)
+            {
+                cmd.GetTemporaryRT(m_TemporaryColorTexture.id, opaqueDesc, filterMode);
+                Blit(cmd, source, m_TemporaryColorTexture.Identifier(), blitMaterial, blitShaderPassIndex);
+                Blit(cmd, m_TemporaryColorTexture.Identifier(), source);
+            }
+            else
+            {
+                Blit(cmd, source, destination.Identifier(), blitMaterial, blitShaderPassIndex);
+            }
+
+            context.ExecuteCommandBuffer(cmd);
+            CommandBufferPool.Release(cmd);
+        }
+
+        public override void FrameCleanup(CommandBuffer cmd)
+        {
+            if (destination == RenderTargetHandle.CameraTarget)
+                cmd.ReleaseTemporaryRT(m_TemporaryColorTexture.id);
+        }
+    }
+
+    [System.Serializable]
+    public class BlitSettings
+    {
+        public RenderPassEvent Event = RenderPassEvent.AfterRenderingOpaques;
+
+        public Material blitMaterial = null;
+        public int blitMaterialPassIndex = 0;
+        public Target destination = Target.Color;
+        public string textureId = "_BlitPassTexture";
+    }
+
+    public enum Target
+    {
+        Color,
+        Texture
+    }
+
+    public BlitSettings settings = new BlitSettings();
+    RenderTargetHandle m_RenderTextureHandle;
+
+    BlitPass blitPass;
+
+    public override void Create()
+    {
+        var passIndex = settings.blitMaterial != null ? settings.blitMaterial.passCount - 1 : 1;
+        settings.blitMaterialPassIndex = Mathf.Clamp(settings.blitMaterialPassIndex, -1, passIndex);
+        blitPass = new BlitPass(settings.Event, settings.blitMaterial, settings.blitMaterialPassIndex, name);
+        m_RenderTextureHandle.Init(settings.textureId);
+    }
+
+    public override void AddRenderPasses(ScriptableRenderer renderer, ref RenderingData renderingData)
+    {
+        var src = renderer.cameraColorTarget;
+        var dest = (settings.destination == Target.Color) ? RenderTargetHandle.CameraTarget : m_RenderTextureHandle;
+
+        if (settings.blitMaterial == null)
+        {
+            Debug.LogWarningFormat("Missing Blit Material. {0} blit pass will not execute. Check for missing reference in the assigned renderer.", GetType().Name);
+            return;
+        }
+
+        blitPass.Setup(src, dest);
+        renderer.EnqueuePass(blitPass);
+    }
+}
\ No newline at end of file

--------------------- Unity/Health/Assets/URP/Blit.cs.meta ---------------------
new file mode 100644
index 0000000..f1896ed
@@ -0,0 +1,11 @@
+fileFormatVersion: 2
+guid: adb129444bd715c4b85906603ebb7764
+MonoImporter:
+  externalObjects: {}
+  serializedVersion: 2
+  defaultReferences: []
+  executionOrder: 0
+  icon: {instanceID: 0}
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 

---------------- Unity/Health/Assets/URP/DitheringScanline.mat ----------------
similarity index 57%
copy from Unity/Health/Assets/Rock.mat
copy to Unity/Health/Assets/URP/DitheringScanline.mat
index ca157d3..9e5a4cb 100644
@@ -7,74 +7,61 @@ Material:
   m_CorrespondingSourceObject: {fileID: 0}
   m_PrefabInstance: {fileID: 0}
   m_PrefabAsset: {fileID: 0}
-  m_Name: Rock
-  m_Shader: {fileID: 46, guid: 0000000000000000f000000000000000, type: 0}
-  m_ShaderKeywords: _ALPHATEST_ON
+  m_Name: DitheringScanline
+  m_Shader: {fileID: -6465566751694194690, guid: a2b2b957110b0994c80d6300cd7dcfca, type: 3}
+  m_ShaderKeywords: 
   m_LightmapFlags: 4
   m_EnableInstancingVariants: 0
   m_DoubleSidedGI: 0
-  m_CustomRenderQueue: 2450
-  stringTagMap:
-    RenderType: TransparentCutout
+  m_CustomRenderQueue: -1
+  stringTagMap: {}
   disabledShaderPasses: []
   m_SavedProperties:
     serializedVersion: 3
     m_TexEnvs:
-    - _BumpMap:
+    - _AlphaTex:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _DetailAlbedoMap:
-        m_Texture: {fileID: 0}
+    - _MainTex:
+        m_Texture: {fileID: 2800000, guid: 7b503d45ba80930429b7280927fcb33d, type: 3}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _DetailMask:
+    - _MaskTex:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _DetailNormalMap:
+    - _NormalMap:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _EmissionMap:
-        m_Texture: {fileID: 0}
+    - _SampleTexture2D_c5572dfc832f44738424d154efb2cdc6_Texture_1:
+        m_Texture: {fileID: 2800000, guid: ec2e3aa6d0ab8ce4eac29b56d65d61d5, type: 3}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _MainTex:
-        m_Texture: {fileID: 2800000, guid: 7b2722cd3fd6bb14d967c3d66060ada2, type: 3}
+    - _Texture2DAsset_d64b4b2059754b69b475690bbb5bc65e_Out_0:
+        m_Texture: {fileID: 2800000, guid: 7b503d45ba80930429b7280927fcb33d, type: 3}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _MetallicGlossMap:
+    - unity_Lightmaps:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _OcclusionMap:
+    - unity_LightmapsInd:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
-    - _ParallaxMap:
+    - unity_ShadowMasks:
         m_Texture: {fileID: 0}
         m_Scale: {x: 1, y: 1}
         m_Offset: {x: 0, y: 0}
     m_Ints: []
     m_Floats:
-    - _BumpScale: 1
-    - _Cutoff: 0.5
-    - _DetailNormalMapScale: 1
-    - _DstBlend: 0
-    - _GlossMapScale: 1
-    - _Glossiness: 0.5
-    - _GlossyReflections: 1
-    - _Metallic: 0
-    - _Mode: 1
-    - _OcclusionStrength: 1
-    - _Parallax: 0.02
-    - _SmoothnessTextureChannel: 0
-    - _SpecularHighlights: 1
-    - _SrcBlend: 1
-    - _UVSec: 0
-    - _ZWrite: 1
+    - Brightness: 1.8
+    - Contrast: 2.81
+    - _EnableExternalAlpha: 0
     m_Colors:
     - _Color: {r: 1, g: 1, b: 1, a: 1}
-    - _EmissionColor: {r: 0, g: 0, b: 0, a: 1}
+    - _Flip: {r: 1, g: 1, b: 1, a: 1}
+    - _RendererColor: {r: 1, g: 1, b: 1, a: 1}
   m_BuildTextureStacks: []

-------------- Unity/Health/Assets/URP/DitheringScanline.mat.meta --------------
new file mode 100644
index 0000000..c743497
@@ -0,0 +1,8 @@
+fileFormatVersion: 2
+guid: c87f2527588a2c14d8b07b069b33faa9
+NativeFormatImporter:
+  externalObjects: {}
+  mainObjectFileID: 2100000
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 

------------ Unity/Health/Assets/URP/DitheringScanline.shadergraph ------------
new file mode 100644
index 0000000..c5b2b50
@@ -0,0 +1,1899 @@
+{
+    "m_SGVersion": 2,
+    "m_Type": "UnityEditor.ShaderGraph.GraphData",
+    "m_ObjectId": "faf774e042a44f35a90723fcfc8e4d5f",
+    "m_Properties": [
+        {
+            "m_Id": "ba79cb229ee843e2b6df0230ae1b50e0"
+        },
+        {
+            "m_Id": "c7e672ac9bef4ebfa6f51c59a53b8ef6"
+        },
+        {
+            "m_Id": "1c00e6aeaddf4b278d41f8669e442ffa"
+        }
+    ],
+    "m_Keywords": [],
+    "m_Nodes": [
+        {
+            "m_Id": "744ce060961c4ae4a12807139947cf96"
+        },
+        {
+            "m_Id": "a35a6c948fc543c7a6cb8ada3a959a17"
+        },
+        {
+            "m_Id": "49fcf56375384ef391198b79aeb36c28"
+        },
+        {
+            "m_Id": "6d393efeada8476a96c53dff80f8c4f3"
+        },
+        {
+            "m_Id": "6cdec68d55214c3bb8f929d1e72ba9d1"
+        },
+        {
+            "m_Id": "c3db6c671452433baacc7d99ebd243f2"
+        },
+        {
+            "m_Id": "c5572dfc832f44738424d154efb2cdc6"
+        },
+        {
+            "m_Id": "d64b4b2059754b69b475690bbb5bc65e"
+        },
+        {
+            "m_Id": "9d798d7c5089486b8aee202e00b14e67"
+        },
+        {
+            "m_Id": "9f99a24c977f4ca9845a5abe3eafddcf"
+        },
+        {
+            "m_Id": "0c310ed6779c41d2ac326931bfee550b"
+        },
+        {
+            "m_Id": "4f05319a8f1a42d9a2fa400866f1a994"
+        },
+        {
+            "m_Id": "ef08e1647c1e486bb58d7188627e3b73"
+        },
+        {
+            "m_Id": "5fb90c77f26f49b5b3463b87698e66f2"
+        },
+        {
+            "m_Id": "3ee46f08c4334172b07020283848974e"
+        },
+        {
+            "m_Id": "1e9822e1cf0445a8bf88e0f0bafab13c"
+        }
+    ],
+    "m_GroupDatas": [],
+    "m_StickyNoteDatas": [],
+    "m_Edges": [
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "0c310ed6779c41d2ac326931bfee550b"
+                },
+                "m_SlotId": 2
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "ef08e1647c1e486bb58d7188627e3b73"
+                },
+                "m_SlotId": 1
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "1e9822e1cf0445a8bf88e0f0bafab13c"
+                },
+                "m_SlotId": 0
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "3ee46f08c4334172b07020283848974e"
+                },
+                "m_SlotId": 1
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "3ee46f08c4334172b07020283848974e"
+                },
+                "m_SlotId": 2
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "6d393efeada8476a96c53dff80f8c4f3"
+                },
+                "m_SlotId": 0
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "4f05319a8f1a42d9a2fa400866f1a994"
+                },
+                "m_SlotId": 0
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "5fb90c77f26f49b5b3463b87698e66f2"
+                },
+                "m_SlotId": 1
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "5fb90c77f26f49b5b3463b87698e66f2"
+                },
+                "m_SlotId": 2
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "9d798d7c5089486b8aee202e00b14e67"
+                },
+                "m_SlotId": 1
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "9d798d7c5089486b8aee202e00b14e67"
+                },
+                "m_SlotId": 2
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "0c310ed6779c41d2ac326931bfee550b"
+                },
+                "m_SlotId": 0
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "9d798d7c5089486b8aee202e00b14e67"
+                },
+                "m_SlotId": 2
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "ef08e1647c1e486bb58d7188627e3b73"
+                },
+                "m_SlotId": 0
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "9f99a24c977f4ca9845a5abe3eafddcf"
+                },
+                "m_SlotId": 0
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "9d798d7c5089486b8aee202e00b14e67"
+                },
+                "m_SlotId": 0
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "c3db6c671452433baacc7d99ebd243f2"
+                },
+                "m_SlotId": 0
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "c5572dfc832f44738424d154efb2cdc6"
+                },
+                "m_SlotId": 1
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "c5572dfc832f44738424d154efb2cdc6"
+                },
+                "m_SlotId": 0
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "5fb90c77f26f49b5b3463b87698e66f2"
+                },
+                "m_SlotId": 0
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "d64b4b2059754b69b475690bbb5bc65e"
+                },
+                "m_SlotId": 0
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "9f99a24c977f4ca9845a5abe3eafddcf"
+                },
+                "m_SlotId": 1
+            }
+        },
+        {
+            "m_OutputSlot": {
+                "m_Node": {
+                    "m_Id": "ef08e1647c1e486bb58d7188627e3b73"
+                },
+                "m_SlotId": 2
+            },
+            "m_InputSlot": {
+                "m_Node": {
+                    "m_Id": "3ee46f08c4334172b07020283848974e"
+                },
+                "m_SlotId": 0
+            }
+        }
+    ],
+    "m_VertexContext": {
+        "m_Position": {
+            "x": 2047.0,
+            "y": -503.0
+        },
+        "m_Blocks": [
+            {
+                "m_Id": "744ce060961c4ae4a12807139947cf96"
+            },
+            {
+                "m_Id": "a35a6c948fc543c7a6cb8ada3a959a17"
+            },
+            {
+                "m_Id": "49fcf56375384ef391198b79aeb36c28"
+            }
+        ]
+    },
+    "m_FragmentContext": {
+        "m_Position": {
+            "x": 2047.0,
+            "y": -331.0
+        },
+        "m_Blocks": [
+            {
+                "m_Id": "6d393efeada8476a96c53dff80f8c4f3"
+            },
+            {
+                "m_Id": "6cdec68d55214c3bb8f929d1e72ba9d1"
+            }
+        ]
+    },
+    "m_PreviewData": {
+        "serializedMesh": {
+            "m_SerializedMesh": "{\"mesh\":{\"instanceID\":0}}",
+            "m_Guid": ""
+        }
+    },
+    "m_Path": "Shader Graphs",
+    "m_ConcretePrecision": 0,
+    "m_PreviewMode": 2,
+    "m_OutputNode": {
+        "m_Id": ""
+    },
+    "m_ActiveTargets": [
+        {
+            "m_Id": "2692c666f7c0482c9e2e02726f2eafae"
+        }
+    ]
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "06543ad4369b42aa985395e23a533205",
+    "m_Id": 2,
+    "m_DisplayName": "Out",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.SamplerStateMaterialSlot",
+    "m_ObjectId": "073f913a909b43218a45996d4f4574da",
+    "m_Id": 3,
+    "m_DisplayName": "Sampler",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Sampler",
+    "m_StageCapability": 3,
+    "m_BareResource": false
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DitherNode",
+    "m_ObjectId": "0c310ed6779c41d2ac326931bfee550b",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Dither",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 561.0,
+            "y": -277.9999694824219,
+            "width": 207.99998474121095,
+            "height": 301.9999694824219
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "10b1645fc74742d38aba55ddc93f2b20"
+        },
+        {
+            "m_Id": "d512343407b24981b847fa751e1b7446"
+        },
+        {
+            "m_Id": "1daa0b1f080749f5a97badc1d9466359"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.TangentMaterialSlot",
+    "m_ObjectId": "0eb50b7aa4924c4a9d8b29a0004be8e9",
+    "m_Id": 0,
+    "m_DisplayName": "Tangent",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Tangent",
+    "m_StageCapability": 1,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_Labels": [],
+    "m_Space": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "10b1645fc74742d38aba55ddc93f2b20",
+    "m_Id": 0,
+    "m_DisplayName": "In",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "In",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 1,
+    "m_Type": "UnityEditor.ShaderGraph.Internal.Vector1ShaderProperty",
+    "m_ObjectId": "1c00e6aeaddf4b278d41f8669e442ffa",
+    "m_Guid": {
+        "m_GuidSerialized": "484c7a31-ebf0-44c8-b5e3-f359e73b9cf0"
+    },
+    "m_Name": "Brightness",
+    "m_DefaultRefNameVersion": 1,
+    "m_RefNameGeneratedByDisplayName": "Brightness",
+    "m_DefaultReferenceName": "Brightness",
+    "m_OverrideReferenceName": "",
+    "m_GeneratePropertyBlock": true,
+    "m_Precision": 0,
+    "overrideHLSLDeclaration": false,
+    "hlslDeclarationOverride": 0,
+    "m_Hidden": false,
+    "m_Value": 0.0,
+    "m_FloatType": 0,
+    "m_RangeValues": {
+        "x": 0.0,
+        "y": 1.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "1daa0b1f080749f5a97badc1d9466359",
+    "m_Id": 2,
+    "m_DisplayName": "Out",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.PropertyNode",
+    "m_ObjectId": "1e9822e1cf0445a8bf88e0f0bafab13c",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Property",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 1497.0,
+            "y": -244.00003051757813,
+            "width": 132.0,
+            "height": 34.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "37aaa6139e464acead2a90c25cfefe66"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_Property": {
+        "m_Id": "1c00e6aeaddf4b278d41f8669e442ffa"
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.Rendering.Universal.ShaderGraph.UniversalTarget",
+    "m_ObjectId": "2692c666f7c0482c9e2e02726f2eafae",
+    "m_ActiveSubTarget": {
+        "m_Id": "7856eb612c254e0bb4832cdead6d89b6"
+    },
+    "m_SurfaceType": 0,
+    "m_AlphaMode": 0,
+    "m_TwoSided": false,
+    "m_AlphaClip": false,
+    "m_CustomEditorGUI": ""
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector3MaterialSlot",
+    "m_ObjectId": "2ca45678c44d441cbef41080e2fbb6b5",
+    "m_Id": 2,
+    "m_DisplayName": "Out",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicValueMaterialSlot",
+    "m_ObjectId": "2d49e696d7fb4e09b1e1db0118cf8833",
+    "m_Id": 2,
+    "m_DisplayName": "Out",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "e00": 0.0,
+        "e01": 0.0,
+        "e02": 0.0,
+        "e03": 0.0,
+        "e10": 0.0,
+        "e11": 0.0,
+        "e12": 0.0,
+        "e13": 0.0,
+        "e20": 0.0,
+        "e21": 0.0,
+        "e22": 0.0,
+        "e23": 0.0,
+        "e30": 0.0,
+        "e31": 0.0,
+        "e32": 0.0,
+        "e33": 0.0
+    },
+    "m_DefaultValue": {
+        "e00": 1.0,
+        "e01": 0.0,
+        "e02": 0.0,
+        "e03": 0.0,
+        "e10": 0.0,
+        "e11": 1.0,
+        "e12": 0.0,
+        "e13": 0.0,
+        "e20": 0.0,
+        "e21": 0.0,
+        "e22": 1.0,
+        "e23": 0.0,
+        "e30": 0.0,
+        "e31": 0.0,
+        "e32": 0.0,
+        "e33": 1.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "2e73f0c9e7c6402c96a12b04791f16fc",
+    "m_Id": 0,
+    "m_DisplayName": "Alpha",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Alpha",
+    "m_StageCapability": 2,
+    "m_Value": 1.0,
+    "m_DefaultValue": 1.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicValueMaterialSlot",
+    "m_ObjectId": "30e7ab7290fc48dba3d60f1574323bb5",
+    "m_Id": 1,
+    "m_DisplayName": "B",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "B",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "e00": 2.0,
+        "e01": 2.0,
+        "e02": 2.0,
+        "e03": 2.0,
+        "e10": 2.0,
+        "e11": 2.0,
+        "e12": 2.0,
+        "e13": 2.0,
+        "e20": 2.0,
+        "e21": 2.0,
+        "e22": 2.0,
+        "e23": 2.0,
+        "e30": 2.0,
+        "e31": 2.0,
+        "e32": 2.0,
+        "e33": 2.0
+    },
+    "m_DefaultValue": {
+        "e00": 1.0,
+        "e01": 0.0,
+        "e02": 0.0,
+        "e03": 0.0,
+        "e10": 0.0,
+        "e11": 1.0,
+        "e12": 0.0,
+        "e13": 0.0,
+        "e20": 0.0,
+        "e21": 0.0,
+        "e22": 1.0,
+        "e23": 0.0,
+        "e30": 0.0,
+        "e31": 0.0,
+        "e32": 0.0,
+        "e33": 1.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "37aaa6139e464acead2a90c25cfefe66",
+    "m_Id": 0,
+    "m_DisplayName": "Brightness",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "39ca8884fcdf41e5a3b069a6adc3c37f",
+    "m_Id": 4,
+    "m_DisplayName": "R",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "R",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.MultiplyNode",
+    "m_ObjectId": "3ee46f08c4334172b07020283848974e",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Multiply",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 1722.0,
+            "y": -395.0,
+            "width": 208.0,
+            "height": 302.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "c008a73215b2447fab3c50a073b2f818"
+        },
+        {
+            "m_Id": "30e7ab7290fc48dba3d60f1574323bb5"
+        },
+        {
+            "m_Id": "2d49e696d7fb4e09b1e1db0118cf8833"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlockNode",
+    "m_ObjectId": "49fcf56375384ef391198b79aeb36c28",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "VertexDescription.Tangent",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 0.0,
+            "y": 0.0,
+            "width": 0.0,
+            "height": 0.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "0eb50b7aa4924c4a9d8b29a0004be8e9"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_SerializedDescriptor": "VertexDescription.Tangent"
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.PropertyNode",
+    "m_ObjectId": "4f05319a8f1a42d9a2fa400866f1a994",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Property",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": -260.0,
+            "y": -255.0,
+            "width": 121.0,
+            "height": 34.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "ba20e61948e2463c82f5e468e1b49a3e"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_Property": {
+        "m_Id": "c7e672ac9bef4ebfa6f51c59a53b8ef6"
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "57d0b85ce0fe44a28fa69cb0c85b0ae3",
+    "m_Id": 6,
+    "m_DisplayName": "B",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "B",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.ContrastNode",
+    "m_ObjectId": "5fb90c77f26f49b5b3463b87698e66f2",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Contrast",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 25.0,
+            "y": 158.0,
+            "width": 166.0,
+            "height": 118.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "911b5eae8fec479d9c329d61bbeeab15"
+        },
+        {
+            "m_Id": "bceabb47bf7e4087b9f803bc53d140fd"
+        },
+        {
+            "m_Id": "2ca45678c44d441cbef41080e2fbb6b5"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": false,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector4MaterialSlot",
+    "m_ObjectId": "6563441654614cb1b9822d83354eff98",
+    "m_Id": 0,
+    "m_DisplayName": "RGBA",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "RGBA",
+    "m_StageCapability": 2,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "68286c85547245e5b31667cc7c123205",
+    "m_Id": 1,
+    "m_DisplayName": "Blend",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Blend",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlockNode",
+    "m_ObjectId": "6cdec68d55214c3bb8f929d1e72ba9d1",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "SurfaceDescription.Alpha",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 0.0,
+            "y": 0.0,
+            "width": 0.0,
+            "height": 0.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "2e73f0c9e7c6402c96a12b04791f16fc"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_SerializedDescriptor": "SurfaceDescription.Alpha"
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlockNode",
+    "m_ObjectId": "6d393efeada8476a96c53dff80f8c4f3",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "SurfaceDescription.BaseColor",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 0.0,
+            "y": 0.0,
+            "width": 0.0,
+            "height": 0.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "ec2bfbca77bb41ebbee0e765cc0452a9"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_SerializedDescriptor": "SurfaceDescription.BaseColor"
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "6dbf4ec190af4b179ee07cf7bddced66",
+    "m_Id": 6,
+    "m_DisplayName": "B",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "B",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Texture2DInputMaterialSlot",
+    "m_ObjectId": "6f347834e30e4f80a16eed872a9b81dd",
+    "m_Id": 1,
+    "m_DisplayName": "Texture",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Texture",
+    "m_StageCapability": 3,
+    "m_BareResource": false,
+    "m_Texture": {
+        "m_SerializedTexture": "{\"texture\":{\"instanceID\":0}}",
+        "m_Guid": ""
+    },
+    "m_DefaultType": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "70fd4f6a2e49467083a4cb7f295ef6c7",
+    "m_Id": 0,
+    "m_DisplayName": "Base",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Base",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlockNode",
+    "m_ObjectId": "744ce060961c4ae4a12807139947cf96",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "VertexDescription.Position",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 0.0,
+            "y": 0.0,
+            "width": 0.0,
+            "height": 0.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "746b03c5469d4daf8f60c1a4fbd367e8"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_SerializedDescriptor": "VertexDescription.Position"
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.PositionMaterialSlot",
+    "m_ObjectId": "746b03c5469d4daf8f60c1a4fbd367e8",
+    "m_Id": 0,
+    "m_DisplayName": "Position",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Position",
+    "m_StageCapability": 1,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_Labels": [],
+    "m_Space": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.Rendering.Universal.ShaderGraph.UniversalSpriteUnlitSubTarget",
+    "m_ObjectId": "7856eb612c254e0bb4832cdead6d89b6"
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "8315e2a74c4f44008cac3dc02ba402b8",
+    "m_Id": 3,
+    "m_DisplayName": "Opacity",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Opacity",
+    "m_StageCapability": 3,
+    "m_Value": 0.36000001430511477,
+    "m_DefaultValue": 1.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector3MaterialSlot",
+    "m_ObjectId": "911b5eae8fec479d9c329d61bbeeab15",
+    "m_Id": 0,
+    "m_DisplayName": "In",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "In",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.UVMaterialSlot",
+    "m_ObjectId": "931ab1415a60490aa8ce8cfd62d9ea87",
+    "m_Id": 2,
+    "m_DisplayName": "UV",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "UV",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0
+    },
+    "m_Labels": [],
+    "m_Channel": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "953cb6d25c394db5a194a7a7729ad78b",
+    "m_Id": 1,
+    "m_DisplayName": "Blend",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Blend",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Texture2DMaterialSlot",
+    "m_ObjectId": "96465db4ffdf4775a8557cef85ad139b",
+    "m_Id": 0,
+    "m_DisplayName": "_MainTex",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_BareResource": false
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlendNode",
+    "m_ObjectId": "9d798d7c5089486b8aee202e00b14e67",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Blend",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 288.9999694824219,
+            "y": -94.99996948242188,
+            "width": 208.0,
+            "height": 362.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "ec2c0720adc248f4815e8b7b523212d9"
+        },
+        {
+            "m_Id": "953cb6d25c394db5a194a7a7729ad78b"
+        },
+        {
+            "m_Id": "e490f8c55d2d4ae99fdc5314e46b796e"
+        },
+        {
+            "m_Id": "06543ad4369b42aa985395e23a533205"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_BlendMode": 13
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.SampleTexture2DNode",
+    "m_ObjectId": "9f99a24c977f4ca9845a5abe3eafddcf",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Sample Texture 2D",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": -301.0,
+            "y": -95.0,
+            "width": 184.0,
+            "height": 253.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "fbdf528b14794cca8a269de107d5d5af"
+        },
+        {
+            "m_Id": "39ca8884fcdf41e5a3b069a6adc3c37f"
+        },
+        {
+            "m_Id": "f0f39e1a89b04ec2ab67739b1f10bdaa"
+        },
+        {
+            "m_Id": "6dbf4ec190af4b179ee07cf7bddced66"
+        },
+        {
+            "m_Id": "ed24452ad37f4ec6a6d65f8ba13f48c5"
+        },
+        {
+            "m_Id": "6f347834e30e4f80a16eed872a9b81dd"
+        },
+        {
+            "m_Id": "931ab1415a60490aa8ce8cfd62d9ea87"
+        },
+        {
+            "m_Id": "a1e771bbcd21410584cc30a876907c31"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": false,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_TextureType": 0,
+    "m_NormalMapSpace": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "a15f7014d4634621aba5f48f9dd0cf62",
+    "m_Id": 2,
+    "m_DisplayName": "Out",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "a184374c870740e1bc4c41928b82efb7",
+    "m_Id": 5,
+    "m_DisplayName": "G",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "G",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.SamplerStateMaterialSlot",
+    "m_ObjectId": "a1e771bbcd21410584cc30a876907c31",
+    "m_Id": 3,
+    "m_DisplayName": "Sampler",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Sampler",
+    "m_StageCapability": 3,
+    "m_BareResource": false
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlockNode",
+    "m_ObjectId": "a35a6c948fc543c7a6cb8ada3a959a17",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "VertexDescription.Normal",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 0.0,
+            "y": 0.0,
+            "width": 0.0,
+            "height": 0.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "bf911c348c824e29b2cda566d9cfd1f9"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_SerializedDescriptor": "VertexDescription.Normal"
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.UVMaterialSlot",
+    "m_ObjectId": "b1d9fa897de7456f9e846dc8def3e629",
+    "m_Id": 2,
+    "m_DisplayName": "UV",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "UV",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0
+    },
+    "m_Labels": [],
+    "m_Channel": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "ba20e61948e2463c82f5e468e1b49a3e",
+    "m_Id": 0,
+    "m_DisplayName": "Contrast",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Internal.Texture2DShaderProperty",
+    "m_ObjectId": "ba79cb229ee843e2b6df0230ae1b50e0",
+    "m_Guid": {
+        "m_GuidSerialized": "c2a7b531-e1b9-401b-a0a8-a85dccccd232"
+    },
+    "m_Name": "_MainTex",
+    "m_DefaultRefNameVersion": 1,
+    "m_RefNameGeneratedByDisplayName": "_MainTex",
+    "m_DefaultReferenceName": "_MainTex",
+    "m_OverrideReferenceName": "",
+    "m_GeneratePropertyBlock": true,
+    "m_Precision": 0,
+    "overrideHLSLDeclaration": false,
+    "hlslDeclarationOverride": 0,
+    "m_Hidden": false,
+    "m_Value": {
+        "m_SerializedTexture": "{\"texture\":{\"instanceID\":0}}",
+        "m_Guid": ""
+    },
+    "m_Modifiable": true,
+    "m_DefaultType": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "bceabb47bf7e4087b9f803bc53d140fd",
+    "m_Id": 1,
+    "m_DisplayName": "Contrast",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Contrast",
+    "m_StageCapability": 3,
+    "m_Value": 1.0,
+    "m_DefaultValue": 1.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.NormalMaterialSlot",
+    "m_ObjectId": "bf911c348c824e29b2cda566d9cfd1f9",
+    "m_Id": 0,
+    "m_DisplayName": "Normal",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Normal",
+    "m_StageCapability": 1,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_Labels": [],
+    "m_Space": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicValueMaterialSlot",
+    "m_ObjectId": "c008a73215b2447fab3c50a073b2f818",
+    "m_Id": 0,
+    "m_DisplayName": "A",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "A",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "e00": 0.0,
+        "e01": 0.0,
+        "e02": 0.0,
+        "e03": 0.0,
+        "e10": 0.0,
+        "e11": 0.0,
+        "e12": 0.0,
+        "e13": 0.0,
+        "e20": 0.0,
+        "e21": 0.0,
+        "e22": 0.0,
+        "e23": 0.0,
+        "e30": 0.0,
+        "e31": 0.0,
+        "e32": 0.0,
+        "e33": 0.0
+    },
+    "m_DefaultValue": {
+        "e00": 1.0,
+        "e01": 0.0,
+        "e02": 0.0,
+        "e03": 0.0,
+        "e10": 0.0,
+        "e11": 1.0,
+        "e12": 0.0,
+        "e13": 0.0,
+        "e20": 0.0,
+        "e21": 0.0,
+        "e22": 1.0,
+        "e23": 0.0,
+        "e30": 0.0,
+        "e31": 0.0,
+        "e32": 0.0,
+        "e33": 1.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.PropertyNode",
+    "m_ObjectId": "c3db6c671452433baacc7d99ebd243f2",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Property",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": -391.0,
+            "y": 290.0,
+            "width": 134.0,
+            "height": 34.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "96465db4ffdf4775a8557cef85ad139b"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_Property": {
+        "m_Id": "ba79cb229ee843e2b6df0230ae1b50e0"
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "c50ce55bf6c34658b15aee0e0abe135c",
+    "m_Id": 7,
+    "m_DisplayName": "A",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "A",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.SampleTexture2DNode",
+    "m_ObjectId": "c5572dfc832f44738424d154efb2cdc6",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Sample Texture 2D",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": -239.00003051757813,
+            "y": 251.00001525878907,
+            "width": 184.00001525878907,
+            "height": 253.00001525878907
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "6563441654614cb1b9822d83354eff98"
+        },
+        {
+            "m_Id": "dbc2c3254c66437686d08d5ee5cf8dff"
+        },
+        {
+            "m_Id": "a184374c870740e1bc4c41928b82efb7"
+        },
+        {
+            "m_Id": "57d0b85ce0fe44a28fa69cb0c85b0ae3"
+        },
+        {
+            "m_Id": "c50ce55bf6c34658b15aee0e0abe135c"
+        },
+        {
+            "m_Id": "f7cd7a58ee354c718569bb482e2ab11b"
+        },
+        {
+            "m_Id": "b1d9fa897de7456f9e846dc8def3e629"
+        },
+        {
+            "m_Id": "073f913a909b43218a45996d4f4574da"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": false,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_TextureType": 0,
+    "m_NormalMapSpace": 0
+}
+
+{
+    "m_SGVersion": 1,
+    "m_Type": "UnityEditor.ShaderGraph.Internal.Vector1ShaderProperty",
+    "m_ObjectId": "c7e672ac9bef4ebfa6f51c59a53b8ef6",
+    "m_Guid": {
+        "m_GuidSerialized": "3aebfa53-5bf0-49aa-878b-73fe7a94da8c"
+    },
+    "m_Name": "Contrast",
+    "m_DefaultRefNameVersion": 1,
+    "m_RefNameGeneratedByDisplayName": "Contrast",
+    "m_DefaultReferenceName": "Contrast",
+    "m_OverrideReferenceName": "",
+    "m_GeneratePropertyBlock": true,
+    "m_Precision": 0,
+    "overrideHLSLDeclaration": false,
+    "hlslDeclarationOverride": 0,
+    "m_Hidden": false,
+    "m_Value": 0.0,
+    "m_FloatType": 0,
+    "m_RangeValues": {
+        "x": 0.0,
+        "y": 1.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Texture2DMaterialSlot",
+    "m_ObjectId": "c9b8d8a1f87a4b3da9c4b013f6304503",
+    "m_Id": 0,
+    "m_DisplayName": "Out",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Out",
+    "m_StageCapability": 3,
+    "m_BareResource": false
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.ScreenPositionMaterialSlot",
+    "m_ObjectId": "d512343407b24981b847fa751e1b7446",
+    "m_Id": 1,
+    "m_DisplayName": "Screen Position",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "ScreenPosition",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_Labels": [],
+    "m_ScreenSpaceType": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Texture2DAssetNode",
+    "m_ObjectId": "d64b4b2059754b69b475690bbb5bc65e",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Texture 2D Asset",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": -467.0,
+            "y": -132.0,
+            "width": 143.0,
+            "height": 106.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "c9b8d8a1f87a4b3da9c4b013f6304503"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_Texture": {
+        "m_SerializedTexture": "{\"texture\":{\"fileID\":2800000,\"guid\":\"7b503d45ba80930429b7280927fcb33d\",\"type\":3}}",
+        "m_Guid": ""
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "dbc2c3254c66437686d08d5ee5cf8dff",
+    "m_Id": 4,
+    "m_DisplayName": "R",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "R",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "e490f8c55d2d4ae99fdc5314e46b796e",
+    "m_Id": 3,
+    "m_DisplayName": "Opacity",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Opacity",
+    "m_StageCapability": 3,
+    "m_Value": 0.6000000238418579,
+    "m_DefaultValue": 1.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.ColorRGBMaterialSlot",
+    "m_ObjectId": "ec2bfbca77bb41ebbee0e765cc0452a9",
+    "m_Id": 0,
+    "m_DisplayName": "Base Color",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "BaseColor",
+    "m_StageCapability": 2,
+    "m_Value": {
+        "x": 0.5,
+        "y": 0.5,
+        "z": 0.5
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0
+    },
+    "m_Labels": [],
+    "m_ColorMode": 0,
+    "m_DefaultColor": {
+        "r": 0.5,
+        "g": 0.5,
+        "b": 0.5,
+        "a": 1.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.DynamicVectorMaterialSlot",
+    "m_ObjectId": "ec2c0720adc248f4815e8b7b523212d9",
+    "m_Id": 0,
+    "m_DisplayName": "Base",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Base",
+    "m_StageCapability": 3,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    }
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "ed24452ad37f4ec6a6d65f8ba13f48c5",
+    "m_Id": 7,
+    "m_DisplayName": "A",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "A",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.BlendNode",
+    "m_ObjectId": "ef08e1647c1e486bb58d7188627e3b73",
+    "m_Group": {
+        "m_Id": ""
+    },
+    "m_Name": "Blend",
+    "m_DrawState": {
+        "m_Expanded": true,
+        "m_Position": {
+            "serializedVersion": "2",
+            "x": 879.0,
+            "y": -192.00001525878907,
+            "width": 208.0,
+            "height": 362.0
+        }
+    },
+    "m_Slots": [
+        {
+            "m_Id": "70fd4f6a2e49467083a4cb7f295ef6c7"
+        },
+        {
+            "m_Id": "68286c85547245e5b31667cc7c123205"
+        },
+        {
+            "m_Id": "8315e2a74c4f44008cac3dc02ba402b8"
+        },
+        {
+            "m_Id": "a15f7014d4634621aba5f48f9dd0cf62"
+        }
+    ],
+    "synonyms": [],
+    "m_Precision": 0,
+    "m_PreviewExpanded": true,
+    "m_PreviewMode": 0,
+    "m_CustomColors": {
+        "m_SerializableColors": []
+    },
+    "m_BlendMode": 13
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector1MaterialSlot",
+    "m_ObjectId": "f0f39e1a89b04ec2ab67739b1f10bdaa",
+    "m_Id": 5,
+    "m_DisplayName": "G",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "G",
+    "m_StageCapability": 2,
+    "m_Value": 0.0,
+    "m_DefaultValue": 0.0,
+    "m_Labels": []
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Texture2DInputMaterialSlot",
+    "m_ObjectId": "f7cd7a58ee354c718569bb482e2ab11b",
+    "m_Id": 1,
+    "m_DisplayName": "Texture",
+    "m_SlotType": 0,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "Texture",
+    "m_StageCapability": 3,
+    "m_BareResource": false,
+    "m_Texture": {
+        "m_SerializedTexture": "{\"texture\":{\"instanceID\":0}}",
+        "m_Guid": ""
+    },
+    "m_DefaultType": 0
+}
+
+{
+    "m_SGVersion": 0,
+    "m_Type": "UnityEditor.ShaderGraph.Vector4MaterialSlot",
+    "m_ObjectId": "fbdf528b14794cca8a269de107d5d5af",
+    "m_Id": 0,
+    "m_DisplayName": "RGBA",
+    "m_SlotType": 1,
+    "m_Hidden": false,
+    "m_ShaderOutputName": "RGBA",
+    "m_StageCapability": 2,
+    "m_Value": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_DefaultValue": {
+        "x": 0.0,
+        "y": 0.0,
+        "z": 0.0,
+        "w": 0.0
+    },
+    "m_Labels": []
+}
+

---------- Unity/Health/Assets/URP/DitheringScanline.shadergraph.meta ----------
new file mode 100644
index 0000000..8be4831
@@ -0,0 +1,10 @@
+fileFormatVersion: 2
+guid: a2b2b957110b0994c80d6300cd7dcfca
+ScriptedImporter:
+  internalIDToNameTable: []
+  externalObjects: {}
+  serializedVersion: 2
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 
+  script: {fileID: 11500000, guid: 625f186215c104763be7675aa2d941aa, type: 3}

---------------- Unity/Health/Assets/URP/ForwardRenderer.asset ----------------
new file mode 100644
index 0000000..b6fbba9
@@ -0,0 +1,62 @@
+%YAML 1.1
+%TAG !u! tag:unity3d.com,2011:
+--- !u!114 &11400000
+MonoBehaviour:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 0}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: de640fe3d0db1804a85f9fc8f5cadab6, type: 3}
+  m_Name: ForwardRenderer
+  m_EditorClassIdentifier: 
+  m_RendererFeatures:
+  - {fileID: 1467692930502841118}
+  m_RendererFeatureMap: 1e53f9b1f14a5e14
+  postProcessData: {fileID: 11400000, guid: 41439944d30ece34e96484bdb6645b55, type: 2}
+  xrSystemData: {fileID: 11400000, guid: 60e1133243b97e347b653163a8c01b64, type: 2}
+  shaders:
+    blitPS: {fileID: 4800000, guid: c17132b1f77d20942aa75f8429c0f8bc, type: 3}
+    copyDepthPS: {fileID: 4800000, guid: d6dae50ee9e1bfa4db75f19f99355220, type: 3}
+    screenSpaceShadowPS: {fileID: 0}
+    samplingPS: {fileID: 4800000, guid: 04c410c9937594faa893a11dceb85f7e, type: 3}
+    stencilDeferredPS: {fileID: 4800000, guid: e9155b26e1bc55942a41e518703fe304, type: 3}
+    fallbackErrorPS: {fileID: 4800000, guid: e6e9a19c3678ded42a3bc431ebef7dbd, type: 3}
+    materialErrorPS: {fileID: 4800000, guid: 5fd9a8feb75a4b5894c241777f519d4e, type: 3}
+  m_OpaqueLayerMask:
+    serializedVersion: 2
+    m_Bits: 4294967295
+  m_TransparentLayerMask:
+    serializedVersion: 2
+    m_Bits: 4294967295
+  m_DefaultStencilState:
+    overrideStencilState: 0
+    stencilReference: 0
+    stencilCompareFunction: 8
+    passOperation: 2
+    failOperation: 0
+    zFailOperation: 0
+  m_ShadowTransparentReceive: 1
+  m_RenderingMode: 0
+  m_AccurateGbufferNormals: 0
+--- !u!114 &1467692930502841118
+MonoBehaviour:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 0}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: adb129444bd715c4b85906603ebb7764, type: 3}
+  m_Name: DitheringScanlines
+  m_EditorClassIdentifier: 
+  m_Active: 1
+  settings:
+    Event: 500
+    blitMaterial: {fileID: 2100000, guid: c87f2527588a2c14d8b07b069b33faa9, type: 2}
+    blitMaterialPassIndex: 0
+    destination: 0
+    textureId: _BlitPassTexture

-------------- Unity/Health/Assets/URP/ForwardRenderer.asset.meta --------------
new file mode 100644
index 0000000..8ac6154
@@ -0,0 +1,8 @@
+fileFormatVersion: 2
+guid: 3ac6a6781664b964c967f1e85184e7c8
+NativeFormatImporter:
+  externalObjects: {}
+  mainObjectFileID: 11400000
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 

-------------------- Unity/Health/Assets/URP/URPAsset.asset --------------------
new file mode 100644
index 0000000..a963a46
@@ -0,0 +1,61 @@
+%YAML 1.1
+%TAG !u! tag:unity3d.com,2011:
+--- !u!114 &11400000
+MonoBehaviour:
+  m_ObjectHideFlags: 0
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 0}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: bf2edee5c58d82540a51f03df9d42094, type: 3}
+  m_Name: URPAsset
+  m_EditorClassIdentifier: 
+  k_AssetVersion: 9
+  k_AssetPreviousVersion: 9
+  m_RendererType: 1
+  m_RendererData: {fileID: 0}
+  m_RendererDataList:
+  - {fileID: 11400000, guid: 3ac6a6781664b964c967f1e85184e7c8, type: 2}
+  m_DefaultRendererIndex: 0
+  m_RequireDepthTexture: 0
+  m_RequireOpaqueTexture: 0
+  m_OpaqueDownsampling: 1
+  m_SupportsTerrainHoles: 1
+  m_SupportsHDR: 1
+  m_MSAA: 1
+  m_RenderScale: 1
+  m_MainLightRenderingMode: 1
+  m_MainLightShadowsSupported: 1
+  m_MainLightShadowmapResolution: 2048
+  m_AdditionalLightsRenderingMode: 1
+  m_AdditionalLightsPerObjectLimit: 4
+  m_AdditionalLightShadowsSupported: 0
+  m_AdditionalLightsShadowmapResolution: 2048
+  m_AdditionalLightsShadowResolutionTierLow: 256
+  m_AdditionalLightsShadowResolutionTierMedium: 512
+  m_AdditionalLightsShadowResolutionTierHigh: 1024
+  m_ShadowDistance: 50
+  m_ShadowCascadeCount: 1
+  m_Cascade2Split: 0.25
+  m_Cascade3Split: {x: 0.1, y: 0.3}
+  m_Cascade4Split: {x: 0.067, y: 0.2, z: 0.467}
+  m_ShadowDepthBias: 1
+  m_ShadowNormalBias: 1
+  m_SoftShadowsSupported: 0
+  m_UseSRPBatcher: 1
+  m_SupportsDynamicBatching: 0
+  m_MixedLightingSupported: 1
+  m_DebugLevel: 0
+  m_UseAdaptivePerformance: 1
+  m_ColorGradingMode: 0
+  m_ColorGradingLutSize: 32
+  m_UseFastSRGBLinearConversion: 0
+  m_ShadowType: 1
+  m_LocalShadowsSupported: 0
+  m_LocalShadowsAtlasResolution: 256
+  m_MaxPixelLights: 0
+  m_ShadowAtlasResolution: 256
+  m_ShaderVariantLogLevel: 0
+  m_ShadowCascades: 0

----------------- Unity/Health/Assets/URP/URPAsset.asset.meta -----------------
new file mode 100644
index 0000000..68f3b8e
@@ -0,0 +1,8 @@
+fileFormatVersion: 2
+guid: 434ed0f71bf37024c9207e89ce55e43b
+NativeFormatImporter:
+  externalObjects: {}
+  mainObjectFileID: 11400000
+  userData: 
+  assetBundleName: 
+  assetBundleVariant: 

------------- Unity/Health/ProjectSettings/GraphicsSettings.asset -------------
index c165afb..087c1a0 100644
@@ -39,7 +39,7 @@ GraphicsSettings:
   - {fileID: 10783, guid: 0000000000000000f000000000000000, type: 0}
   m_PreloadedShaders: []
   m_SpritesDefaultMaterial: {fileID: 10754, guid: 0000000000000000f000000000000000, type: 0}
-  m_CustomRenderPipeline: {fileID: 0}
+  m_CustomRenderPipeline: {fileID: 11400000, guid: 434ed0f71bf37024c9207e89ce55e43b, type: 2}
   m_TransparencySortMode: 0
   m_TransparencySortAxis: {x: 0, y: 0, z: 1}
   m_DefaultRenderingPath: 1

-------------- Unity/Health/ProjectSettings/QualitySettings.asset --------------
index d24eb10..75b8579 100644
@@ -201,7 +201,7 @@ QualitySettings:
     skinWeights: 255
     textureQuality: 0
     anisotropicTextures: 2
-    antiAliasing: 2
+    antiAliasing: 0
     softParticles: 1
     softVegetation: 1
     realtimeReflectionProbes: 1
@@ -220,7 +220,7 @@ QualitySettings:
     asyncUploadBufferSize: 16
     asyncUploadPersistentBuffer: 1
     resolutionScalingFixedDPIFactor: 1
-    customRenderPipeline: {fileID: 0}
+    customRenderPipeline: {fileID: 11400000, guid: 434ed0f71bf37024c9207e89ce55e43b, type: 2}
     excludedTargetPlatforms: []
   m_PerPlatformDefaultQuality:
     Android: 2

----------- Unity/Health/ProjectSettings/SceneTemplateSettings.json -----------
new file mode 100644
index 0000000..6f3e60f
@@ -0,0 +1,167 @@
+{
+    "templatePinStates": [],
+    "dependencyTypeInfos": [
+        {
+            "userAdded": false,
+            "type": "UnityEngine.AnimationClip",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEditor.Animations.AnimatorController",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.AnimatorOverrideController",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEditor.Audio.AudioMixerController",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.ComputeShader",
+            "ignore": true,
+            "defaultInstantiationMode": 1,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Cubemap",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.GameObject",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEditor.LightingDataAsset",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": false
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.LightingSettings",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Material",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEditor.MonoScript",
+            "ignore": true,
+            "defaultInstantiationMode": 1,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.PhysicMaterial",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.PhysicsMaterial2D",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Rendering.PostProcessing.PostProcessProfile",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Rendering.PostProcessing.PostProcessResources",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Rendering.VolumeProfile",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEditor.SceneAsset",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": false
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Shader",
+            "ignore": true,
+            "defaultInstantiationMode": 1,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.ShaderVariantCollection",
+            "ignore": true,
+            "defaultInstantiationMode": 1,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Texture",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Texture2D",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        },
+        {
+            "userAdded": false,
+            "type": "UnityEngine.Timeline.TimelineAsset",
+            "ignore": false,
+            "defaultInstantiationMode": 0,
+            "supportsModification": true
+        }
+    ],
+    "defaultDependencyTypeInfo": {
+        "userAdded": false,
+        "type": "<default_scene_template_dependencies>",
+        "ignore": false,
+        "defaultInstantiationMode": 1,
+        "supportsModification": true
+    },
+    "newSceneOverride": 0
+}
\ No newline at end of file

------------ Unity/Health/ProjectSettings/URPProjectSettings.asset ------------
new file mode 100644
index 0000000..3077404
@@ -0,0 +1,15 @@
+%YAML 1.1
+%TAG !u! tag:unity3d.com,2011:
+--- !u!114 &1
+MonoBehaviour:
+  m_ObjectHideFlags: 61
+  m_CorrespondingSourceObject: {fileID: 0}
+  m_PrefabInstance: {fileID: 0}
+  m_PrefabAsset: {fileID: 0}
+  m_GameObject: {fileID: 0}
+  m_Enabled: 1
+  m_EditorHideFlags: 0
+  m_Script: {fileID: 11500000, guid: 247994e1f5a72c2419c26a37e9334c01, type: 3}
+  m_Name: 
+  m_EditorClassIdentifier: 
+  m_LastMaterialVersion: 4


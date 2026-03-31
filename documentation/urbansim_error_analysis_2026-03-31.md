# UrbanSim Runtime Error Analysis and Fix Log (2026-03-31)

## Scope
This document records:
- what errors appeared while launching `urbansim/envs/separate_envs/random_env.py`,
- why each error happened,
- how each error was fixed,
- what warnings remain,
- and what is now verified to work.

The debugging was done directly in the same workspace and conda env:
- env: `urbansim` (Python 3.11)
- date: 2026-03-31
- target script: `urbansim/envs/separate_envs/random_env.py`

---

## 1) Initial Errors and Root Causes

### Error A: `PreTrainedPolicyActionCfg.__init__() got an unexpected keyword argument 'align_heading_with_velocity'`

Observed in robot action config import path.

### Why it happened
Your robot config passed a field that does not exist in your installed/local `PreTrainedPolicyActionCfg` API version.

- The config used `align_heading_with_velocity=True`.
- The available class signature in this codebase version does not define that parameter.

### Fix
Removed `align_heading_with_velocity` from all affected robot navigation action configs:
- [urbansim/primitives/robot/unitree_go2.py](/home/howardhan/urban-sim/urbansim/primitives/robot/unitree_go2.py#L124)
- [urbansim/primitives/robot/unitree_g1.py](/home/howardhan/urban-sim/urbansim/primitives/robot/unitree_g1.py#L187)
- [urbansim/primitives/robot/anymal_c.py](/home/howardhan/urban-sim/urbansim/primitives/robot/anymal_c.py#L58)

---

### Error B: missing functions in navigation config (`advanced_generated_commands`, `rgbd_processed`, `moving_towards_goal_reward`, `target_vel_reward`, `arrive`, `illegal_contact`)

Observed during import/build of `random_env_cfg.py`.

### Why it happened
`random_env_cfg.py` expected newer/different IsaacLab task API exports than what your installed runtime exposes.

This was a version mismatch between:
- UrbanSim config assumptions
- installed IsaacLab/IsaacLab tasks package API surface

### Fix
Added compatibility helper functions in:
- [urbansim/primitives/navigation/random_env_cfg.py](/home/howardhan/urban-sim/urbansim/primitives/navigation/random_env_cfg.py#L32)

And rewired observation/reward/termination terms to these compatibility shims:
- policy observation: [random_env_cfg.py](/home/howardhan/urban-sim/urbansim/primitives/navigation/random_env_cfg.py#L280)
- sensor observation: [random_env_cfg.py](/home/howardhan/urban-sim/urbansim/primitives/navigation/random_env_cfg.py#L286)
- rewards: [random_env_cfg.py](/home/howardhan/urban-sim/urbansim/primitives/navigation/random_env_cfg.py#L333)
- terminations: [random_env_cfg.py](/home/howardhan/urban-sim/urbansim/primitives/navigation/random_env_cfg.py#L347)

---

### Error C: `SceneCfg object has no attribute clone_in_fabric`

Observed while creating `UrbanScene` via IsaacLab interactive scene init.

### Why it happened
Your `UrbanSceneCfg` did not include `clone_in_fabric`, but the installed IsaacLab scene config expects that field.

### Fix
Added `clone_in_fabric: bool = False` in:
- [urbansim/scene/urban_scene_cfg.py](/home/howardhan/urban-sim/urbansim/scene/urban_scene_cfg.py#L59)

---

### Error D: `ValueError: No available triangulation engine!` from `trimesh.creation.extrude_polygon`

Observed during procedural scene mesh generation.

### Why it happened
`trimesh` needs an external triangulation backend. None of the supported engines were installed in env at first.

### Fix
Installed backend:
- `pip install mapbox-earcut`

---

### Error E: `ModuleNotFoundError: No module named 'manifold3d'` from trimesh boolean intersection

Observed later in procedural generation while running mesh boolean operations.

### Why it happened
`trimesh.boolean.intersection` attempted to use manifold backend, but `manifold3d` was missing.

### Fix
Installed backend:
- `pip install manifold3d`

---

### Error F: `RuntimeError: Accessed invalid null prim` on `prim.SetActive(False)`

Observed in multiple places in `urban_scene.py`.

### Why it happened
Code attempted to deactivate USD prims that do not always exist in every generation path.
Calling `SetActive(False)` on invalid/null prim raises runtime error.

### Fix
Guarded deactivation with validity checks (`if prim and prim.IsValid():`) in `urban_scene.py`, including paths around:
- [urban_scene.py](/home/howardhan/urban-sim/urbansim/scene/urban_scene.py#L783)
- [urban_scene.py](/home/howardhan/urban-sim/urbansim/scene/urban_scene.py#L1165)

---

## 2) CUDA / Warp Error Interpretation

### Message
`Warp CUDA error: Failed to get driver entry point 'cuDeviceGetUuid' ...`

### What was verified
- `nvidia-smi` shows working driver/GPU in host environment.
- standalone Warp import/init in conda env succeeded (`warp 1.12.0`, CUDA device visible).

### Why this can still appear
This warning appears from Omniverse/Isaac extension startup path and can be emitted even when the full run proceeds.
In later runs after fixes, the program continued well past startup and into environment generation despite this warning.

In this debugging session, this message was **not** the blocking crash after code/env fixes.

---

## 3) Warnings That Remain (Non-Blocking)

These still appear and are informational or environment-quality warnings:

- `pygame pkg_resources is deprecated`  
  Compatibility warning from pygame/setuptools deprecation timeline.

- `jax: etils.epath was not found. Using pathlib`  
  Fallback behavior, not fatal.

- Isaac/Omniverse warnings about render interval, diffuse color defaults, and some material parameter conversion warnings.

These did not become hard blockers in the fixed run path.

---

## 4) Verification Summary

After applying the above fixes:
- import-time API mismatches were resolved,
- scene config mismatch (`clone_in_fabric`) resolved,
- triangulation and boolean backend errors resolved,
- null-prim crashes in deactivation paths were guarded,
- `random_env.py` progressed through scene creation and substantially further runtime stages than before.

---

## 5) Files Changed

- [urbansim/primitives/robot/unitree_go2.py](/home/howardhan/urban-sim/urbansim/primitives/robot/unitree_go2.py)
- [urbansim/primitives/robot/unitree_g1.py](/home/howardhan/urban-sim/urbansim/primitives/robot/unitree_g1.py)
- [urbansim/primitives/robot/anymal_c.py](/home/howardhan/urban-sim/urbansim/primitives/robot/anymal_c.py)
- [urbansim/primitives/navigation/random_env_cfg.py](/home/howardhan/urban-sim/urbansim/primitives/navigation/random_env_cfg.py)
- [urbansim/scene/urban_scene_cfg.py](/home/howardhan/urban-sim/urbansim/scene/urban_scene_cfg.py)
- [urbansim/scene/urban_scene.py](/home/howardhan/urban-sim/urbansim/scene/urban_scene.py)

Environment package additions:
- `mapbox-earcut`
- `manifold3d`

---

## 6) Practical Takeaway

Most failures were not a single bug, but a compatibility stack:
1. config expected newer/different APIs,
2. scene config missing a field required by current IsaacLab,
3. missing mesh backends in Python env,
4. assumptions that certain USD prims always exist.

Fixing each layer in order converted repeated early crashes into successful deep runtime progress.


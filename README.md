# Video Driver Summary (video-driver-summary.sh)

A simple shell script for **GhostBSD** and **FreeBSD** (X11) that provides a summary of the active video driver, kernel module, GPU, and OpenGL renderer. It helps users quickly determine what video driver is currently in use on their system.

## Features

- ✅ Detects GPU information using `pciconf`
- ✅ Displays loaded kernel modules related to graphics
- ✅ Parses `Xorg.0.log` to identify the X11 driver in use
- ✅ Displays OpenGL renderer via `glxinfo`
- ✅ Color-coded output for readability

## Requirements

- A terminal that supports ANSI color escape sequences
- `glxinfo` (from `mesa-demos`, optional but recommended)

### Install `glxinfo` (optional)

```sh
sudo pkg install mesa-demos
```

## Usage

1. Download the script:

```sh
curl -O https://yourdomain.com/video-driver-summary.sh
```

2. Make it executable:

```sh
chmod +x video-driver-summary.sh
```

3. Run the script:

```sh
./video-driver-summary.sh
```

Or explicitly use `bash` if needed:

```sh
bash ./video-driver-summary.sh
```

## Example Output

```text
==== GPU Information (pciconf) ====
NVIDIA Corporation
GeForce GT 1030

==== Kernel Modules Loaded (kldstat) ====
nvidia.ko
nvidia-modeset.ko

==== X11 Driver Info (/var/log/Xorg.0.log) ====
Loading /usr/local/lib/xorg/modules/drivers/nvidia_drv.so

==== OpenGL Renderer (glxinfo) ====
OpenGL renderer string: NVIDIA GeForce GT 1030/PCIe/SSE2
```

## Notes

- Designed for systems running **X11**, not Wayland.
- Should work on GhostBSD, FreeBSD, and any X11-based FreeBSD variant.

## License

MIT License – free to use, modify, and distribute.

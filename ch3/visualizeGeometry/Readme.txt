# VisualizeGeometry

This project demonstrates the use of Pangolin for 3D visualisation, specifically to display different representations of the transformation between the camera and the world (`T_w_c`). The UI provides a real-time visualisation of rotation matrices, translation vectors, Euler angles, and quaternions.

## Requirements

- **Pangolin** (for visualisation)
- **Eigen3** (for linear algebra)
- **GLEW** (for OpenGL extensions)

## Installation

### Step 1: Install Dependencies
Before compiling Pangolin, install the required dependencies:

```bash
sudo apt-get update
sudo apt-get install libglew-dev cmake build-essential

## Usage Instructions

### UI Panel
Displays different representations of the camera-to-world transformation (`T_w_c`), including:

- **Rotation Matrix**
- **Translation Vector**
- **Euler Angles** (Roll-Pitch-Yaw order)
- **Quaternion**

### Mouse Controls

- **Left Button**: Move the camera.
- **Right Button**: Rotate around the object.
- **Middle Button**: Rotate the camera itself.
- **Left + Right Button**: Roll the view.

### Coordinate System

- **X-axis**: Right (Red line)
- **Y-axis**: Up (Green line)
- **Z-axis**: Back (Blue line)

At the start, the camera is positioned at `(3,3,3)` and looks at the origin `(0,0,0)`.

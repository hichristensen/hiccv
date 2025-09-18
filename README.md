# OAK-D Camera Viewer

A Python script to read images from an OAK-D camera and display them in real-time windows.

## Features

- Real-time display of RGB, left, and right camera streams
- Save current frames with timestamp
- Clean shutdown and resource management
- Error handling for missing dependencies

## Prerequisites

1. **OAK-D Camera**: Make sure your OAK-D camera is connected via USB
2. **Python 3.7+**: The script requires Python 3.7 or higher
3. **DepthAI**: The OAK-D camera uses the DepthAI framework

## Installation

1. Install the required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Or install manually:
   ```bash
   pip install depthai opencv-python numpy
   ```

## Usage

1. Connect your OAK-D camera to your computer via USB
2. Run the script:
   ```bash
   python oak_d_camera_viewer.py
   ```

3. The script will open three windows:
   - **OAK-D RGB Camera**: Color camera feed
   - **OAK-D Left Camera**: Left monochrome camera feed
   - **OAK-D Right Camera**: Right monochrome camera feed

## Controls

- **'q'**: Quit the application
- **'s'**: Save current frames from all cameras with timestamp

## Camera Specifications

- **RGB Camera**: 1080p resolution, downscaled to 640x360 for display
- **Left/Right Cameras**: 400p monochrome cameras
- **Frame Rate**: 30 FPS for all cameras

## Troubleshooting

1. **"DepthAI library not found"**: Install DepthAI using `pip install depthai`
2. **"Error starting camera"**: 
   - Ensure the OAK-D camera is properly connected
   - Check USB cable and port
   - Try reconnecting the camera
3. **Permission errors**: On Linux, you may need to add your user to the `video` group

## File Structure

```
.
├── oak_d_camera_viewer.py  # Main script
├── requirements.txt        # Python dependencies
└── README.md              # This file
```

## Output Files

When you press 's' to save frames, the following files will be created:
- `oak_d_rgb_YYYYMMDD_HHMMSS.jpg`: RGB camera frame
- `oak_d_left_YYYYMMDD_HHMMSS.jpg`: Left camera frame  
- `oak_d_right_YYYYMMDD_HHMMSS.jpg`: Right camera frame

## License

This script is provided as-is for educational and development purposes. 
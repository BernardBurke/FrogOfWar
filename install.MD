# The Frog of War: AI Avatar Pipeline

A dual-engine text-to-video pipeline utilizing local Qwen-TTS generation alongside SadTalker (for humanoid 3D meshes) and Wav2Lip (for stylized 2D 512x512 avatars).

## Prerequisites
- Linux OS (Tested on Mint/Ubuntu)
- NVIDIA GPU with CUDA support
- Miniconda / Anaconda installed

## 1. Environment Setup (Wav2Lip)
To avoid dependency conflicts with modern PyTorch and deprecated `numpy` aliases, build a dedicated Python 3.8 environment.

```bash
# Create and activate the environment
conda create -n wav2lip python=3.8 -y
conda activate wav2lip

# Install Core Engine and FFmpeg
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
conda install -c conda-forge ffmpeg -y

# Install Python dependencies
pip install -r requirements.txt

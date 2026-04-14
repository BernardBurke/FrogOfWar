Here is a comprehensive `README.md` for the repository. It highlights the unique custom nature of the pipeline (especially the face-detector bypass) and provides clear instructions for both GPU and CPU environments. 

You can copy and paste this directly into a new `README.md` file in your root directory.

```markdown
# The Frog of War 🐸
**A Custom Text-to-Video AI Avatar Pipeline for Non-Human Faces**

The Frog of War is a specialized, dual-engine AI video pipeline. It combines local Text-to-Speech (TTS) generation with a modified version of the [Wav2Lip](https://github.com/Rudrabha/Wav2Lip) engine. 

Standard 2D face detectors completely fail on stylized, non-human illustrative assets (like wide-mouthed cyberpunk amphibians). This repository features a customized inference pipeline that bypasses traditional facial recognition, utilizing a hardcoded matrix to force precise lip-sync animations onto non-standard geometry.

## 🚀 Features
* **Non-Human Face Bypass:** Custom modifications to `inference.py` to animate assets that standard facial recognition rejects.
* **Modular TTS:** Supports high-fidelity generation via Qwen-TTS, or lightweight CPU-friendly generation via Kokoro.
* **Hardware Flexible:** Includes dedicated execution scripts for both CUDA-accelerated workstations and CPU-only environments.

## 📋 Prerequisites
* Linux OS (Tested on Ubuntu/Mint)
* Miniconda or Anaconda
* (Optional) NVIDIA GPU with CUDA support for rapid generation

## 🛠️ Installation

*For complete, step-by-step environment instructions, see the included [install.MD](install.MD).*

**1. Create the Environment**
```bash
conda create -n wav2lip python=3.8 -c conda-forge --override-channels -y
conda activate wav2lip
```

**2. Install Core Dependencies**
*For NVIDIA GPUs:*
```bash
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia -y
```
*For CPU-Only environments:*
```bash
conda install pytorch torchvision torchaudio cpuonly -c pytorch -y
```

**3. Install Libraries & FFmpeg**
```bash
conda install -c conda-forge ffmpeg -y
pip install -r requirements.txt
```

**4. Download Model Weights**
You must manually download the core neural network weights. Run these commands from the root directory:
```bash
mkdir -p Wav2Lip/checkpoints
wget "[https://huggingface.co/camenduru/Wav2Lip/resolve/main/checkpoints/wav2lip_gan.pth](https://huggingface.co/camenduru/Wav2Lip/resolve/main/checkpoints/wav2lip_gan.pth)" -O Wav2Lip/checkpoints/wav2lip_gan.pth

# Ensure the face detection structure exists
mkdir -p Wav2Lip/face_detection/detection/sfd
```

## 🎮 Usage

### The Bounding Box Hack
To animate a specific non-human face, the avatar image must be a perfect 512x512 square. 
The bounding box is currently hardcoded in `Wav2Lip/inference.py` to perfectly target the lower-half mouth region of the primary asset:
```python
# Bypass standard detection and force animation matrix
rect = [100, 50, 412, 300]
```

### Running the Animation
You can trigger the pipeline using the included bash scripts. These scripts automatically source the Conda environment, navigate to the correct directories, and execute the inference engine with optimized padding.

**For GPU Workstations:**
```bash
./run_animation.sh
```

**For CPU-Only Machines (using Kokoro TTS):**
```bash
./run_animation_noqwen.sh
```

Outputs will be saved to the root directory as `cyberfrog_final.mp4`.

## 🏗️ Repository Structure
* `Wav2Lip/` - The modified lip-sync generation engine.
* `SadTalker/` - Embedded secondary engine for standard 3D humanoid meshes.
* `run_animation.sh` - Standard execution script.
* `run_animation_noqwen.sh` - CPU-optimized execution script.
* `requirements.txt` - Strictly pinned Python dependencies.
* `install.MD` - Detailed setup guide.

## 🙏 Acknowledgements
This pipeline builds upon the incredible open-source work of the [Wav2Lip](https://github.com/Rudrabha/Wav2Lip) and [SadTalker](https://github.com/OpenTalker/SadTalker) teams.
```

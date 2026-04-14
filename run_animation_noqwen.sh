#!/bin/bash

# 1. Source Conda for the subshell 
source ~/miniconda3/etc/profile.d/conda.sh

# 2. Activate the environment
conda activate wav2lip

# 3. Explicitly move into the Wav2Lip engine directory
cd ~/projects/personal/FrogOfWar/Wav2Lip

# 4. Run the animation (Fixed the .png extension!)
python inference.py \
  --checkpoint_path checkpoints/wav2lip_gan.pth \
  --face '/home/ben/projects/personal/FrogOfWar/The Frog of war.png' \
  --audio ~/scratchpad/shared/output.wav \
  --outfile ../cyberfrog_final.mp4 \
  --pads 0 20 0 0

echo "🐸 Frog of War animation complete!"

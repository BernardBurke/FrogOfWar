cd Wav2Lip

# Download official Wav2Lip GAN weights
wget "[https://huggingface.co/camenduru/Wav2Lip/resolve/main/checkpoints/wav2lip_gan.pth](https://huggingface.co/camenduru/Wav2Lip/resolve/main/checkpoints/wav2lip_gan.pth)" -O checkpoints/wav2lip_gan.pth

# Create Face Detection directory and download s3fd weights
mkdir -p face_detection/detection/sfd
wget "[https://www.adrianbulat.com/downloads/python-fan/s3fd-619a316812.pth](https://www.adrianbulat.com/downloads/python-fan/s3fd-619a316812.pth)" -O face_detection/detection/sfd/s3fd.pth

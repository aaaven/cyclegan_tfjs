# Git Clone
```
cd ~
git clone https://github.com/caohuiyan/cyclegan_tfjs
```

# Train

## - Upload training cdoe
```
scp -r ~/cyclegan_tfjs/train colfax:/~/
```

## - Login Intel AI DevCloud
```
ssh colfax
```

## - Log in Compute Node and Setup Environment
- Log in Compute Node
```bash
qsub -l walltime=24:00:00 -I
```
- Set up environment with conda and environment.yml:
```bash
cd cyclegan_tfjs
conda env create -f environment.yml
```
- Check and Activate Environment
```bash
source activate cyclegan_tf1
```
- Download Dataset
```bash
sh ./download_dataset.sh monet2photo
```

## - Log in log-in-node and Start the training
- Log in log-in-node with a new termial window
```bash
ssh colfax
```
- Use qsub command to summit the training task
```bash
qsub train_cyclegan_tf
```

## - Download checkpoints from DevCloud
Execute following command on your own laptop
```
scp -r colfax:/~/train/outputs ~/cyclegan_tfjs/train
```

# Inference

## - Install and Setup OpenVINO environment
### Download: https://software.intel.com/en-us/openvino-toolkit/choose-download
### Install: https://software.intel.com/en-us/openvino-toolkit/documentation/get-started

## Convert models
```
cd ~/cyclegan_tfjs/inference
sh ./generate_model.sh
```

## Run inference
```
cd ~/cyclegan_tfjs/inference/tfjs

sudo npm install http-server -g

sudo http-server

http://127.0.0.1:8080

```


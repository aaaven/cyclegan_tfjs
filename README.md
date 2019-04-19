# 1. Git Clone
```
cd ~
git clone https://github.com/caohuiyan/cyclegan_tfjs
```

# 2. Train on Intel AI DevCloud

## 2.1 Upload training code
```
scp -r ~/cyclegan_tfjs/train colfax:/home/uxxxxx
```

## 2.2 Login Intel AI DevCloud
```
ssh colfax
```

## 2.3 Login Compute Node and Setup Environment
- Login Compute Node
```bash
qsub -l walltime=24:00:00 -I
```
- Setup environment with conda and environment.yml:
```bash
cd train
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

## 2.4 Exit Compute Node, and back to log-in-node
```bash
exit
```

## 2.5 Submit training job
```bash
cd train
qsub train_cyclegan_tf
```
The training will take more than 48 hours, please do following steps after the training finishes (200 epoches by default).

## 2.6 Download checkpoints from DevCloud
Execute following command on your own laptop
```
scp -r colfax:/home/uxxxxx/train/outputs ~/cyclegan_tfjs/train
```

# 3. Inference

## 3.1 Install tensorflowjs
```
pip install tensorflowjs==0.8.0
```

## 3.2 Convert models
```
cd ~/cyclegan_tfjs/inference
sh ./generate_model.sh
```

## 3.3 Run inference
```
cd ~/cyclegan_tfjs/inference/tfjs

sudo npm install http-server -g

sudo http-server

http://127.0.0.1:8080

```


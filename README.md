# 1. Git Clone
```
cd ~
git clone https://github.com/caohuiyan/cyclegan_tfjs
```

# 2. Train on Intel AI DevCloud

## 2.1 Upload training code
```
scp -r ~/cyclegan_tfjs/train colfax:/~/
```

## 2.2 Login Intel AI DevCloud
```
ssh colfax
```

## 2.3 Log in Compute Node and Setup Environment
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

## 2.4 Log in log-in-node and Start the training
- Log in log-in-node with a new termial window
```bash
ssh colfax
```
- Use qsub command to summit the training task
```bash
qsub train_cyclegan_tf
```

## 2.5 Download checkpoints from DevCloud
Execute following command on your own laptop
```
scp -r colfax:/~/train/outputs ~/cyclegan_tfjs/train
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


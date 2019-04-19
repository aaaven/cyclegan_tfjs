# Train

## Gitclone
```
ghttps://github.com/caohuiyan/cyclegan_tfjs.git
```

## 1. Login Intel AI DevCloud
ssh colfax

## Log in Compute Node and Setup Environment
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
## Log in log-in-node and Start the training
- Log in log-in-node with a new termial window
```bash
ssh colfax
```
- Use qsub command to summit the training task
```bash
qsub train_cyclegan_tf
```

# Train

## 1. Login Intel AI DevCloud
ssh colfax

## Gitclone
TODO:

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
source activate cyclegan_tf
```
- Download Dataset
```bash
sh ./download_dataset.sh monet2photo
```

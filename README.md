# 1. Git Clone
```
cd some_path_you_like
git clone https://github.com/aaaven/cyclegan_tfjs.git
```

# 2. Train on Intel AI DevCloud

## 2.1 Upload training code
```
scp -r cyclegan_tfjs/train colfax
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

## 2.4 Exit Compute Node, and Back to log-in-node
```bash
exit
```

## 2.5 Submit training job
```bash
cd train
qsub train_cyclegan_tf
```
The training will take more than 48 hours. The max walltime for training on DevCloud is 24 hours, you will have to resubmit your training job after 24 hours. 

You can use qstat command to check the status of your training job and find the JOB ID.

For output logs, use qpeek:
```
qpeek -o <JOB_ID>
```

Also you can check your checkpoint files in train/outputs/checkpoints/monet2photo


# 3. Port Checkpoints to Tensorflowjs Models

Please do following steps after the training finishes (200 epoches by default).

## 3.1 Download checkpoints from DevCloud
Execute following command in a terminal running on your own laptop, I mean not in the terminal connecting to AI DevCloud.
```
[myname@myhomecomputer ~] scp -r colfax:cyclegan_tfjs/train/outputs ~/cyclegan_tfjs/train
```
## 3.2 Port Checkpoints to Tensorflowjs Models
setup the environment for this:

```
cd ~/cyclegan_tfjs/inference
conda env create -f environment.yml
source activate tfjs
```

## 3.2 Convert models
```
bash generate_model.sh
```

There are actually three substeps:
* Generate graph from checkpoints
* Freeze graph
* convert freezed graph to tfjs models with tfjs_converter

# 4 Inference

``` bash
cd ~/cyclegan_tfjs/inference/tfjs
python -m http.server
```

And go to:
https://localhost::8000



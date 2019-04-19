mkdir outputs

freeze_graph \
    --input_graph=../../train/outputs/checkpoints/monet2photo/cyclegan_tf_monet2photo.pb \
    --input_binary=true \
    --input_checkpoint=../../train/outputs/checkpoints/monet2photo/Epoch_199_672of1072.ckpt \
    --output_node_names="a2b_generator/Tanh" \
    --output_graph=./outputs/frozen_cyclegan_tf_monet2photo.pb

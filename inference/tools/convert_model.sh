tensorflowjs_converter \
    --input_format=tf_frozen_model \
    --output_format=tensorflowjs \
    --output_node_names='a2b_generator/Tanh' \
    ./outputs/frozen_cyclegan_tf_monet2photo.pb \
    ../tfjs/models

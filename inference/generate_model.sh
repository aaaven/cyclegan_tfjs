## generate graph from checkpoint file
cd ../train
python3 test_save_pb.py
cd ../inference

## freeze graph
cd tools
bash freeze_graph.sh

## convert model
bash convert_model.sh
cd ..

 




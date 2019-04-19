## generate graph from checkpoint file
cd ../train
python3 test_save_pb.py
cd ../inference

## freeze graph
cd tools
./freeze_graph.sh

## convert model
./convert_model.sh
cd ..

 




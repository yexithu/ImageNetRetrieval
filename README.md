# Image Retrieval by Content with Caffe
Caffe based image hashing on imagenet dataset. Originally code-named "ImageNetRetrieval". As course project for _Advanced Data Structure_.

This `README.md` documents contains a manifest of files in this repository, as well as a guide to get our code running. For detailed description of our work, please refer to our documentation.

## Manifest
* a modified and customized copy of [Caffe](http://caffe.berkeleyvision.org/) in `DSH/`
* MATLAB scripts for evaluation and visualization in `matlab/`
* Fine tuning configurations along with some Shell scripts in `ImageNet/`
* CaffeNet binaries and some extra data in `ExData/`
* some Python helper scripts to generate lists of filenames

## Setting up
### Requirements
* MATLAB 2015a or newer
* Python 2.7 interpreter
* Ubuntu 14.04 or higher, or other \*nix environment with GNU tool chain
* Requirements of Caffe
* Active Internet connection

### Build Caffe
You need to build our modified version of Caffe, probably with `make`.

Depending on your environment (whether or not you have a powerful GPU, enough electricity and enough time), modifications on options concerning mode of CPU of GPU may be done in `DSH/tools/extract_features_binary.cpp:57`, as well as in some `*.prototxt` files, by the way.

### Paths
Modifications of absolute paths in `ImageNet/*.prototxt` files have to be done according to location of the model, dataset and queries. Manifest files to contain all the filenames of dataset and queries respectively have to be generated, with Python scripts `getListWithID.py` and `getListWithLabel.py`.

### ImageNet model
We are not that crazy to train an ImageNet model by ourselves. Please follow [instructions from Caffe](http://caffe.berkeleyvision.org/model_zoo.html) to download it.

## fine tuning
If you are confident about your GPU's capacity and are determined to contribute to global warming, make sure everything is set in `ImageNet/finetune_solver.prototxt`, modify paths in `ImageNet/finetune_caffenet.sh` and then execute it.

## hash code extraction
Make sure everything is set in `ImageNet/finetune_net_im.prototxt`, modify paths in `ImageNet/extract_code.sh` and then execute it. Parameters of the command to be executed in this Shell script may have to be modified according to actual size of the query set.

## evaluation
It's time for MATLAB to enter on the stage.

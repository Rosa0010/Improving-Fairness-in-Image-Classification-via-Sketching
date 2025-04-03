#!/bin/bash

# Run train_test_split.py
python face_image_classification\(CelebA\)/train_test_split.py --img_type sketch --sensitive_type gender --num 202599 --csv_dir /app/face_image_classification\(CelebA\)/dataset/list_attr_celeba.csv --data_dir /app/face_image_classification\(CelebA\)/dataset/ --img_dir /app/face_image_classification\(CelebA\)/dataset/img_align_celeba/ 

# Run Grey.py
#python face_image_classification\(CelebA\)/Grey.py --sensitive_type gender

# Run train_resnet.py for training
# python face_image_classification\(CelebA\)/train_resnet.py --target xxx --img_type xxx --sensitive_type xxx --fairloss x --batch_size x --max_epochs_stop x --num_epochs x --learning_rate x

# Run train_resnet.py for testing
python face_image_classification\(CelebA\)/train_resnet.py --isTrain 0 --target smile --img_type sketch --sensitive_type gender --fairloss 1 --data_dir /app/face_image_classification\(CelebA\)/dataset/ 

import tensorflow as tf
import matplotlib.pyplot as plt
import os,os.path
import random
import numpy as np
import shutil

train_dir = "./train2"
train_dokdo_dir = os.path.join(train_dir,'Dokdo')
train_hos_dir = os.path.join(train_dir,'Hospital')
train_am_dir = os.path.join(train_dir,'America')
train_sc_dir = os.path.join(train_dir,'School')
train_mon_dir = os.path.join(train_dir,'Mon')
train_tue_dir = os.path.join(train_dir,'Tue')
train_wed_dir = os.path.join(train_dir,'Wed')
train_thu_dir = os.path.join(train_dir,'Thu')
train_fri_dir = os.path.join(train_dir,'Fri')
train_sat_dir = os.path.join(train_dir,'Sat')
train_sun_dir = os.path.join(train_dir,'Sun')
train_Eight_dir = os.path.join(train_dir,'Eight')
train_Five_dir = os.path.join(train_dir,'Five')
train_Four_dir = os.path.join(train_dir,'Four')
train_Nine_dir = os.path.join(train_dir,'Nine')
train_One_dir = os.path.join(train_dir,'One')
train_Seven_dir = os.path.join(train_dir,'Seven')
train_Six_dir = os.path.join(train_dir,'Six')
train_Three_dir = os.path.join(train_dir,'Three')
train_Two_dir = os.path.join(train_dir,'Two')
train_Zero_dir = os.path.join(train_dir,'Zero')

test_dir = "./test2"
test_dokdo_dir = os.path.join(test_dir,'Dokdo')
test_hos_dir = os.path.join(test_dir,'Hospital')
test_am_dir = os.path.join(test_dir,'America')
test_sc_dir = os.path.join(test_dir,'School')
test_mon_dir = os.path.join(test_dir,'Mon')
test_tue_dir = os.path.join(test_dir,'Tue')
test_wed_dir = os.path.join(test_dir,'Wed')
test_thu_dir = os.path.join(test_dir,'Thu')
test_fri_dir = os.path.join(test_dir,'Fri')
test_sat_dir = os.path.join(test_dir,'Sat')
test_sun_dir = os.path.join(test_dir,'Sun')
test_Eight_dir = os.path.join(test_dir,'Eight')
test_Five_dir = os.path.join(test_dir,'Five')
test_Four_dir = os.path.join(test_dir,'Four')
test_Nine_dir = os.path.join(test_dir,'Nine')
test_One_dir = os.path.join(test_dir,'One')
test_Seven_dir = os.path.join(test_dir,'Seven')
test_Six_dir = os.path.join(test_dir,'Six')
test_Three_dir = os.path.join(test_dir,'Three')
test_Two_dir = os.path.join(test_dir,'Two')
test_Zero_dir = os.path.join(test_dir,'Zero')

from tensorflow.keras.preprocessing.image import ImageDataGenerator
import tensorflow as tf

# gpus = tf.config.experimental.list_physical_devices('GPU')
# if gpus:
#     try:
#         # Currently, memory growth needs to be the same across GPUs
#         for gpu in gpus:
#             tf.config.experimental.set_memory_growth(gpu, True)
#         logical_gpus = tf.config.experimental.list_logical_devices('GPU')
#         print(len(gpus), "Physical GPUs,", len(logical_gpus), "Logical GPUs")
#     except RuntimeError as e:
#         # Memory growth must be set before GPUs have been initialized
#         print(e)

train_datagen = ImageDataGenerator(rescale=1./255)
test_datagen = ImageDataGenerator(rescale=1./255)

#이미지 전처리
#폴더에 있는 이미지를 전처리
train_generator = train_datagen.flow_from_directory(
    #폴더명
    train_dir,
    target_size = (32,32),
    batch_size = 30,
    color_mode = 'grayscale',
    class_mode='categorical'
)

test_generator = test_datagen.flow_from_directory(
    #폴더명
    test_dir,
    target_size = (32,32),
    batch_size = 30,
    color_mode = 'grayscale',
    class_mode='categorical'
)

from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten, Dropout
from tensorflow.keras.layers import Conv2D, MaxPooling2D

model1 = Sequential()

model1.add(Conv2D(filters=32,
                  kernel_size=(3,3),
                  input_shape=(32,32,1),
                  padding="same",
                  activation='relu'))
model1.add(MaxPooling2D(pool_size=(2,2)))

model1.add(Conv2D(filters=64,
                  kernel_size=(3,3),
                  padding="same",
                  activation='relu'))
model1.add(MaxPooling2D(pool_size=(2,2)))

model1.add(Conv2D(filters=128,
                  kernel_size=(3,3),
                  padding="same",
                  activation='relu'))
model1.add(MaxPooling2D(pool_size=(2,2)))

model1.add(Conv2D(filters=256,
                  kernel_size=(3,3),
                  padding="same",
                  activation='relu'))
model1.add(MaxPooling2D(pool_size=(2,2)))

model1.add(Flatten())
model1.add(Dense(units=512,activation='relu'))
model1.add(Dropout(0.5))
model1.add(Dense(units=21,activation='softmax'))

model1.summary()

model1.compile(loss='categorical_crossentropy',
               optimizer='adam',
               metrics=['acc'])

h1 = model1.fit_generator(generator=train_generator,
                          epochs=2,
                          validation_data = test_generator)

model1.save("cnn32_model")
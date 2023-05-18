import cv2
import numpy as np
import os
from os import listdir
from os import makedirs
from os.path import isfile, join


face_dirs= os.path.join(os.getcwd(),'faces')
print(face_dirs)


#face_dirs= './faces/'
face_classifier = cv2.CascadeClassifier('./haarcascade_frontalface_default.xml')

#전체 사진에서 얼굴 부위만 잘라 리턴
def face_extractor(img):
    #흑백처리
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    gray = np.array(gray,dtype='uint8')
    #얼굴 찾기
    faces = face_classifier.detectMultiScale(gray)
    #찾는 얼굴이 없으면 None으로 리턴
    if faces is():
        return None

    for(x,y,w,h) in faces:
        cropped_face = img[y:y+h, x:x+w]

    return cropped_face

def face_detector(img, size=0.5):
    gray = cv2.cvtColor(img,cv2.COLOR_BGR2GRAY)
    faces = face_classifier.detectMultiScale(gray)

    if faces is():
        return img,[]

    for(x,y,w,h) in faces:
        cv2.rectangle(img,(x,y),(x+w,y+h),(0,255,255),2)
        roi = img[y:y+h,x:x+w]
        roi = cv2.resize(roi,(200,200))

    return img,roi

from flask import Flask
from flask import request, redirect, render_template
from flask_cors import CORS
from tensorflow.keras.models import load_model
import io
import time

app = Flask(__name__)
CORS(app)

@app.route("/face/train" , methods=["GET",'POST'])
def train_pictures():
    num = request.form['data']
    if not os.path.isdir(face_dirs+'/'+num):
        os.makedirs(face_dirs+'/'+num, exist_ok=True)
    cap = cv2.VideoCapture(0)

    #저장할 이미지 카운트 변수
    count = 0

    while True:
        #카메라로부터 사진 1장 얻기1장 얻기
        ret, frame = cap.read()
        if face_extractor(frame) is not None:
            count+=1
            face = cv2.resize(face_extractor(frame),(200,200))
            face = cv2.cvtColor(face, cv2.COLOR_BGR2GRAY)

            file_num_path = './faces/'+num+'/'+num+str(count)+'.jpg'
            file_dirs = './faces/'+num+'/'
            print(file_dirs)
            cv2.imwrite(file_num_path,face)

            cv2.putText(face,str(count),(50,50),cv2.FONT_HERSHEY_COMPLEX,1,(0,255,0),2)
            cv2.imshow('Face Cropper',face)
        else:
            print("Face not Found")
            pass

        if cv2.waitKey(1)==13 or count==50:
            break
    cap.release()
    cv2.destroyAllWindows()
    print("Collecting Samples Complete")

    #faces폴더에 있는 파일 리스트 얻기
    file_list = [file for file in os.listdir(file_dirs) if os.path.isfile(join(file_dirs,file))]
    #     print(file_list)
    #데이터와 매칭될 라벨 변수
    training_data,labels = [],[]

    #파일 개수 만큼 루프
    for i,files in enumerate(file_list):
        image_path = file_dirs + file_list[i]
        #         print(image_path)
        #이미지 불러오기
        images = cv2.imread(image_path,cv2.IMREAD_GRAYSCALE)

        #이미지 파일이 아니거나 못 읽어 왔다면 무시
        if images is None:
            continue
        #training_data 리스트에 이미지를 바이트 배열로 추가
        training_data.append(np.asarray(images,dtype=np.uint8))
        #labels 리스트엔 카운트 번호 추가
        labels.append(i)

    if len(labels) == 0:
        print("There is no data to train")
        exit()

    #labels를 32비트 정수로 변환
    labels = np.asarray(labels, dtype=np.int32)
    #모델 생성
    model = cv2.face.LBPHFaceRecognizer_create()
    #학습 시작
    model.train(np.asarray(training_data), np.asarray(labels))
    model.save(num+"face_model.yml")
    return "얼굴 저장 완료"

@app.route("/face/recognition" , methods=["GET",'POST'])
def recognition():
    t_end = time.time()+15
    num = request.form['data']
    cap = cv2.VideoCapture(0)
    model = cv2.face.LBPHFaceRecognizer_create()
    model.read(num+"face_model.yml")
    confidence = 0
    lock_list=[]

    while time.time()<=t_end:

        ret, frame = cap.read()

        image, face = face_detector(frame)

        try:
            face = cv2.cvtColor(face, cv2.COLOR_BGR2GRAY)
            result = model.predict(face)
            #result[1]은 신뢰도 0에 가까울수록 본인이라는 뜻
            if result[1] < 500:
                confidence = int(100*(1-(result[1])/300))
                display_string = str(confidence)+'% Confidence it is user'
            cv2.putText(image,display_string,(100,120),cv2.FONT_HERSHEY_COMPLEX,1,(250,120,255),2)

            if confidence >= 70:
                cv2.putText(image, "Unlocked",(250,450),cv2.FONT_HERSHEY_COMPLEX,1,(0,255,0),2)
                cv2.imshow('Face Cropper',image)
                lock_list.append('Unlocked')

            else:
                cv2.putText(image,"Locked",(250,450),cv2.FONT_HERSHEY_COMPLEX,1,(0,0,255),2)
                cv2.imshow('Face Cropper', image)

        except:
            cv2.putText(image,"Face Not Found",(250,450),cv2.FONT_HERSHEY_COMPLEX,1,(255,0,0),2)
            cv2.imshow('Face Cropper', image)
            pass

        if cv2.waitKey(10)==13:
            break

        if confidence>=70:
            break

    lock_list.append('Locked')
    cap.release()
    cv2.destroyAllWindows()
    return lock_list[0]




if __name__ == "__main__" :
    app.run(host="localhost", port="9500")

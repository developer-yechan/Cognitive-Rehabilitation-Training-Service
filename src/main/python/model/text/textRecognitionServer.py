def preprocessing(filename):
    # 이미지 로드
    import PIL.Image as pilimg
    import numpy as np
    import matplotlib.pyplot as plt

    # 이미지 크기 조절 (32*32)
    from PIL import Image
    import matplotlib.pyplot as plt

    # 흑백이미지로 읽기
    image1 = Image.open(filename).getchannel("A")
    image1 = image1.resize((32, 32))
    imag1_size = image1.size

    # 연산을 하기 위해서 Numpy 배열로 변환
    pix = np.array(image1)
    pix = 255 - pix
    # plt.imshow(pix, cmap="gray")
    # plt.show()

    # 1차원으로 변환
    testimage = pix.reshape(1, 32 , 32, 1)

    # 픽셀값을 0-1 사이 범위로 변환
    testimage = testimage.astype("float32")/255
    return testimage

from flask import Flask
from flask import request, redirect, render_template
from flask_cors import CORS
from tensorflow.keras.models import load_model
import io

app = Flask(__name__)
CORS(app)

model = load_model('./cnn32_model')

@app.route("/draw/predict" , methods=["GET",'POST'])
def what():
    base64_encoded_img = request.form['img'][22:]
    if request.method == 'POST' :
        # base64 decode
        import base64
        import PIL.Image as pilimg

        imgdata = base64.b64decode(base64_encoded_img)
        filename = 'some_image.png' # filename으로 이미지 저장
        with open(filename, 'wb') as img:
            img.write(imgdata)
        # model predict
        df = preprocessing(filename)
        y_prob = model.predict(df)
        pre = y_prob.argmax(axis=1)
        numb = pre[0]

        return str(numb)


if __name__ == "__main__" : # .py 파일에서 main함수 역할
    app.run(host="localhost", port="9600")

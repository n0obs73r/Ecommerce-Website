from flask import Flask, render_template, flash, request, redirect, url_for
import legofy
from PIL import Image
import webcolors

app = Flask(__name__)


@app.route('/')
def home():
    return render_template('index.html', imglb='', bX=2, bY=2, rangeCol=20)


@app.route('/legonizer', methods=['GET', 'POST'])
def legonizer():
    if request.method == "POST":
        imagereq = request.files['imagefile']
        if imagereq:
            imgpath = "static/uploads/"+imagereq.filename
            imagereq.save(imgpath)
            imglb = imagereq.filename
        else:
            return render_template('index.html')

        bY = 2
        bX = 2
        num_of_colors = 20

        palette = legofy.legonize_a(image_filename=imglb, imgpath=imgpath, baseplate_size=(bY, bX), num_of_colors=num_of_colors)
        out_img_path = "outputs/"+imglb[:-4]+"_lego.png"
        return render_template('legonizer.html', imagepath=out_img_path, imglb=imglb, bX=bX, bY=bY, rangeCol=num_of_colors, palette=palette)


@app.route('/legofied', methods=['GET', 'POST'])
def legofied():
    if request.method == "POST":
        imglb = request.form['imglb']
        if imglb == '':
            imagereq = request.files['imagefile']
            imgpath = "static/uploads/"+imagereq.filename
            imagereq.save(imgpath)
            imglb = imagereq.filename
        else:
            imgpath = 'static/uploads/'+imglb
            imagereq = Image.open(imgpath)

        bY = int(request.form['rangeY'])
        bX = int(request.form['rangeX'])
        num_of_colors = int(request.form['rangeCol'])
        p_auto = request.form.get('ckb1')

        user_colors = []
        for i in range(50):
            if int(request.form[f'btn{i}_val']):
                user_colors.append(request.form[f'btn{i}_col'])

        if request.form.get('nxt') == 'Preview':
            if p_auto:
                palette = legofy.legonize_a(image_filename=imglb, imgpath=imgpath, baseplate_size=(bY, bX), num_of_colors=num_of_colors)
            else:
                palette = legofy.legonize_b(image_filename=imglb, imgpath=imgpath, baseplate_size=(bY, bX), user_colors=user_colors)

            out_img_path = "outputs/"+imglb[:-4]+"_lego_gap.png"
            return render_template('legonizer.html', imagepath=out_img_path, imglb=imglb, bX=bX, bY=bY, rangeCol=num_of_colors, palette=palette)
        else:
            if p_auto:
                palette = legofy.legonize_a(image_filename=imglb, imgpath=imgpath, baseplate_size=(bY, bX), num_of_colors=num_of_colors, finalize=True)
            else:
                palette = legofy.legonize_b(image_filename=imglb, imgpath=imgpath, baseplate_size=(bY, bX), user_colors=user_colors, finalize=True)

            out_img_path = "outputs/"+imglb[:-4]+"_lego.png"
            return render_template('final.html', image_filename=imglb, imagepath=out_img_path)


if __name__ == '__main__':
    app.run(debug=True)

from PIL import Image, ImageEnhance, ImageColor, ImageFont, ImageDraw
import numpy as np
import math
# from pandas import DataFrame


def combine_image(tiles, p_size, original_size):
    coord = []
    blank_image = Image.new("RGB", original_size)

    iw = (original_size[1]/p_size[0])
    ih = (original_size[0]/p_size[1])
    for i in range(p_size[0]):
        for ii in range(p_size[1]):
            if i > 0:
                a = 1
            else:
                a = 0
            if ii > 0:
                b = 1
            else:
                b = 0

            coord.append([int(ii*ih)+a, int(i*iw)+b])

    for i in range(len(tiles)):
        # part_img = Image.fromarray(tiles[i])
        blank_image.paste(tiles[i], coord[i])
    return blank_image


def split_image(original_img, p_size):
    im = np.array(original_img)
    M = im.shape[0]//p_size[0]
    N = im.shape[1]//p_size[1]
    size_h = M*p_size[0]
    size_w = N*p_size[1]
    original_size = (size_w, size_h)
    # print(original_img.size, original_size)

    tiles = [im[x:x+M, y:y+N] for x in range(0, size_h, M) for y in range(0, size_w, N)]
    new_tiles = []
    for i in range(len(tiles)):
        new_img = Image.fromarray(tiles[i])  # .astype(np.uint8))
        new_img.save(f'static/outputs/part{i}.png')
        new_tiles.append(new_img)
    return new_tiles, original_size


# def image2baseplate2(img, palette, baseplate_size):
#     img = img.convert('RGB')
#     original_width, original_height = img.size

#     # enhance image
#     eh_obj = ImageEnhance.Brightness(img)  # Contrast Brightness Color Sharpness
#     img = eh_obj.enhance(1.15)

#     # Reduce Image
#     reduced_img = img.resize((baseplate_size[1]*32, baseplate_size[0]*32))

#     # enhance image
#     eh_obj = ImageEnhance.Sharpness(reduced_img)  # Contrast Brightness Color Sharpness
#     enhanced_img = eh_obj.enhance(3.5)

#     # change to dev color scheme
#     dev_img = change_color_scheme(enhanced_img, palette)

#     # create new pallete from color scheme
#     user_palette = make_palette(color_distribution(dev_img)[:num_of_colors])

#     # change to user color scheme
#     user_img = change_color_scheme(enhanced_img, user_palette)
#     print('selected colors:', len(color_distribution(user_img)))

#     # enhance image
#     eh_obj = ImageEnhance.Brightness(user_img)  # Contrast Brightness Color Sharpness
#     small_img = eh_obj.enhance(0.85)

#     # enlarge Image
#     large_img = small_img.resize((original_width, original_height), resample=0)
#     return large_img, small_img


def image2baseplate2(img, palette, baseplate_size):
    img = img.convert('RGB')
    original_width, original_height = img.size

    # Reduce Image
    reduced_img = img.resize((baseplate_size[1]*32, baseplate_size[0]*32))

    # enhance image
    eh_obj = ImageEnhance.Sharpness(reduced_img)  # Contrast Brightness Color Sharpness
    enhanced_img = eh_obj.enhance(3.5)

    # change to user color scheme
    small_img = change_color_scheme2(enhanced_img, palette)
    return small_img, palette


def image2baseplate(img, palette, num_of_colors, baseplate_size):
    img = img.convert('RGB')
    original_width, original_height = img.size

    # Reduce Image
    reduced_img = img.resize((baseplate_size[1]*32, baseplate_size[0]*32))

    # enhance image
    eh_obj = ImageEnhance.Sharpness(reduced_img)  # Contrast Brightness Color Sharpness
    enhanced_img = eh_obj.enhance(3.5)

    # change to dev color scheme
    dev_img = change_color_scheme(enhanced_img, palette)

    # create new pallete from color scheme
    user_palette = make_palette(color_distribution(dev_img)[:num_of_colors])
    num_of_colors = len(user_palette)

    # change to user color scheme
    user_img = change_color_scheme(enhanced_img, user_palette)
    # print('selected colors:', len(color_distribution(user_img)))

    small_img = user_img

    # # enlarge Image
    # large_img = small_img.resize((original_width, original_height), resample=0)
    # return large_img, small_img, num_of_colors, user_palette
    return small_img, num_of_colors, user_palette


def change_color_scheme2(img, palette):
    # load image map
    img_map = np.array(img)
    new_img = []

    # find nearest color to palette
    for i in range(img_map.shape[0]):
        for j in range(img_map.shape[1]):
            ans, ans_diff = closest_color2(img_map[i][j], palette)
            new_img.append(ans)

    # print(new_img)
    small_img = np.reshape(new_img, img_map.shape)

    # convert array to image
    small_img = Image.fromarray(small_img.astype(np.uint8))
    return small_img


def change_color_scheme(img, palette):
    # load image map
    img_map = np.array(img)
    new_img = []

    # find nearest color to palette
    for i in range(img_map.shape[0]):
        for j in range(img_map.shape[1]):
            ans, ans_diff = closest_color(img_map[i][j], palette)
            new_img.append(ans)

    # print(new_img)
    small_img = np.reshape(new_img, img_map.shape)

    # convert array to image
    small_img = Image.fromarray(small_img.astype(np.uint8))
    return small_img


def closest_color2(rgb, palette):
    min_diff = 1000
    nearest_col = [0, 0, 0]
    r, g, b = rgb

    for color in palette:
        cr, cg, cb = color.split(',')
        color_diff = abs(r - int(cr)) + abs(g - int(cg)) + abs(b - int(cb))
        if color_diff < min_diff:
            min_diff = color_diff
            nearest_col = [cr, cg, cb]
    return nearest_col, min_diff


def closest_color(rgb, palette):
    min_diff = 1000
    nearest_col = [0, 0, 0]
    r, g, b = rgb

    for color in palette:
        cr, cg, cb = color
        # color_diff = math.sqrt(abs(r - cr)**2 + abs(g - cg)**2 + abs(b - cb)**2)
        # color_diff = (abs(r - cr)*1.0) + (abs(g - cg)*1.1) + (abs(b - cb)*1.2)
        color_diff = abs(r - cr) + abs(g - cg) + abs(b - cb)
        if color_diff < min_diff:
            min_diff = color_diff
            nearest_col = color

    # print(nearest_col, min_diff)
    return nearest_col, min_diff


def color_distribution(img):
    w, h = img.size
    col_distr = img.getcolors(w*h)
    col_distr.sort(reverse=True)
    return col_distr


def make_palette(col_distr):
    palette = []

    for eachcol in col_distr:
        palette.append(eachcol[1])

    palette = [[i[0], i[1], i[2]] for i in palette]
    # palette = [i for sets in palette for i in sets]
    return palette


def apply_color_overlay(image, color):
    '''Small function to apply an effect over an entire image'''
    overlay_red, overlay_green, overlay_blue = color
    channels = image.split()

    r = channels[0].point(lambda color: overlay_effect(color, overlay_red))
    g = channels[1].point(lambda color: overlay_effect(color, overlay_green))
    b = channels[2].point(lambda color: overlay_effect(color, overlay_blue))

    channels[0].paste(r)
    channels[1].paste(g)
    channels[2].paste(b)

    return Image.merge(image.mode, channels)


def overlay_effect(color, overlay):
    '''Actual overlay effect function'''
    if color < 33:
        return overlay - 100
    elif color > 233:
        return overlay + 100
    else:
        return overlay - 133 + color


def image2lego(thumbnail_image, image_filename, baseplate_size, finalize=False):
    brick_image = Image.open('static/assets/lego_brick.png')

    '''Create a lego version of an image from an image'''
    base_width, base_height = thumbnail_image.size
    brick_width, brick_height = brick_image.size

    gx = int(brick_width/2)
    gy = int(brick_height/2)

    rgb_image = thumbnail_image.convert('RGB')

    if finalize:
        lego_image = Image.new("RGB", ((base_width*brick_width)+(baseplate_size[1]-1), (base_height*brick_height)+(baseplate_size[0]-1)), "white")

    lego_image_gap = Image.new("RGB", ((base_width*brick_width)+((baseplate_size[1]-1)*gx), (base_height*brick_height)+((baseplate_size[0]-1)*gy)), "white")
    base_gaps = [i*32 for i in range(1, 30)]

    for brick_x in range(base_width):
        for brick_y in range(base_height):
            color = rgb_image.getpixel((brick_x, brick_y))
            if brick_x in base_gaps:
                gapx = gx
            else:
                gapx = 0
            if brick_y in base_gaps:
                gapy = gy
            else:
                gapy = 0

            lego_image_gap.paste(apply_color_overlay(brick_image, color), ((brick_x * brick_width)+gapx, (brick_y * brick_height)+gapy))
            if finalize:
                lego_image.paste(apply_color_overlay(brick_image, color), ((brick_x * brick_width), (brick_y * brick_height)))

    lego_image_gap.save(f'static/outputs/{image_filename[:-4]}_lego_gap.png')

    if finalize:
        lego_image.save(f'static/outputs/{image_filename[:-4]}_lego.png')
        return lego_image
    else:
        return lego_image_gap


def image2output(accual_image, num_of_colors, image_filename):
    brick_image = Image.open('static/assets/blank_brick.png')
    accual_width, accual_height = accual_image.size
    brick_width, brick_height = brick_image.size
    color_decode = {}

    rgb_image = accual_image.convert('RGB')
    image_csv = np.zeros((accual_width, accual_height))

    base_image = Image.new("RGB", ((accual_width*brick_width)+(accual_width*2), (accual_height*brick_height)+(accual_height*2)), "white")

    for brick_x in range(accual_width):
        for brick_y in range(accual_height):
            x_coord = (brick_x * brick_width)+(2*brick_x)
            y_coord = (brick_y * brick_height)+(2*brick_y)
            color = rgb_image.getpixel((brick_x, brick_y))
            base_image.paste(apply_color_overlay(brick_image, color), (x_coord, y_coord))

            font = ImageFont.truetype('static/assets/sans_bold.ttf', 12)
            val = str(manu2_palette_find[f'{color[0]}, {color[1]}, {color[2]}'])

            ImageDraw.Draw(base_image).text((x_coord+8, y_coord+8), val, (0, 0, 0), font=font)
            color_decode[val] = color

            image_csv[brick_x][brick_y] = int(val)

    # =================================================================================

    brick_image = Image.open('static/assets/blank_brick_dark.png')
    brick_width, brick_height = brick_image.size

    color_code_img = Image.new("RGB", ((num_of_colors*brick_width)+(num_of_colors*2), brick_height+15), "white")

    for i in range(num_of_colors):
        collist = list(color_decode.keys())
        color_code_img.paste(apply_color_overlay(brick_image, color_decode[collist[i]]), ((i*brick_width)+(i*2), 15))
        ImageDraw.Draw(color_code_img).text(((i*brick_width)+(i*2)+8, 0), collist[i], (0, 0, 0), font=font)

    color_code_img.save(f'static/outputs/{image_filename[:-4]}_color_code.png')
    base_image.save(f'static/outputs/{image_filename[:-4]}_output.png')
    np.savetxt(f'static/outputs/{image_filename[:-4]}_csv.csv', image_csv, fmt="%d", delimiter=",")
    return base_image


def auto_crop(img, baseplate_size):
    w, h = img.size
    max_s = max(w, h)
    min_s = min(w, h)
    max_b = max(baseplate_size)
    min_b = min(baseplate_size)

    sw = int((baseplate_size[1]/max_b)*min_s)
    sh = int((baseplate_size[0]/max_b)*min_s)
    # sw = int((baseplate_size[1]/min_b)*min_s)
    # sh = int((baseplate_size[0]/min_b)*min_s)
    # sw = int((max_b/min_b)*min_s)
    # sh = int((max_b/min_b)*min_s)

    if sh > h:
        sh = h
    if sw > w:
        sw = w

    cw, ch, sw, sh = w//2, h//2, sw//2, sh//2

    bbox = (cw-sw, ch-sh, cw+sw, ch+sh)
    cropped_img = img.crop(bbox)
    # cropped_img.save('test/cropped.png')
    return cropped_img


# def auto_crop(img):
#     w, h = img.size
#     s = min(w, h)
#     cw, ch, cs = w//2, h//2, s//2

#     bbox = (cw-cs, ch-cs, cw+cs, ch+cs)
#     cropped_img = img.crop(bbox)
#     # cropped_img.save('test/cropped.png')
#     return cropped_img


def main(image_filename=None, imgpath=None, baseplate_size=(2, 2), num_of_colors=20):
    global manu_palette, manu2_palette, manu2_palette_find
    manu_palette = [28, 28, 28, 255, 255, 255, 255, 125, 224, 67, 37, 99, 231, 172, 128, 188, 114, 63, 238,
                    40, 102, 213, 19, 23, 255, 255, 82, 106, 73, 132, 255, 117, 20, 0, 149, 219, 175, 225,
                    71, 51, 99, 0, 0, 113, 181, 85, 135, 0, 88, 74, 69, 235, 106, 14, 243, 218, 11, 0,
                    77, 143, 156, 156, 156, 118, 153, 166, 88, 114, 70, 204, 71, 167, 186, 187, 241, 215, 215,
                    215, 196, 140, 133, 250, 210, 1, 73, 182, 254, 255, 233, 250, 100, 107, 99, 157, 104, 100,
                    165, 86, 162, 125, 127, 120, 231, 230, 221, 122, 188, 255, 131, 50, 124, 255, 255, 63, 140,
                    86, 81, 113, 115, 170, 49, 127, 67, 172, 14, 23, 32, 96, 61, 72, 61, 103, 239, 169, 74,
                    255, 164, 32, 106, 50, 43, 178, 242, 255, 102, 14, 81, 30, 89, 69]

    manu2_palette = [[244, 244, 244], [208, 206, 201], [178, 180, 178], [140, 138, 136], [100, 100, 100], [22, 22, 22], [0, 187, 220], [175, 205, 215], [139, 190, 232], [126, 147, 167],
                     [62, 135, 203], [0, 94, 184], [51, 63, 72], [0, 53, 80], [190, 202, 234], [221, 121, 117], [197, 70, 68], [218, 41, 28], [177, 162, 202], [142, 127, 174],
                     [236, 208, 181], [240, 196, 160], [250, 170, 141], [248, 173, 109], [229, 158, 109], [189, 154, 122], [181, 129, 80], [255, 105, 0], [166, 85, 35], [107, 53, 41],
                     [105, 63, 35], [78, 53, 36], [120, 78, 144], [248, 229, 154], [213, 200, 151], [239, 182, 97], [255, 209, 0], [255, 163, 0], [229, 155, 220], [177, 78, 181],
                     [174, 164, 111], [174, 184, 98], [181, 189, 0], [239, 215, 229], [94, 126, 41], [231, 147, 183], [207, 87, 138], [51, 85, 37], [45, 200, 77], [0, 154, 68]]

    manu2_palette_find = {'244, 244, 244': 1, '208, 206, 201': 2, '178, 180, 178': 3, '140, 138, 136': 4, '100, 100, 100': 5, '22, 22, 22': 6, '0, 187, 220': 7,
                          '175, 205, 215': 8, '139, 190, 232': 9, '126, 147, 167': 10, '62, 135, 203': 11, '0, 94, 184': 12, '51, 63, 72': 13, '0, 53, 80': 14,
                          '190, 202, 234': 15, '221, 121, 117': 16, '197, 70, 68': 17, '218, 41, 28': 18, '177, 162, 202': 19, '142, 127, 174': 20, '236, 208, 181': 21,
                          '240, 196, 160': 22, '250, 170, 141': 23, '248, 173, 109': 24, '229, 158, 109': 25, '189, 154, 122': 26, '181, 129, 80': 27, '255, 105, 0': 28,
                          '166, 85, 35': 29, '107, 53, 41': 30, '105, 63, 35': 31, '78, 53, 36': 32, '120, 78, 144': 33, '248, 229, 154': 34, '213, 200, 151': 35,
                          '239, 182, 97': 36, '255, 209, 0': 37, '255, 163, 0': 38, '229, 155, 220': 39, '177, 78, 181': 40, '174, 164, 111': 41, '174, 184, 98': 42,
                          '181, 189, 0': 43, '239, 215, 229': 44, '94, 126, 41': 45, '231, 147, 183': 46, '207, 87, 138': 47, '51, 85, 37': 48, '45, 200, 77': 49, '0, 154, 68': 50}

    # image_filename = 'lion.jpg'
    # baseplate_size = (2, 2)
    # num_of_colors = 20

    original_img = Image.open(imgpath)
    cropped_img = auto_crop(original_img, baseplate_size)

    large_img, small_img, num_of_colors = image2baseplate(cropped_img, manu2_palette, num_of_colors, baseplate_size)
    brick_img = image2lego(small_img, image_filename, baseplate_size)
    output_img = image2output(small_img, num_of_colors, image_filename)
    return brick_img


def legonize_a(image_filename=None, imgpath=None, baseplate_size=(2, 2), num_of_colors=20, finalize=False):
    global manu2_palette, manu2_palette_find

    manu2_palette = [[244, 244, 244], [208, 206, 201], [178, 180, 178], [140, 138, 136], [100, 100, 100], [22, 22, 22], [0, 187, 220], [175, 205, 215], [139, 190, 232], [126, 147, 167],
                     [62, 135, 203], [0, 94, 184], [51, 63, 72], [0, 53, 80], [190, 202, 234], [221, 121, 117], [197, 70, 68], [218, 41, 28], [177, 162, 202], [142, 127, 174],
                     [236, 208, 181], [240, 196, 160], [250, 170, 141], [248, 173, 109], [229, 158, 109], [189, 154, 122], [181, 129, 80], [255, 105, 0], [166, 85, 35], [107, 53, 41],
                     [105, 63, 35], [78, 53, 36], [120, 78, 144], [248, 229, 154], [213, 200, 151], [239, 182, 97], [255, 209, 0], [255, 163, 0], [229, 155, 220], [177, 78, 181],
                     [174, 164, 111], [174, 184, 98], [181, 189, 0], [239, 215, 229], [94, 126, 41], [231, 147, 183], [207, 87, 138], [51, 85, 37], [45, 200, 77], [0, 154, 68]]

    manu2_palette_find = {'244, 244, 244': 1, '208, 206, 201': 2, '178, 180, 178': 3, '140, 138, 136': 4, '100, 100, 100': 5, '22, 22, 22': 6, '0, 187, 220': 7,
                          '175, 205, 215': 8, '139, 190, 232': 9, '126, 147, 167': 10, '62, 135, 203': 11, '0, 94, 184': 12, '51, 63, 72': 13, '0, 53, 80': 14,
                          '190, 202, 234': 15, '221, 121, 117': 16, '197, 70, 68': 17, '218, 41, 28': 18, '177, 162, 202': 19, '142, 127, 174': 20, '236, 208, 181': 21,
                          '240, 196, 160': 22, '250, 170, 141': 23, '248, 173, 109': 24, '229, 158, 109': 25, '189, 154, 122': 26, '181, 129, 80': 27, '255, 105, 0': 28,
                          '166, 85, 35': 29, '107, 53, 41': 30, '105, 63, 35': 31, '78, 53, 36': 32, '120, 78, 144': 33, '248, 229, 154': 34, '213, 200, 151': 35,
                          '239, 182, 97': 36, '255, 209, 0': 37, '255, 163, 0': 38, '229, 155, 220': 39, '177, 78, 181': 40, '174, 164, 111': 41, '174, 184, 98': 42,
                          '181, 189, 0': 43, '239, 215, 229': 44, '94, 126, 41': 45, '231, 147, 183': 46, '207, 87, 138': 47, '51, 85, 37': 48, '45, 200, 77': 49, '0, 154, 68': 50}

    original_img = Image.open(imgpath)
    cropped_img = auto_crop(original_img, baseplate_size)

    # large_img, small_img, num_of_colors, user_palette = image2baseplate(cropped_img, manu2_palette, num_of_colors, baseplate_size)
    small_img, num_of_colors, user_palette = image2baseplate(cropped_img, manu2_palette, num_of_colors, baseplate_size)
    brick_img = image2lego(small_img, image_filename, baseplate_size, finalize=finalize)

    if finalize:
        output_img = image2output(small_img, num_of_colors, image_filename)

    palette = []
    for eachcol in manu2_palette:
        tmp = str(eachcol).replace('[', '')
        tmp = tmp.replace(']', '')
        if eachcol in user_palette:
            palette.append([tmp, 1])
        else:
            palette.append([tmp, 0])
    return palette


def legonize_b(image_filename=None, imgpath=None, baseplate_size=(2, 2), user_colors=[], finalize=False):
    global manu2_palette, manu2_palette_find

    manu2_palette = [[244, 244, 244], [208, 206, 201], [178, 180, 178], [140, 138, 136], [100, 100, 100], [22, 22, 22], [0, 187, 220], [175, 205, 215], [139, 190, 232], [126, 147, 167],
                     [62, 135, 203], [0, 94, 184], [51, 63, 72], [0, 53, 80], [190, 202, 234], [221, 121, 117], [197, 70, 68], [218, 41, 28], [177, 162, 202], [142, 127, 174],
                     [236, 208, 181], [240, 196, 160], [250, 170, 141], [248, 173, 109], [229, 158, 109], [189, 154, 122], [181, 129, 80], [255, 105, 0], [166, 85, 35], [107, 53, 41],
                     [105, 63, 35], [78, 53, 36], [120, 78, 144], [248, 229, 154], [213, 200, 151], [239, 182, 97], [255, 209, 0], [255, 163, 0], [229, 155, 220], [177, 78, 181],
                     [174, 164, 111], [174, 184, 98], [181, 189, 0], [239, 215, 229], [94, 126, 41], [231, 147, 183], [207, 87, 138], [51, 85, 37], [45, 200, 77], [0, 154, 68]]

    manu2_palette_find = {'244, 244, 244': 1, '208, 206, 201': 2, '178, 180, 178': 3, '140, 138, 136': 4, '100, 100, 100': 5, '22, 22, 22': 6, '0, 187, 220': 7,
                          '175, 205, 215': 8, '139, 190, 232': 9, '126, 147, 167': 10, '62, 135, 203': 11, '0, 94, 184': 12, '51, 63, 72': 13, '0, 53, 80': 14,
                          '190, 202, 234': 15, '221, 121, 117': 16, '197, 70, 68': 17, '218, 41, 28': 18, '177, 162, 202': 19, '142, 127, 174': 20, '236, 208, 181': 21,
                          '240, 196, 160': 22, '250, 170, 141': 23, '248, 173, 109': 24, '229, 158, 109': 25, '189, 154, 122': 26, '181, 129, 80': 27, '255, 105, 0': 28,
                          '166, 85, 35': 29, '107, 53, 41': 30, '105, 63, 35': 31, '78, 53, 36': 32, '120, 78, 144': 33, '248, 229, 154': 34, '213, 200, 151': 35,
                          '239, 182, 97': 36, '255, 209, 0': 37, '255, 163, 0': 38, '229, 155, 220': 39, '177, 78, 181': 40, '174, 164, 111': 41, '174, 184, 98': 42,
                          '181, 189, 0': 43, '239, 215, 229': 44, '94, 126, 41': 45, '231, 147, 183': 46, '207, 87, 138': 47, '51, 85, 37': 48, '45, 200, 77': 49, '0, 154, 68': 50}

    original_img = Image.open(imgpath)
    cropped_img = auto_crop(original_img, baseplate_size)

    small_img, user_palette = image2baseplate2(cropped_img, user_colors, baseplate_size)
    brick_img = image2lego(small_img, image_filename, baseplate_size)

    if finalize:
        num_of_colors = len(user_colors)
        output_img = image2output(small_img, num_of_colors, image_filename)

    palette = []
    for eachcol in manu2_palette:
        tmp = str(eachcol).replace('[', '')
        tmp = tmp.replace(']', '')
        if tmp in user_colors:
            palette.append([tmp, 1])
        else:
            palette.append([tmp, 0])

    return palette

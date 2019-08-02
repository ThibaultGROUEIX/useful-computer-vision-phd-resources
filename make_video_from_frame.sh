#!/usr/bin/env sh
# Author : Thibault GROUEIX 

# prepare file names (they need to be 001,002, ...010,. and not 9,10)
# you can either save them with the right name or use and adapt the following lines 

# for i in weight[0-9][0-9].png; do mv $i ${i//weight/weight0}; done

# You might want to tonemap your data (but it's problably best to do it before saving the images by Im = (Im-min(Im))/(max(Im)+ Eps)

# for i in weight*; do autotone $i ${i//weight/weight_toned}; done

# create a video from a list of images
cd
cd $1
ffmpeg -framerate 20 -i weight%3d.png output.mp4

# prepare the ground truth image with a label with ImageMagick convert tool if you want, but you have to resize the image as well.

# convert -resize 200X200 ./patchgaussian.jpg patchgaussian.png
# convert -pointsize 10 -fill white -draw 'text 70,185 "Ground truth" ' patchgaussian.png patchgaussian_withtext.png
# for i in weight*; do convert -resize 200X200  $i $i; done
cp /home/user/projects/website/home/JBF_sup_mat/NYUdataset-learningSpatialWeight_originalNet/patchgaussian.jpg ./
# add the ground truth on the right as a texture
ffmpeg -i output.mp4 -i ./patchgaussian.jpg -filter_complex "[0:v:0]pad=iw*2:ih+1[bg]; [bg][1:v:0]overlay=w" weight_learned.mp4 

cp ./weight_learned.mp4 "/home/user/${2}weight_learned.mp4"
cd
# Done
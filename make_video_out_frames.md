# Create a video out of frames with ffmpeg

### First step : install **ffmpeg** 

You can either do it with apt-get or install it from the [sources](https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu).
(begin{alert} : "purist close your eyes") I usually favor apt-get unless I have no other choices because it's just more simple (end{alert}).

``` sh
$ sudo apt-get install ffmpeg
``` 

To edit your frames (resize, add legend, change format, contrast...), it can be a good idea to install or update ImageMagick. It's a very useful tool that allow you to view your images (```eog my_image```), to view and apply basic modifications (```eog my_image```), edit your image with a command line (```convert -resize 50X50 my_image my_new_image```), or apply the same modifications to a group of images ((```mogrify -sigmoidal-contrast 5,50% my_images*.png```).

To install it, just run :

``` sh
$ sudo apt-get install imagemagick
``` 

If you need more advance image editing, Gimp is a good choice.

### Second step : have a correct nomenclature  

You have to prepare the names of your files. They have to be ordered like this for exemple : 001,002, ...010,...,100 instead of  7,8,9,10,11,...,100. Also ffmpeg doesn't support missing numbers in the list.

You can edit the following line to fit your need :
``` sh
$ for i in my_image[0-9].png; do mv $i ${i//my_image/my_image0}; done
```

It replaces every occurence of "my_image" by "my_image0" in the selected list of images. 
Obviously, it's probably best to save your images with the correct nomenclature already.

### Third step : apply any filter to your images

Resize, tone-mapping...

``` sh
$ for i in my_image*.png; do whatever; done
```

### Fourth step : Now the real deal

``` sh
$ ffmpeg -framerate 20 -i weight%3d.png output.mp4
```

'%3d' refers to the number of digits in your nomenclature.

### Fifth step : Edit your video

If your observing the convergence of a phenomenon over time, you might want to put the converged image next to the converging images. You can do it like that :

``` sh
$ ffmpeg -i output.mp4 -i ./converged_image.jpg -filter_complex "[0:v:0]pad=iw*2:ih+1[bg]; [bg][1:v:0]overlay=w" output_with_converged_image.mp4 
```

That's it ! The script I use to do this automatically is [here](https://github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/tree/master/make_video_out_frames.md). Takes two arguments, the directory with the frames, and the directory where I want the created video.

[![Analytics](https://ga-beacon.appspot.com/UA-91308638-2/github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/make_video_out_frames.md?pixel)](https://github.com/ThibaultGROUEIX/useful-computer-vision-phd-resources/)

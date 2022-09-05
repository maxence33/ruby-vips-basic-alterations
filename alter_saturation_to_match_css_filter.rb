# Here we are basically switching our image to LCH color space
# each pixel now has a value from 0 to 255 for Luminance,Chroma Hue
# we are then using the Linear method from http://libvips.github.io/ruby-vips/Vips/Image.html#linear-instance_method 
# in order to alter our image 

# my test case was to reproduce the saturatin obtained from this CSS rule "filter: saturate(x)" https://developer.mozilla.org/en-US/docs/Web/CSS/filter
# x being the value passed to the saturate filter, it is actually a multiplicator of the pixel saturation (or chroma)

# then x is applied to our first array of 3 bytes
# Why ? Just because the Vips::Image linear method has the first argument multiplied to our pixel
# the second array being additive is set to [0,0,0] so no additional saturation is added

# Also you can see that our saturation multiplicator is added the second value of our array
# This is because in LCH colorspace, it is the first byte that corresponds to the luminance
# If we had added x to all values of the array, then Luminance (brightness) and Hue would have been altered too

require 'vips'

x = 1.2

im = Vips::Image.new_from_file "pic.jpg", access: :sequential
im = im.colourspace(:lch)
im = im.linear([1,x,1],[0,0,0])       
im.write_to_file "test.jpg"

# your output image should be as saturated as an image applied ehe CSS rule : "filter: saturate(1.2)"

# Here we are basically switching our image to LCH color space
# each pixel now has a value from 0 to 255 for Luminance,Chroma Hue
# we are then using the Linear method from http://libvips.github.io/ruby-vips/Vips/Image.html#linear-instance_method 
# in order to alter our image 

# my test case was reproducing the brightness applied by CSS "filter: brightness(x)" https://developer.mozilla.org/en-US/docs/Web/CSS/filter
# x being the value passed to the brightness filter, it is actually a multiplicator of the pixel brightness

# then x is applied to our first array of 3 bytes
# Why ? Just because the Vips::Image linear method has the first argument multiplied to our pixel
# the second array being additive is set to [0,0,0] so no additional brightness is added

# Also you can see that our brightness multiplicator is added the first value of our array
# This is because in LCH colorspace, it is the first byte that corresponds to the luminance
# If we have added x to all values of the array, then Chroma and Hue would have been altered too

require 'vips'

x = 1.2

im = Vips::Image.new_from_file "pic.jpg", access: :sequential
im = im.colourspace(:lch)
im = im.linear([x,1,1],[0,0,0])       # here 1.2 is the brightness
im.write_to_file "test.jpg"

# your output image should be brighter by the original by the same amount as the CSS rule : "filter: brightness(1.2)"


# It seems W3 is keeping the image as RGB and apply the value to each pixel
# please see here: https://www.w3.org/TR/filter-effects/#brightnessEquivalent

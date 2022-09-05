# This one has been tough
# The path followed is described in this Stack Overflow post : https://stackoverflow.com/questions/73601395/adjusting-contrast-in-vips-the-same-way-as-the-matching-css-filter

# John Cupitt has really helped me understand the underlying code behind W3 logic 

# <filter id="contrast">
#   <feComponentTransfer>
#       <feFuncR type="linear" slope="[amount]" intercept="-(0.5 * [amount]) + 0.5"/>
#       <feFuncG type="linear" slope="[amount]" intercept="-(0.5 * [amount]) + 0.5"/>
#       <feFuncB type="linear" slope="[amount]" intercept="-(0.5 * [amount]) + 0.5"/>
#   </feComponentTransfer>
# </filter>


# In the end it is something quite simple and should be pretty fast even on big images 

require 'vips'

divider = 256
contrast = 1.5
intercept = 0.5-(contrast*0.5)

im = Vips::Image.new_from_file "pic.jpg", access: :sequential
im = ((im * contrast / divider) + intercept)*divider
im.write_to_file "test.jpg"

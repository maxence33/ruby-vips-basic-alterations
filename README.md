# ruby-vips-basic-alterations

This repo only function is to provide basic VIPS algorithm in order to perform multiple alterations to your images. It kinda extends John Cupitt examples for Ruby Vips that can be found here : https://github.com/libvips/ruby-vips/wiki/Examples or here : https://github.com/libvips/ruby-vips/tree/master/example

## Configuration

You need 
- a Rails application with gem "ruby-vips" in your gemfile 
- Vips installed on your platform.

To install VIPS on Ubuntu you can : 
```
sudo apt update
sudo apt -y install libvips-dev
```

For a specific version of Libvips I let check Vips website https://www.libvips.org/install.html and these tar packages too : https://github.com/libvips/libvips/releases

*To install a tar package you may check this page https://www.itprotoday.com/development-techniques-and-management/how-install-targz-file-ubuntu-linux*



## using the scripts

All scripts here are written as little code snippets to perform from a console. 

They expect that there is Jpeg image called **"pic.jpg" at the root of your application**. And they will **output an image called "test.jpg" at the root of your Rails application**. If you have similar files at the root of your app, make sure you rename them before running the scripts, or tweak the scripts so that your files are not overriden. 

You can start a Rails console from your app, `require vips` and then copy the script to your console.
. 

## Contributing

I wrote those scripts as a reminder of the logic to perform certain image alterations. 
They are done from JPG files.

They may not be optimized nor work for different image types other than JPG. 

**Don't hesitate to open cases or do pull requests to improve them.**


# Current list of scripts

- alter brightness (to mimic CSS filter brightness)
- alter saturation (to mimic CSS filter saturate)
- alter contrast (to mimic CSS filter contrast)

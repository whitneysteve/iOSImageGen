gem 'rmagick'

require 'RMagick'

if __FILE__ == $0

  input_file_name = ARGV.shift
  output_dir = ARGV.shift

  resses = [
    [320, 480],
    [640, 960],
    [640, 1136],
    [750, 1334],
    [768, 1004],
    [768, 1024],
    [828, 1792],
    [1024, 748],
    [1024, 768],
    [1125, 2436],
    [1242, 2208],
    [1242, 2688],
    [1536, 2008],
    [1536, 2048],
    [1792, 828],
    [2048, 1496],
    [2048, 1536],
    [2208, 1242],
    [2436, 1125],
    [2688, 1242],
  ]

  resses.each { |res|
    width = res[0]
    height = res[1]
    res_key = "#{width}x#{height}"
    puts "Generating #{res_key}"

    image = Magick::Image.read(input_file_name).first
    newimg = image.resize_to_fill(width, height)
    newimg.write("#{output_dir}/#{res_key}.png")
  }

end

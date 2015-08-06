require 'chunky_png'

if __FILE__ == $0

  color = ARGV.shift
  output_dir = ARGV.shift

  resses = {
    'ios8_iphone_retina_hd_5.5_landscape' => [2208, 1242],
    'ios8_iphone_retina_hd_5.5_portrait' => [1242, 2208],
    'ios8_iphone_retina_hd_4.7_portrait' => [750, 1334],
    'ios78_iphone_retina_4_portrait' => [640, 1136],
    'ios78_iphone_2x_portrait' => [640, 960],
    'ios78_ipad_2x_landscape' => [2048, 1536],
    'ios78_ipad_1x_landscape' => [1024, 768],
    'ios78_ipad_2x_portrait' => [1536, 2048],
    'ios78_ipad_1x_portrait' => [768, 1024],
    'ios56_iphone_retina_4_portrait' => [640, 1136],
    'ios56_iphone_2x_portrait' => [640, 960],
    'ios56_iphone_1x_portrait' => [320, 480],
    'ios56_ipad_2x_landscape' => [2048, 1536],
    'ios56_ipad_1x_landscape' => [1024, 768],
    'ios56_ipad_2x_landscape_no_status' => [2048, 1496],
    'ios56_ipad_1x_landscape_no_status' => [1024, 748],
    'ios56_ipad_2x_portrait' => [1536, 2048],
    'ios56_ipad_1x_portrait' => [768, 1024],
    'ios56_ipad_2x_portrait_no_status' => [1536, 2008],
    'ios56_ipad_1x_portrait_no_status' => [768, 1004],
  }

  resses.keys.each { |res_key|
    puts "Generating #{res_key}"
    res = resses[res_key]
    width = res[0]
    height = res[1]
    png = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color.from_hex(color))
    png.save("#{output_dir}/#{res_key}.png", :interlace => true)
  }

end

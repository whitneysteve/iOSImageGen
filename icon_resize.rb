gem 'rmagick'

require 'RMagick'

if __FILE__ == $0

  input_file_name = ARGV.shift
  output_dir = ARGV.shift
  three_x = ARGV.shift == '3x'

  resses = {
    'ios910_ipa_prod_2x' => 167,
    'ios78_iphone_notification_1x' => 20,
    'ios78_iphone_notification_2x' => 40,
    'ios78_iphone_notification_3x' => 60,
    'ios78_iphone_3x' => 180,
    'ios78_iphone_2x' => 120,
    'ios56_iphone_2x' => 114,
    'ios56_iphone_1x' => 57,
    'ios78_iphone_spotlight_3x' => 120,
    'ios78_iphone_spotlight_2x' => 80,
    'ios56_iphone_settings_3x' => 87,
    'ios56_iphone_settings_2x' => 58,
    'ios56_iphone_settings_1x' => 29,
    'ios78_ipad_2x' => 152,
    'ios78_ipad_1x' => 76,
    'ios56_ipad_2x' => 144,
    'ios56_ipad_1x' => 72,
    'ios56_ipad_spotlight_2x' => 100,
    'ios56_ipad_spotlight_1x' => 50,
    'ios78_ipad_spotlight_2x' => 80,
    'ios78_ipad_spotlight_1x' => 40,
    'ios78_ipad_notifications_1x' => 20,
    'ios78_ipad_notifications_2x' => 40,
    'ios56_ipad_settings_2x' => 58,
    'ios56_ipad_settings_1x' => 29,
    'ios8_carplay' => 120,
    'itunes_2x' => 1024,
    'itunes_1x' => 512,
    'apple_watch_notification_38' => 48,
    'apple_watch_notification_42' => 55,
    'apple_watch_settings_2x' => 58,
    'apple_watch_settings_3x' => 87,
    'apple_watch_home' => 80,
    'apple_watch_long_look_42' => 88,
    'apple_watch_short_look_38' => 172,
    'apple_watch_short_look_42' => 196
  }

  if three_x
    image = Magick::Image.read(input_file_name).first
    puts image.width
    puts image.height
  else
    resses.keys.each { |res_key|
      puts "Generating #{res_key}"
      size = resses[res_key]
      image = Magick::Image.read(input_file_name).first
      image.change_geometry!("#{size}x#{size}") { |cols, rows, img|
        newimg = img.resize(cols, rows)
        newimg.write("#{output_dir}/#{res_key}.png")
      }
    }
  end


end

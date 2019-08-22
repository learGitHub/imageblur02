
class Image
  
  def initialize (picture)
    @picture = picture
  end

  def output_image
    @picture.each do |row|
      puts row.join {|row| print row}
    end
  end

  def blur
    blur_pos = []
    @picture.each_with_index do |row, y_idx|
      row.each_with_index do |num, x_idx|
         #puts "#{ro_idx} - #{nu_idx} - #{num}"
         blur_pos << [y_idx, x_idx] if num == 1
         #print "found_ones: #{blur_pos}" if num == 1
      end  
    end 

    blur_pos.each do |pos|
      x = pos[1] 
      y = pos[0] 
      @picture[y][x + 1] = 1 if x + 1 <= @picture[y].length - 1
      @picture[y][x - 1] = 1 if x - 1 >= 0
      @picture[y + 1][x] = 1 if y + 1 <= @picture.length - 1
      @picture[y - 1][x] = 1 if y - 1 >= 0
    end
  end


end

image = Image.new([ 
  [0, 0, 0, 0], 
  [0, 0, 0, 0], 
  [0, 0, 0, 0], 
  [0, 1, 0, 0], 
  [0, 0, 0, 1], 
  [0, 0, 0, 0] 
])
image.blur
image.output_image


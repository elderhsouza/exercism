defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    do_palette_bit_size(color_count, 1)
  end

  defp do_palette_bit_size(color_count, bit_count) do
    cond do
      Integer.pow(2, bit_count) >= color_count -> bit_count
      true -> do_palette_bit_size(color_count, bit_count + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)
    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)

    case picture do
      <<pixel::size(^bit_size), _rest::bitstring>> -> pixel
      _ -> nil
    end
  end

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)

    case picture do
      <<_pixel::size(^bit_size), rest::bitstring>> -> rest
      _ -> <<>>
    end
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end

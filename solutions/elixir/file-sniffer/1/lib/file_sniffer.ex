defmodule FileSniffer do
  @exe_type "application/octet-stream"
  @bmp_type "image/bmp"
  @png_type "image/png"
  @jpg_type "image/jpg"
  @gif_type "image/gif"

  def type_from_extension(extension) do
    case extension do
      "exe" -> @exe_type
      "bmp" -> @bmp_type
      "png" -> @png_type
      "jpg" -> @jpg_type
      "gif" -> @gif_type
      _ -> nil
    end
  end

  def type_from_binary(file_binary) do
    case file_binary do
      <<0x7F, 0x45, 0x4C, 0x46, _::binary>> -> @exe_type
      <<0x42, 0x4D, _::binary>> -> @bmp_type
      <<0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A, _::binary>> -> @png_type
      <<0xFF, 0xD8, 0xFF, _::binary>> -> @jpg_type
      <<0x47, 0x49, 0x46, _::binary>> -> @gif_type
      _ -> nil
    end
  end

  def verify(file_binary, extension) do
    binary_type = type_from_binary(file_binary)
    extension_type = type_from_extension(extension)
    error_result = {:error, "Warning, file format and file extension do not match."}

    case [binary_type, extension_type] do
      [nil, nil] -> error_result
      [^binary_type, ^binary_type] -> {:ok, binary_type}
      _ -> error_result
    end

    # if binary_type == extension_type do
    #   {:ok, binary_type}
    # else
    #   {:error, "Warning, file format and file extension do not match."}
    # end
  end
end

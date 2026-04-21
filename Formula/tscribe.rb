class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.1.2"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.1.2/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "f6f2678bea793b16b33c0f378dc5e1897ead4641ccace0fe1f4b5471b0e62880"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.1.2/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "e390b5630b6759e82200dc257f4e9582b389d2d554a30c652ebb821891ce2c07"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.1.2/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0f3559910a21138c6c4a34e2bedb5c977daee0242e2278d5cb545aaac1427d1"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.1.2/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bc06a5ad7e3fb01f7541ab8d42f6917238d1c51de3f14cc2dafae6af8c40750"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

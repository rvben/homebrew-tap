class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.2.1"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.1/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "70300b507a8c1b830e3c5a5a47c52ec25163c15b3faca2e8dd2dba7aff98b7e2"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.1/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "b4b59d6223e02e3122052ed726faa752498498bf015ae1b0f0397fdf8fff1e33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.1/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1dd222948cdaa79d1f3390a49f7039ac3c38980e7bedbdc192bd43601e185b11"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.1/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdc85bfd3fc9093ca0364740fcdea38605c2f16f0af691201c2a3fdc6710114d"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

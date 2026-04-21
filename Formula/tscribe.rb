class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.1.1"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.1.1/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "a7045a52c2527e848dc4d7c045210853dd4f75b6ca6d31b1b58d5e9798844633"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.1.1/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "f22208b4a3e69e1079fcb606bfc2c6fd8c69b4fd96c4c1784ee02ec181e06df3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.1.1/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8801d8b0ded30b65c94c189828b8694da09591a83f8cfaeb5f18b41a201f01ed"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.1.1/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68cc65054893aeb1b53ce1e9e7f0a41c8321273b293c39d2e22dc869f4f24384"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

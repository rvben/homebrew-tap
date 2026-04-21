class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.2.0"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.0/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "3cdf231a9880d3ba838f89bc4506897b85ad13699562e0ce2d5f67fae8d5fb9c"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.0/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "94abe6df0f7e696d49e058467c6e7f008d8ad2b0428d3ea2158b9c358b477a38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.0/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "87dabc68f7a11d99d744e9244ea54c57dcc635023e8798e44e260faf9ac11039"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.0/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41aeba76048976cc84a6efec082af6c2474e75945fd6e04cef840a97d0503c6c"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.2.2"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.2/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "2f161c15c3846c6cdf1a8fd07aef44e77bed81351f58a7c1d951d2341dc0e7e9"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.2/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "80f37dcbe424cbb83525ce4c84a8d2b22fd7898cd7055cbb08c2ed8fed3f69b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.2/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa28002df2a1fdc223c482c3d88cd67420bff79bed9120e83c81e53af70efb53"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.2/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4848235bb57bd8c63103668fab8e84445186394d9231ab208b8b2ffdedc08475"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

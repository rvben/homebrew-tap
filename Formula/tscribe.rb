class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.2.5"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.5/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "ef89a0db961964be3648fe914b0fdbcc805c2e7cfae92fc04f5ed1ff2a707d99"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.5/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "19209370fecff8a705e31d17c1a95c8bb02615971e9f73e287de0fb9dcfab20a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.5/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a3ff346fb161c0bc59f581fcc373bafc80347707f71801e6448e3e5e2424026"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.5/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e557689557c0f8cd03e243003dd3b4a52b43be3ec70d7f6ff5e417b531d8dc01"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

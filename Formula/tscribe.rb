class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.2.4"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.4/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "b8abc0ee6c183b8c2cec81878381f1dca9ed77c3c41343ed74247cc2a6072d6b"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.4/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "c0260e82ff581e09cc63b8fc09b9075ed79ba8ee74a2ebdd42530901ad67820b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.4/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a69641f1694c59e91b2a1ac19ad7f88fdf62b56778f4c0cfa4a5e48191ba8ba6"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.4/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9111cdeebe9b00075ae02d546922f9ffd9c32c5afc020473a86f17a5e54d6956"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

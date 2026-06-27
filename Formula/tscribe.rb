class Tscribe < Formula
  desc "Transcribe any video/audio URL into agent-friendly markdown using whisper.cpp"
  homepage "https://github.com/rvben/tscribe"
  version "0.2.3"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.3/tscribe-aarch64-apple-darwin.tar.gz"
      sha256 "fc26d442b2f73f220b8680063c3f5edbbcdb3a2d60c7ca94a662db7ee7f61a59"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.3/tscribe-x86_64-apple-darwin.tar.gz"
      sha256 "14bd092372feb358e6c39870924ed32fba19c399fbda0a5b7bb1c89f5f8ff641"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/tscribe/releases/download/v0.2.3/tscribe-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2769d32bbbf4c79313aab47d36aff830885a7ff37a76aeea21a087a241de1303"
    else
      url "https://github.com/rvben/tscribe/releases/download/v0.2.3/tscribe-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d4bd3119e688fd0ff606a289454206a8ddbdda8ba29ef33e51ce48fe619abd0b"
    end
  end

  def install
    bin.install "tscribe"
  end

  test do
    system "#{bin}/tscribe", "--version"
  end
end

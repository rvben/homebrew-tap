class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.6/vership-v0.5.6-aarch64-apple-darwin.tar.gz"
      sha256 "a848838996c9f7261d4ef594d6da68fda9168619dfb248528c3e8f34b8119d44"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.6/vership-v0.5.6-x86_64-apple-darwin.tar.gz"
      sha256 "dec2d20c6c71841a13c78d661ecbe718d38f795ffa2668571bbe93ebbf3814cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.6/vership-v0.5.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "866553cb623f287b363a022deefdbf0dfeec745af34a62f65ed0697e88a9927a"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.6/vership-v0.5.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b827e70cfbf9a90bd9b057b99189df4686a21c279ed0a75a6ff9c9375cb35ff7"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end

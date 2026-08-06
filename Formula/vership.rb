class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.16/vership-v0.5.16-aarch64-apple-darwin.tar.gz"
      sha256 "0f9ad15040eaa44b26a2fad48f37a5e3b3db3377003c23d5de6e031a42773639"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.16/vership-v0.5.16-x86_64-apple-darwin.tar.gz"
      sha256 "9c2c39915ed8c75960907b76d94674bac33ada50b8c079687c53bdab0e5b8005"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.16/vership-v0.5.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6543c7579013c511946f14290b79e456d7b7d60208e58a8c0b1530d2df594ac"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.16/vership-v0.5.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8539f7c1898924ab8f648870bfda5e6b13fc83704020ae794c498ed3a836cdff"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end

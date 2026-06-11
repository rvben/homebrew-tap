class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.4/vership-v0.5.4-aarch64-apple-darwin.tar.gz"
      sha256 "418a7d358c4fdd1b0f5f27a0b6e25eb72a840c26c4de65731ce45f09fe109db8"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.4/vership-v0.5.4-x86_64-apple-darwin.tar.gz"
      sha256 "7ff0d1a0411f78fbfa41341cc2e75ba45ecac09ab1b63972f70aa74003ab359d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.4/vership-v0.5.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e921ebab64b88a94e386c86db2a93f331ed43486dea1970d67d92d6f95101349"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.4/vership-v0.5.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a40d39ede33c3cf696837610d58379385389f11b5e4dada0b4975eb8a6482d9e"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end

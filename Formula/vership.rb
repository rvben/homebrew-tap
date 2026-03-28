class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.0/vership-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d522bc7fea0da16af77ef801866809daa228fa19ed26597a4de934da6e171204"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.0/vership-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "7b5c6dae24e2cf8a2460b40f2cc61dcc58593cdaf48685a4656c0756b7553e7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.4.0/vership-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e898ba8b08b7c801b3bf221a11b7bdee9f658b035507f027f0f9c5fdab64c2f3"
    else
      url "https://github.com/rvben/vership/releases/download/v0.4.0/vership-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "917f2c351f1809495b9f8a6d0e422d8fedc2bce675191c12a65376c6f6f95f5c"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end

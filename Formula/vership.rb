class Vership < Formula
  desc "Multi-target release orchestrator"
  homepage "https://github.com/rvben/vership"
  version "0.5.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.9/vership-v0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "eb34ebf54d2859290e8b49dba51d8d322b2e6419f5eaedcd8ac3b1b949c855ab"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.9/vership-v0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "99475ab114eb1e64720e75a1005ad6b1118a805a566510e88dd14430e6254611"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/rvben/vership/releases/download/v0.5.9/vership-v0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1b8e408a1ee1df99d8cf3b504855b8709beb340dd1d12fb4865397a0087954c"
    else
      url "https://github.com/rvben/vership/releases/download/v0.5.9/vership-v0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89fe0bfdf7b2487051644852f3b32dbc0e8ee1a8163361b70d84cd513e603590"
    end
  end

  def install
    bin.install "vership"
  end

  test do
    system "#{bin}/vership", "--version"
  end
end
